# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
when 'development'
  puts '-'*100
  puts 'SEEDING'
  
  desmond = User.create(email: 'desmond17@protonmail.com', password: 'password', artist_name: 'desmond')
  desmond = User.create(email: 'ammad.fareed303@gmail.com', password: 'ammad303', artist_name: 'jhon_doe')
  AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  AdminUser.create(email: 'desmond17@protonmail.com', password: 'A1poopsauce', password_confirmation: 'A1poopsauce')
  AdminUser.create(email: 'ammad.fareed786@gmail.com', password: 'ammad786', password_confirmation: 'ammad786')

  # populate tag_types table
  TagType::TAG_TYPES.each do |tag_type|
    TagType.find_or_create_by(
      name: tag_type
    )
  end

  # populate tags table for the instruments

  instrument_type = TagType.find_by(name: 'instrument', published: true)

  instruments_tags = ['piano', 'keyboard', 'digital piano', 'guitar',
                      'electric guitar', 'bass', 'bass guitar',
                      'upright bass', 'electric bass', 'fiddle', 'violin',
                      'viola', 'voice', 'singing', 'songwriting',
                      'music theory', 'mandolin', 'ukulele', 'cello',
                      'horn', 'tuba', 'trumpet', 'euphonium',
                      'english horn', 'french horn', 'trombone', 'drums',
                      'percussion', 'drumming', 'clarinet', 'oboe',
                      'production', 'music production', 'audio engineering',
                      'fl studio', 'ableton', 'ableton live',
                      'logic', 'logic pro', 'logic pro x', 'pro tools',
                      'sax', 'saxophone', 'tenor sax', 'tenor saxophone',
                      'soprano sax', 'soprano saxophone', 'alto sax',
                      'alto saxophone', 'baritone sax', 'baritone saxophone',
                      'flute', 'euphonium', 'bagpipes', 'harp']

  instruments_tags.each do |instrument|
    Tag.find_or_create_by(name: instrument, tag_type_id: instrument_type.id)
  end

  video_links = ['https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
                'http://techslides.com/demos/sample-videos/small.mp4',
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4'
                ]

  images_links = ['http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg',
                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg',
                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg'
                  ]
  
  user = User.find_by(email: 'user@example.com')
  user = User.create!(email: 'user@example.com', artist_name: 'Test', password: 'password') unless user.present?
  
  video_links.each_with_index do |link, index|
    track = Track.find_or_initialize_by(user_id: user.id, link: link, name: link.split('/').last.split('.').first, photo: images_links[index], video: true)
    track.save(validate: false)
  end
  
when 'test'
  puts '-'*100
  puts 'No seed yet'
when 'production'
  puts '-'*100
  puts 'No seed yet'
end
