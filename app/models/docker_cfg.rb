class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class DockerCfg < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true
  validates :auth, presence: true
  validates :email, presence: true
  validates :email, email: true
end
