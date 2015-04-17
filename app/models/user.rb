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
end
