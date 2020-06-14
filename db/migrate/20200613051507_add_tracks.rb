class AddTracks < ActiveRecord::Migration[6.0]
  def change
    tracks = [
      {
        link: "bakery_house_band/BHB_Baby_Can_Wait_Mix_v3",
        type: "mp3",
        name: "Baby can wait",
      },
      {
        link: "bakery_house_band/BHB_Baby_I_Do_Mix_v2",
        type: "mp3",
        name: "Baby I do",
      },
      {
        link: "bakery_house_band/BHB_I_Know_Mix_v1",
        type: "mp3",
        name: "I know",
      },
      {
        link: "bakery_house_band/BHB_Lonely_With_You_Mix_v2",
        type: "mp3",
        name: "Lonely with you",
      },
      {
        link: "bakery_house_band/BHB_My_Heart_Will_Go_On_Mix_v2",
        type: "mp3",
        name: "My heart will go on",
      },
      {
        link: "bakery_house_band/BHB_Siren_Song_Mix_v2",
        type: "mp3",
        name: "Siren song",
      },
      {
        link: "bakery_house_band/BHB_Stranger_Dont_Mind_MIX_v2",
        type: "mp3",
        name: "Stranger don't mind",
      },
      {
        link: "bakery_house_band/BHB_All_I_Ever_Wanted_From_You_Mix_v1",
        type: "mp3",
        name: "All I ever wanted from you",
      },
      {
        link: "bakery_house_band/BHB_Summer_Ecstasy_Mix_v3",
        type: "mp3",
        name: "Summer ecstasy",
      },
      {
        link: "bakery_house_band/BHB_Talk_To_Me_Mix_v1",
        type: "mp3",
        name: "Talk to me",
      },
      {
        link: "take_your_time_girl",
        type: "m4a",
        name: "Take your time girl",
      },
      {
        link: "10beat",
        type: "mp3",
        name: "Beat 10",
      },
      {
        link: "12albert",
        type: "mp3",
        name: "Albert",
      },
      {
        link: "14beat",
        type: "mp3",
        name: "Beat 14",
      },
      {
        link: "15suicide",
        type: "mp3",
        name: "Suicide",
      },
      {
        link: "16bells",
        type: "mp3",
        name: "Bells",
      },
      {
        link: "20beat",
        type: "mp3",
        name: "Beat 20",
      },
      {
        link: "21beat",
        type: "mp3",
        name: "Beat 21",
      },
      {
        link: "22beat",
        type: "mp3",
        name: "Beat",
      },
      {
        link: "8grown",
        type: "mp3",
        name: "Grown",
      },
      {
        link: "9spider",
        type: "mp3",
        name: "Spider",
      },
      {
        link: "Cadillac",
        type: "mp3",
        name: "Cadillac",
      },
      {
        link: "Nature Boy",
        type: "mp3",
        name: "Nature Boy",
      },
      {
        link: "Tablasong",
        type: "mp3",
        name: "Tablasong",
      },
      {
        link: "The Crunch",
        type: "mp3",
        name: "The Crunch",
      },
      {
        link: "You're not alone",
        type: "mp3",
        name: "You're not alone",
      },
      {
        link: "bogslore",
        type: "mp3",
        name: "Bogslore",
      },
      {
        link: "cool",
        type: "mp3",
        name: "Cool",
      },
      {
        link: "dontstop",
        type: "mp3",
        name: "Don't stop",
      },
      {
        link: "feeldarydam",
        type: "mp3",
        name: "Feeldarydam",
      },
      {
        link: "haircutday",
        type: "mp3",
        name: "Haircut day",
      },
      {
        link: "ligo",
        type: "mp3",
        name: "Ligo",
      },
      {
        link: "liveforpeace2",
        type: "mp3",
        name: "Live for peace",
      },
      {
        link: "makeitwithyou",
        type: "mp3",
        name: "Make it with you",
      },
      {
        link: "newbells",
        type: "mp3",
        name: "New bells",
      },
      {
        link: "nozo",
        type: "mp3",
        name: "Nozo",
      },
      {
        link: "taxidriver",
        type: "mp3",
        name: "Taxi driver",
      },
      {
        link: "whatmoredoyouwant",
        type: "mp3",
        name: "What more do you want",
      },
    ];

    User.create(email: 'desmond17@protonmail.com', password: 'password', artist_name: 'THe Bakery House Band')
    
    tracks.reverse.each do |track|
      Track.create!({
        user: User.find(1),
        link: "https://beatoftheday.s3-us-west-1.amazonaws.com/#{track[:link]}.#{track[:type]}",
        name: track[:name],
        audio_type: track[:type],
        photo: "https://beatoftheday.s3-us-west-1.amazonaws.com/aBF9zzMQ.jpeg"
      })
    end
  end
end
