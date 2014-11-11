class Organization < User
  validates_presence_of :organization_name, :organization_type, :address
  validates :statement_of_beliefs, acceptance: true
end
