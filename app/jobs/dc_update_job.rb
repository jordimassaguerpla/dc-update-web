class DcUpdateJob < ActiveJob::Base
  queue_as :default

  def perform(dc_image)
    puts "run update on image #{dc_image.full_name}"
    run = Run.new
    run.start = Time.now
    run.success = dc_image.run_update
    run.stop = Time.now
    run.save
    dc_image.runs << run
    dc_image.save
  end
end
