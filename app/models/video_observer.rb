class VideoObserver < ActiveRecord::Observer
  def before_save(resource)
    video = Yt::Video.new url: resource.link
    resource.uid = video.id
    resource.title = video.title
    resource.author = video.channel_title
    # resource.duration = video.duration
    resource.duration = Time.at(video.duration).utc.strftime("%H:%M:%S")
  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end
