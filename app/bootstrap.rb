module Bootstrap

  def self.config
    OpenStruct.new \
      :redis      => yaml['redis'],
      :auth_token => yaml['auth_token'],
	  :db_adapter => yaml['database']['adapter'],
	  :db_host    => yaml['database']['hostname'],
	  :db_user    => yaml['database']['username'],
	  :db_pass    => yaml['database']['password'],
	  :db         => yaml['database']['database']
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
