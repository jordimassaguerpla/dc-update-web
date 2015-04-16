class DcUpdateJob < ActiveJob::Base
  queue_as :default

  def perform(dc_image)
    puts "run update on image #{dc_image.full_name}"
    puts "set docker configuration"
    return if dc_image.user_id.nil?
    user = User.find_by_id(dc_image.user_id)
    return if user.nil?
    open("#{Dir.home}/.dockercfg", "w") do |f|
      f.write(user.dockerconf.to_json)
    end
    run = Run.new
    run.start = Time.now
    run.success = dc_image.run_update
    run.stop = Time.now
    run.save
    dc_image.runs << run
    dc_image.save
  end
end
