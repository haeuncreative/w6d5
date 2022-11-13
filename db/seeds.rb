# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do
  # Destroy tables (not necessary if using `rails db:seed:replant`)
  puts 'Destroying tables...'
  Cat.destroy_all

  # Reset primary keys (i.e., ids) 
  puts 'Resetting id sequences...'
  %w(cats).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  # Create seed data
  puts 'Creating seed data...'
cat1 = Cat.create!({name: 'Jerry', birth_date: '10/05/2020', color: 'tabby', sex: 'M'})
cat2 = Cat.create!({name: 'Artemis', birth_date: '25/05/2019', color: 'gray', sex: 'F'})
cat3 = Cat.create!({name: 'Tom', birth_date: '28/02/1950', color: 'gray', sex: 'M'})
cat4 = Cat.create!({name: 'Penelope', birth_date: '03/12/2021', color: 'tuxedo', sex: 'F'})
cat5 = Cat.create!({name: 'Turbo', birth_date: '13/06/2020', color: 'white', sex: 'M'})
cat6 = Cat.create!({name: 'Prada', birth_date: '04/02/2022',color: 'white', sex: 'F' })
cat7 = Cat.create!({name: 'Jinji', birth_date: '11/04/2021', color: 'ginger', sex: 'F'})
cat8 = Cat.create!({name: 'Momo', birth_date: '20/06/2019', color: 'gray', sex: 'F'})
  puts 'Done!'
end



