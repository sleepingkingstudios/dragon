require 'byebug'

class AssetTasks < Thor
  namespace :assets

  desc 'compile FILES', 'Compiles the specified asset(s)'
  method_option :output,  :type => :string,  :required => true, :aliases => '-o'
  method_option :package, :type => :string,                     :aliases => '-p'
  method_option :verbose, :type => :boolean, :default => false, :aliases => '-v'
  def compile *paths
    puts "Compiling CoffeeScript to #{options['output']}"

    resolver      = DependencyResolver.new 'src'
    resolved_list = []

    file_names = []
    paths.uniq.each do |path|
      file_names.concat extract_file_names(path)
    end # each

    puts "Source Files:\n- #{file_names.join("\n- ")}"

    resolved_list = resolver.resolve(*file_names)

    puts "Resolved Dependencies:\n#{resolved_list.map { |str| "- #{str}" }.join("\n") }" if options['verbose']

    if options['package'] && options['package'].length > 0
      package_name = camelize(options['package'])
      puts "Appending package definition for module #{package_name}"

      package_file = "tmp/#{underscore(package_name)}_package.coffee"
      File.write package_file, <<-PACKAGE
if typeof(exports) != 'undefined'
  if typeof module != 'undefined' && module.exports
    exports = module.exports = #{package_name}

  exports.#{package_name} = #{package_name}
else
  this.#{package_name} = #{package_name}
      PACKAGE

      resolved_list << package_file
    end # if

    output_file = options['output']
    `cat #{resolved_list.join(' ')} | coffee --compile --stdio > #{output_file}`

    puts "Compiled JavaScript written to #{output_file}"

    Dir[File.join 'tmp', '*'].each { |file_name| File.delete(file_name) }
  end # method compile

  desc 'package FILES', 'Creates a CommonJS package exporting the specified module.'
  method_option :verbose, :type => :boolean, :default => false, :aliases => '-v'
  def package package_name, *paths
    puts "Building package #{camelize package_name}..."

    package_name      = underscore package_name
    package_directory = "src/#{package_name}"
    root_file         = "src/#{package_name}.coffee"
    output_file       = "app/#{package_name}.js"

    invoke :compile, [root_file, package_directory], { :output => output_file, :package => package_name }
  end # method package

  private

  def camelize string
    string.gsub(/._./) { |match| "#{match[0]}#{match[2].capitalize}" }.tap { |str| str[0] = str[0].capitalize }
  end # method camelize

  def extract_file_names file_path
    file_names = []

    if File.directory?(file_path)
      directory_files = Dir[File.join file_path, '*']

      directory_files.each do |file_path|
        file_names.concat extract_file_names(file_path)
      end # each
    elsif File.file?(file_path)
      file_names << file_path
    end # if

    file_names
  end # method extract_file_names

  def underscore string
    string.gsub(/[a-z][A-Z]/) { |match| "#{match[0]}_#{match[1]}".downcase }.downcase
  end # method underscore

  class MissingDependencyError < StandardError; end

  class DependencyResolver
    REQUIRE_PATTERN = /\A#= require (?<name>[a-z0-9_\/]+)\z/

    def initialize root_path, *additional_paths, **options
      defaults = { :file_extensions => ['.coffee', '.js.coffee', '.litcoffee'] }
      options  = {} unless options.is_a?(Hash)
      defaults.each do |key, value|
        options[key] = value unless options.has_key?(key)
      end # each

      @file_extensions = options[:file_extensions]
      @root_paths = additional_paths.unshift(root_path)
    end # method initialize

    attr_reader :file_extensions, :root_paths

    def file_pattern
      name_capture = "(?<name>[a-z0-9_\/]+)"
      extension_capture = "(?<file_extension>" +
        file_extensions.join("|") + ")"
      pattern = /\A#{name_capture}#{extension_capture}/
    end # method file_pattern

    def resolve *file_names
      file_list = file_names.dup
      resolved  = []

      while !file_list.empty?
        source_file = find_file file_list.first

        resolve_dependencies source_file, file_list, resolved
      end # while

      resolved
    end # method resolve

    private

    def file_extension? file_path
      file_path =~ /#{file_extensions.map { |str| Regexp.escape str }.join('|')}\z/
    end # method file_extension

    def find_file name
      if file_extension?(name)
        return find_file_with_extension(name)
      else
        file_extensions.each do |file_extension|
          return find_file_with_extension("#{name}#{file_extension}")
        end # each
      end # if-else
    end # find_file

    def find_file_with_extension file_name
      return file_name if File.exists?(file_name)

      root_paths.each do |root_path|
        file_path = File.join(root_path, file_name)

        return file_path if File.exists?(file_path)
      end # each

      raise MissingDependencyError.new "Unable to locate file for name \"#{file_name}\""
    end # each

    def resolve_dependencies file_name, source_list, target_list
      begin
        contents = File.read file_name
      rescue Errno::ENOENT
        raise MissingDependencyError.new "Unable to locate file at \"#{file_name}\""
      end # begin-rescue

      dependencies = []

      contents.split("\n").each do |line|
        if match = REQUIRE_PATTERN.match(line)
          dependencies << match[:name]
        end # if
      end # contents

      dependencies.each do |dependency|
        dependent_file = find_file dependency

        unless target_list.include?(dependent_file)
          resolve_dependencies dependent_file, source_list, target_list
        end # unless
      end # each

      source_list.delete(file_name)
      target_list << file_name
    end # method resolve_dependencies
  end # class
end # class