# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @param [string] table_name
def drop_table(table_name)
  ActiveRecord::Base.connection.execute("DELETE FROM #{table_name}")
  ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name = '#{table_name}'")
end

# @param [Class] model_name
# @param [array] values
def create_model(model_name, values)
  values.each do |name|
    model_name.create(name: name[0])
  end
end

# @param [Class] model_name
# @param [array] values
def set_enum(model_name, values)
  drop_table(model_name.table_name)
  create_model(model_name, values)
end

# create the values for the contact position ENUM
positions = [
  ['recruiter'],
  ['hiring_manager'],
  ['development_manager'],
  ['engineer'],
  ['executive'],
]
set_enum(ContactPosition, positions)

# create the values for the communication methods ENUM
methods = [
  ['email'],
  ['phone'],
  ['video'],
  ['sms'],
  ['physical'],
]
set_enum(CommunicationMethod, methods)

# create the values for the communication reasons ENUM
reasons = [
  ['apply'],
  ['interview'],
  ['questions'],
  ['offer'],
  ['accept'],
  ['reject'],
]
set_enum(CommunicationReason, reasons)
