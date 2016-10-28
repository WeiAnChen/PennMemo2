json.array!(@nursing_activities) do |nursing_activity|
  json.extract! nursing_activity, :id
  json.url nursing_activity_url(nursing_activity, format: :json)
end
