require "../../db/config"
require "./stop"

class Travel < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary64,
    created_at: Time?,
    updated_at: Time?
  )

  has_many :stops, Stop, dependent: :destroy
end
