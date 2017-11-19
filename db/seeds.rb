# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

service_types = ServiceType.create([{name: 'Babysitting', description: 'Babysitting service'},
                                   {name: 'Yard Work', description: 'Yard Work service'},
								   {name: 'Snow Shovelling', description: 'Snow Shovelling service'},
								   {name: 'Furniture Moving', description: 'Furniture Moving service'},
								   {name: 'Cleaning', description: 'Cleaning service'},
								   {name: 'Pet feeding', description: 'Pet feeding service'},
								   {name: 'Dog walking', description: 'Dog walking service'},
								   {name: 'Tutoring', description: 'Tutoring service'},
								   {name: 'Computer Help', description: 'Computer Help Services'}
								   ])
								   