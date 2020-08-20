# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email:'user@email.com', password: 123456)

PersonalInfo.create(name: 'User name', address: 'R. Street name', fone: '+55(11)9 6666-4444', email: 'user@mail.com', links: 'http://rede-social.com', link_git: 'http://github-gitlab.com', link_site: 'http://meu-site.com', goals: 'Work with tech' )