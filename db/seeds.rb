# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Listing.destroy_all
User.destroy_all

sam = User.create(
  name: 'Sam Evans',
  username: 'evansst',
  password: 'samevans',
  email_address: 'sevansam@gmail.com'
)

sam.avatar.attach(io: File.open('/Users/Sam/Pictures/Photos Library.photoslibrary/resources/derivatives/8/8CE9F67F-5F51-4DEF-A5B4-635E716DFD73_1_105_c.jpeg'), filename: '8CE9F67F-5F51-4DEF-A5B4-635E716DFD73_1_105_c.jpeg')

tori = User.create(
  name: 'Tori Hall',
  username: 'torihall6',
  password: 'hippo',
  email_address: 'victoria.hall@colorado.edu'
)

tori.avatar.attach(io: File.open('/Users/Sam/Pictures/Photos Library.photoslibrary/resources/derivatives/F/F03DE1D7-3D84-49FA-9801-D829D04A4877_1_105_c.jpeg'), filename: 'F03DE1D7-3D84-49FA-9801-D829D04A4877_1_105_c.jpeg')

genius = Listing.create(
  gear_type: 'Mountain Bike',
  size: 'Medium',
  condition: 'Used - Good',
  price: 3000,
  msrp: 4500,
  description: 'The Genius was put on this earth to get you up mountains with ease and to get you back down them in a flash. The Genius 920 features our TwinLoc Suspension System to always optimize your ride. With a SRAM Eagle drivetrain and Syncros components, the Genius 920 is action ready. Any Trail. Any Time.',
  user_id: sam.id,
  brand: 'Scott',
  model: 'Genius 920',
  year: 2018,
  specs: {
    'Frame Material': 'Carbon front triangle, allow rear triangle',
    'Drivetrain': 'SRAM GX 1x12',
    'Weight': '31 lbs',
    'Fork': 'Fox 34 Performance',
    'Front Travel': '150 mm',
    'Shock': 'Fox Nude EVOL ',
    'Rear Travel': '150 mm',
    'Brakes': 'Shimano SLX',
    'Saddle': 'Ergon SME3',
    'Dropper': 'Fox Transfer 150mm',
    'Dropper Lever': 'PNW Components Loam Lever',
    'Wheelset': '29in Syncros TR2.5 SL, 30mm inside-width, aluminum',
    'Tires': 'Maxxis DHF 2.5, Maxxis Aggressor 2.5',
    'Bars': 'Syncros 780mm',
    'Stem': 'Syncros 50mm',
  }
)

genius.images.attach(io: File.open('/Users/Sam/Downloads/s1600_max_920_77166.jpg'), filename: 's1600_max_920_77166.jpg')

joplin = Listing.create(
  gear_type: 'Mountain Bike',
  size: 'Small',
  condition: 'Used - Very Good',
  price: 4000,
  msrp: 4300,
  description: 'A little bit (cross) country. A little bit rock and roll. The Joplin is a bit of an XC wild child, a light bike that’s heavy on capability with a “let’s go” attitude to any trail. Let’s go fast. Let’s go far. Let’s go until your legs are ready to give up, and then go some more. Let’s make every second count. Let’s carve rides out of busy days and put those lines on the map on your done list.  The Joplin’s 29-inch wheels and lean frame float over washboard bumps with the same ease it devours jagged ledges. A geometry bred for long days in the saddle is blended with 130mm of travel in the front and 120mm in the rear, creating a capable climber that doesn’t flinch when roots get ragged and rocks start to roll. The lower link VPP suspension offers a responsive pedaling platform that’s ready to get up and go the moment you are. Whether you’re flossing rock gardens or making the rider in front of you your next hare, the Joplin is one rapid little trail fox that will take you farther than you thought you could and give you the confidence to go bigger than you thought you would. With a size range that starts at XS, this bike brings big-wheel benefits to those of us in the fun-size category too. And yes, every size in the line fits a water bottle inside the main triangle because XS doesn’t mean “do things by half”. Tying up the package is a range of component builds that weave the line between fun and fast, creating a bike that’s ready to race the distance or just race the clouds home. So, what are you waiting for?  Let’s go!',
  user_id: tori.id,
  brand: 'Juliana',
  model: 'Joplin R',
  year: 2020,
  specs: {
    'Frame Material': 'Carbone',
    'Drivetrain': 'SRAM NX 1x12',
    'Weight': '32 lbs',
    'Fork': 'Fox 34 Rhythm',
    'Front Travel': '130 mm',
    'Shock': 'Fox Float Performance DPS',
    'Rear Travel': '120 mm',
    'Brakes': 'SRAM Guide T',
    'Saddle': 'Juliana Segundo Saddle',
    'Dropper': 'SDG Tellis',
    'Wheelset': 'WTB ST i25 TCS 2.0 29in',
    'Tires': 'Maxxis DHF 2.3, Maxxis DHRII 2.3',
    'Bars': 'Raceface Ride',
    'Stem': 'Raceface Ride',
  }
)

joplin.images.attach(io: File.open('/Users/Sam/Downloads/2020-Juliana-Joplin-C-S.jpg'), filename: '2020-Juliana-Joplin-C-S.jpg')