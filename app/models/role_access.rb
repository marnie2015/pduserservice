class RoleAccess < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :access
end
