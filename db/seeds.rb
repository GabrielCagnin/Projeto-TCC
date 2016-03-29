# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u=User.create([
                  {email: 'adriano@indoorwifi.com', password: 'adriano1234', name: 'Adriano'},
                  {email: 'thiago@indoorwifi.com', password: 'thiago1234', name: 'Thiago'},
                  {email: 'ricardo@indoorwifi.com', password: 'ricardo1234', name: 'Ricardo'}
            ])

f=Facility.create(name: 'Shopping')

FacilityUser.create(user_id: u.first.id, facility_id: f.id)