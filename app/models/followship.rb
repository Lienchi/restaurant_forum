class Followship < ApplicationRecord
  belongs_to :user
  belongs_to :following, calss_name: "User"
end
