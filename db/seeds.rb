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


users = User.create([{email: 'admin@admin.com', username: 'admin', password: 'admin', fname: 'Admin', lname: 'Admin', city:'Toronto'},
                    {email: 'servie@admin.com', username: 'service', password: 'service', fname: 'Service', lname: 'Service', city:'Toronto'},
                    {email: 'client1@gmail.com', username: 'client1', password: 'client1', fname: 'Sam', lname: 'Sung', city:'Toronto'},
                    {email: 'teen1@gmail.com', username: 'teen1', password: 'teen1', fname: 'Amanda', lname: 'Ted', city:'Toronto'},
                    {email: 'teen2@gmail.com', username: 'teen2', password: 'teen2', fname: 'Tommy', lname: 'Brad', city:'Toronto'},
                    {email: 'teen3@gmail.com', username: 'tommybrad', password: 'tommybrad', fname: 'Tommy', lname: 'Brad', city:'Toronto'},
                    {email: 'client2@gmail.com', username: 'bingding', password: 'bingding', fname: 'Bing', lname: 'Ding', city:'Toronto'}
                    ])
