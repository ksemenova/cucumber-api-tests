require 'yaml'

class Settings

  def self.settings
    unless @@settings
      @@settings = load_file(File.join(File.dirname(__FILE__), 'settings.yml'))
    end
    @@settings
  end

  private

  @@settings = nil

  def self.load_file(file_name)
    YAML.load(ERB.new(File.read(file_name)).result)
  end

end