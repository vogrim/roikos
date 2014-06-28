# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

user              = User.create(:firstname => 'Franz', :surname => 'Dumfart', :email => 'franz@roikos.com', :password => 'topsecret', :password_confirmation => 'topsecret')

brand             = Brand.create(title: 'Der Wüsteneisbär')
product           = Product.create(title: 'Buch: Der Wüsteneisbär: Das Abenteuer beginnt!', shortcut: 'WAB', brand: brand)
movementType      = MovementType.create(title: 'Geschenk')
movement          = Movement.create(movement_at: '2014-05-15', count: 10, product: product, note: 'Bücherei Test', movement_type: movementType)