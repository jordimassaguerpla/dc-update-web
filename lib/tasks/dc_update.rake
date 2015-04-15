namespace :dc_update do
  desc "Update all docker containment images"
  task run: :environment do
    DockerImage.all.each do |dc_image|
      puts "schedule updating image #{dc_image.full_name}"
      DcUpdateJob.perform_later dc_image
    end
  end

end
