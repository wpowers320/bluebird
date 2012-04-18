class User < ActiveRecord::Base
  attr_accessible :created_at, :email, :handle, :updated_at
end
