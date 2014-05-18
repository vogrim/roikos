# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brand             = Brand.create(title: 'Der Wüsteneisbär')
product           = Product.create(title: 'Buch: Der Wüsteneisbär: Das Abenteuer beginnt!', brand: brand)
transactionType   = TransactionType.create(title: 'Geschenk')
transaction       = Transaction.create(transaction_at: '2014-05-15', count: 10, product: product, note: 'Bücherei Test')