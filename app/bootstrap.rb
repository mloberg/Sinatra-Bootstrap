module Bootstrap

  def self.config
    OpenStruct.new \
      :redis      => yaml['redis'],
      :auth_token => yaml['auth_token']
  end

  private

  def self.yaml
    if File.exists? 'config/bootstrap.yml'
      @yaml ||= YAML.load_file('config/bootstrap.yml')
    else
      {}
    end
  end

end
