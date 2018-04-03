class User < ActiveRecord::Base
  has_secure_uuid
  has_secure_uuid :identifier
end
