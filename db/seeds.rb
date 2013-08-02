Beer.delete_all
Event.delete_all
User.delete_all


e1 = Event.create(
	title: 'Oktoberfest',
	start_date: '2013-10-10',
	start_time: '16:00:00 EST',
	end_date: '2013-10-10',
	end_time: '23:59:00 EST',
  street: '123 German Way', street2: 'Apt C',
  city: 'Brooklyn', state: 'NY', zip: '12345',
  description: %{Ja, Ich trinke Bier! Und du! Whilst du mit mier trinken? Allen trinken Bier heute!},
  image_url: "http://londondrinkup.files.wordpress.com/2013/01/oktoberfest-beer-party.jpg",
  price: '45.00')
e2 = Event.create(
	title: 'Reinhart-fest',
	start_date: '2013-09-03',
	start_time: '12:00:00 EST',
 	end_date: '2013-09-04',
	end_time: '02:00:00 EST',
  street: '156 Whitney Ave',
  city: 'Pompton Lakes', state: 'NJ', zip: '07442',
  description: %{Come to my house, drink beer, swim, then sleep. then bagels. delicious bagels. Speaking of bagels, anyone want to go to Zaro\'s?},
	image_url: "http://cdn.c.photoshelter.com/img-get/I0000kSl6MbcQ3a8/s/750/750/Lao-River-Party-C.jpg",
	price: '20.00')
e3 = Event.create(
	title: 'Beerfest',
	start_date: '2013-12-05',
	start_time: '20:00:00 EST',
 	end_date: '2013-12-06',
	end_time: '03:00:00 EST',
  street: '345 Main St', street2: 'Apt B',
  city: 'New York', state: 'NY', zip: '10010',
  description: %{Placeholding description!},
  image_url: "http://www.incrediblethings.com/wp-content/uploads/2012/06/bowser-beer-for-dogs-1.jpg",
  price: '20.00')
e4 = Event.create(
	title: 'GA Happy Hour',
	start_date: '2013-11-09',
 	start_time: '18:00:00 EST',
 	end_date: '2013-11-10',
	end_time: '06:00:00 EST',
  street: '902 Broadway', street2: '4th Floor',
  city: 'New York', state: 'NY', zip: '10010',
  description: %{It\'s been a long week. You\'re tired. You have a lot of work to do. You\'ve seen no one but your classmates for 5 days. Before you wander off on your own for the weekend, what could be better then joining them for some free beer?},
  image_url: "http://blogs.westword.com/cafesociety/great-divide-brewings-beer-party.jpg",
  price: '0.00')

# u1 = User.create(name: "mike", email: "mreinhart88@yahoo.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
# u2 = User.create(name: "Jim", email: "mreinhart88@gmail.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
u3 = User.create(
	role: "customer", name: "customer",
	email: "vendor@email.com", zip_code: "44122",
	password: 'password', phone: '777-777-7777',
	street_address1: '123 Main St', city: 'New York', state: 'NY',
	street_address2: 'Apt A', admin: false)
u4 = User.create(
	role: "vendor", name: "vendor",
  email: "customer@email.com", zip_code: "44122",
  password: 'password', phone: '777-777-7777',
  street_address1: '123 Main St', city: 'New York', state: 'NY',
  street_address2: 'Apt A')
u5 = User.create(
	role: "admin", name: "admin",
  email: "admin@email.com", zip_code: "44122",
  password: 'password', phone: '777-777-7777',
  street_address1: '123 Main St', city: 'New York', state: 'NY',
  street_address2: 'Apt A', admin: true)


b1 = Beer.create(
	title: 'Shikra Ale', 
	description: %{Shikra's bold and refreshing hop character is elegantly balanced by a special blend of Caramel Malts.},
	image_url: 'http://brewtribe.herokuapp.com/PintCutoutShikra.png',
	price: 12.99)
b2 = Beer.create(
	title: 'Tej', 
	description: %{Our ancient style brew, described as "the drink of kings," is fermented with all natural wildflower honey and spicy gesho herbs.},
	image_url: 'http://brewtribe.herokuapp.com/LostTribes-tejbottle.png',
	price: 15.99)
b3 = Beer.create(
	title: 'Light', 
	description: %{Lost Tribes’ Light is cold brewed and cold aged to perfection in a unique brewing process.},
	image_url: 'http://brewtribe.herokuapp.com/beerPintlightcut.png',
	price: 13.99)




