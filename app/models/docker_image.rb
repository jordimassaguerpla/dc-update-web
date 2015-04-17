class DockerImage < ActiveRecord::Base
  has_many :runs
  validates :user_name, presence: true
  validates :repository_name, presence: true
  # TODO: manage logging
  def run_update()
    puts "Running dc-update #{full_name}"
    system "dc-update #{full_name}"
  end
  def full_name
    "#{user_name}/#{repository_name}"
  end
end
