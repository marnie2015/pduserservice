# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'bcrypt'

Access.create([
  { access_type: 'View' },
  { access_type: 'View / Edit' },
  { access_type: 'View / Add' },
  { access_type: 'View / Add / Edit' }
])

Role.create([
  { category: 'Maintenance', sub_category: 'User Account', url: '/users' },
  { category: 'Application', sub_category: 'CTPL', url: '/ctpl' },
  { category: 'Application', sub_category: 'OFW', url: '/ofw' }
])

Agent.create([
  { cde: '1234', fullname: 'MLHUILLIER' },
  { cde: '12345', fullname: 'MLHUILLIER2' }
])

User.create([
  { email: 'mladmin@test.com', encrypted_password: BCrypt::Password.create('test123'), designation: 'Agent Admin' },
  { email: 'marnie.paraiso@paramount.com.ph', encrypted_password: BCrypt::Password.create('test1234'), designation: 'Admin' }
])

AgentUser.create([
  { branch_name: 'ML Branch 1', agent_id: 1, user_id: 1, address: 'Sage House, Makati City', region: 'Metro Manila', city: 'Makati City', office_hours_start: '08:00:00', office_hours_end: '23:00:00' }
])
