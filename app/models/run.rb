class Run < ActiveRecord::Base
  belongs_to :docker_image
  validates :start, presence: true
  validates :stop, presence: true
  validates :success, presence: true
end
