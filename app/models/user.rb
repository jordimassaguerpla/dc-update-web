class User < ActiveRecord::Base
  has_one :docker_cfg

  def dockerconf
    return {} if docker_cfg_id.nil?
    dc = DockerCfg.find(docker_cfg_id)
    return {} if dc.nil?
    dockerconf= {
   	 dc.url =>
	   {
	     "auth" => dc.auth,
	     "email" => dc.email
	   }
    }
  end
end
