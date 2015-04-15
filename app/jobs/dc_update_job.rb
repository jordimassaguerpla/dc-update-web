class DcUpdateJob < ActiveJob::Base
  queue_as :default

  def perform(dc_image)
    puts "run update on image #{dc_image.full_name}"
    dc_image.run_update
  end
end
