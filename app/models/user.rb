class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  has_one :docker_cfg
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, email: true

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

  def self.from_omniauth(auth)
    return nil if auth.nil?
    return nil unless auth["provider"] && auth["uid"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
    end 
  end
 
end
