require "../../db/config"
require "./travel"

class Stop < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary64,
    travel_id: Int64,
    stop: Int64,
    created_at: Time?,
    updated_at: Time?
  )

  belongs_to :travel, Travel
end
