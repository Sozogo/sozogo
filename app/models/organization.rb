class Organization < User
  validates_presence_of :organization_name, :organization_type, :address, :city
  validates :statement_of_beliefs, acceptance: true
end
