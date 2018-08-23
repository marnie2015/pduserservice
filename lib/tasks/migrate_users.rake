task migrate_users: :environment do
  require 'roo'

  users = []
  DESIGNATION = {
    20 => 'AGENT ADMIN',
    25 => 'AGENT ADMIN',
    22 => 'AGENT BM',
    23 => 'AGENT BU',
    1 => 'DM ADMIN',
    34 => 'DM CASHIER',
    19 => 'DM CS',
    28 => 'DM CS',
    35 => 'DM CS',
    40 => 'DM CS',
    27 => 'DM FRONTLINER',
    8 => 'DM MARKETING',
    2 => 'DM POLICY SERVICE',
    36 => 'DM POLICY SERVICE',
    11 => 'UNDERWRITING',
    12 => 'UNDERWRITING',
    13 => 'UNDERWRITING',
    14 => 'UNDERWRITING',
    15 => 'UNDERWRITING',
    17 => 'UNDERWRITING',
    18 => 'UNDERWRITING',
    24 => 'UNDERWRITING',
    39 => 'UNDERWRITING'
  }.freeze
  s = Roo::Spreadsheet.open("#{Rails.root}/bin/users_migration.xlsx")
  s.default_sheet = s.sheets.first

  if s.last_row > 1
    for i in 2..s.last_row
      temppass = "temppass#{(10000 + s.cell(i, 3).to_i)}"
      users << { email: s.cell(i, 1),
                password: temppass,
                designation: DESIGNATION[s.cell(i, 2).to_i],
                id: s.cell(i, 3).to_i,
                role: '21'
                }
    end
  end

  User.create!(users)
  puts 'Done migrating.'
end
