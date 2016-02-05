json.array!(@videos) do |video|
  json.extract! video, :id, :title, :author, :link, :duration
  json.url video_url(video, format: :json)
end
