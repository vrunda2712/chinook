ANSWERS

1. Find the albums recorded by the artist Queen.

----> Artist.find_by(name: 'Queen') Album.where(artist_id: 51)

O/P :
[
    [0] #<Album:0x000000060fc188> {
                :id => 36,
         :artist_id => 51,
             :title => "Greatest Hits II",
        :created_at => Wed, 30 Jan 2008 14:00:12 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:14:02 UTC +00:00
    },
    [1] #<Album:0x000000060fbf80> {
                :id => 185,
         :artist_id => 51,
             :title => "Greatest Hits I",
        :created_at => Sat, 29 Dec 2007 12:02:13 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:14:02 UTC +00:00
    },
    [2] #<Album:0x000000060fbe40> {
                :id => 186,
         :artist_id => 51,
             :title => "News Of The World",
        :created_at => Wed, 23 Jun 2010 20:50:06 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:14:02 UTC +00:00
    }
]


2. Count how many tracks belong to the media type "Protected MPEG-4 video file".

----> Track.where('media_type_id = ?', MediaType.find_by(name: 'Protected MPEG-4 video file')).count

O/P : 214


3. Find the genre with the name "Hip Hop/Rap".

----> Genre.where(name: 'Hip Hop/Rap')

O/P :
[
    [0] #<Genre:0x00000003569840> {
                :id => 17,
              :name => "Hip Hop/Rap",
        :created_at => Sun, 20 Jan 2013 02:04:31 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:14:08 UTC +00:00
    }
]


4. Count how many tracks belong to the "Hip Hop/Rap" genre

----> Track.where('genre_id = ?', Genre.find_by(name: 'Hip Hop/Rap')).count

O/P : 35


5. Find the total amount of time required to listen to all the tracks in the database.

----> Track.sum('milliseconds')

O/P : 1378575827


6. Find the highest price of any track that has the media type "MPEG audio file".

----> Track.where('media_type_id = ?',MediaType.find_by(name: 'MPEG audio file')).maximum(:unit_price)

O/P : 0.99


7. Find the name of the most expensive track that has the media type "MPEG audio file".

----> Track.where('media_type_id = ?',MediaType.find_by(name: 'MPEG audio file')).order(unit_price: :desc).first.name

O/P : "Put The Finger On You"


8. Find the 2 oldest artists.

----> Artist.order(created_at: :asc).limit(2)

O/P :
[
    [0] #<Artist:0x00000008ae9018> {
                :id => 258,
              :name => "Les Arts Florissants & William Christie",
        :created_at => Fri, 13 Feb 2004 06:08:36 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
    },
    [1] #<Artist:0x00000008ae8ed8> {
                :id => 31,
              :name => "Baby Consuelo",
        :created_at => Mon, 16 Feb 2004 22:04:39 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
    }
]


9. Find the least expensive track that has the genre "Electronica/Dance".

----> Track.where('genre_id = ?', Genre.find_by(name: 'Electronica/Dance')).order(unit_price: :asc).first.name

O/P : "Instinto Colectivo"


10. Find all "MPEG audio file" tracks in the genre "Electronica/Dance".

----> Track.where('genre_id = ? AND media_type_id = ?', Genre.find_by(name: 'Electronica/Dance'), MediaType.find_by(name: 'MPEG audio file'))

O/P :
[
    [ 0] #<Track:0x000000098839f8> {
                   :id => 3319,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Instinto Colectivo",
             :composer => nil,
         :milliseconds => 300564,
                :bytes => 12024875,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 1] #<Track:0x00000009883890> {
                   :id => 3320,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Chapa o Coco",
             :composer => nil,
         :milliseconds => 143830,
                :bytes => 5755478,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 2] #<Track:0x00000009883750> {
                   :id => 3321,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Prostituta",
             :composer => nil,
         :milliseconds => 359000,
                :bytes => 14362307,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 3] #<Track:0x00000009883430> {
                   :id => 3322,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Eu So Queria Sumir",
             :composer => nil,
         :milliseconds => 269740,
                :bytes => 10791921,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 4] #<Track:0x00000009883278> {
                   :id => 3323,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Tres Reis",
             :composer => nil,
         :milliseconds => 304143,
                :bytes => 12168015,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 5] #<Track:0x00000009883110> {
                   :id => 3324,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Um Lugar ao Sol",
             :composer => nil,
         :milliseconds => 212323,
                :bytes => 8495217,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 6] #<Track:0x00000009882fa8> {
                   :id => 3325,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Batalha Naval",
             :composer => nil,
         :milliseconds => 285727,
                :bytes => 11431382,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 7] #<Track:0x00000009882df0> {
                   :id => 3327,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "O Misterio do Samba",
             :composer => nil,
         :milliseconds => 226142,
                :bytes => 9047970,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 8] #<Track:0x00000009882c88> {
                   :id => 3328,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Armadura",
             :composer => nil,
         :milliseconds => 232881,
                :bytes => 9317533,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [ 9] #<Track:0x00000009882af8> {
                   :id => 3329,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Na Ladeira",
             :composer => nil,
         :milliseconds => 221570,
                :bytes => 8865099,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [10] #<Track:0x00000009882990> {
                   :id => 3330,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Carimbo",
             :composer => nil,
         :milliseconds => 328751,
                :bytes => 13152314,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [11] #<Track:0x00000009882670> {
                   :id => 3331,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Catimbo",
             :composer => nil,
         :milliseconds => 254484,
                :bytes => 10181692,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [12] #<Track:0x000000098824e0> {
                   :id => 3333,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Chega no Suingue",
             :composer => nil,
         :milliseconds => 221805,
                :bytes => 8874509,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [13] #<Track:0x000000098823a0> {
                   :id => 3334,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Mun-Ra",
             :composer => nil,
         :milliseconds => 274651,
                :bytes => 10988338,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [14] #<Track:0x00000009882210> {
                   :id => 3335,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Freestyle Love",
             :composer => nil,
         :milliseconds => 318484,
                :bytes => 12741680,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
    },
    [15] #<Track:0x000000098820d0> {
                   :id => 1456,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Stillness In Time",
             :composer => "Toby Smith",
         :milliseconds => 257097,
                :bytes => 8644290,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:05 UTC +00:00
    },
    [16] #<Track:0x00000009881f68> {
                   :id => 1463,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Journey To Arnhemland",
             :composer => "Toby Smith/Wallis Buchanan",
         :milliseconds => 322455,
                :bytes => 10843832,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:05 UTC +00:00
    },
    [17] #<Track:0x00000009881e28> {
                   :id => 1455,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Just Another Story",
             :composer => "Toby Smith",
         :milliseconds => 529684,
                :bytes => 17582818,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [18] #<Track:0x00000009881c98> {
                   :id => 3326,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Todo o Carnaval tem seu Fim",
             :composer => nil,
         :milliseconds => 237426,
                :bytes => 9499371,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:06 UTC +00:00
    },
    [19] #<Track:0x00000009881b08> {
                   :id => 3332,
             :album_id => 259,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Funk de Bamba",
             :composer => nil,
         :milliseconds => 237322,
                :bytes => 9495184,
           :unit_price => 0.99,
           :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:15:06 UTC +00:00
    },
    [20] #<Track:0x000000098819c8> {
                   :id => 1457,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Half The Man",
             :composer => "Toby Smith",
         :milliseconds => 289854,
                :bytes => 9577679,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [21] #<Track:0x00000009881838> {
                   :id => 1458,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Light Years",
             :composer => "Toby Smith",
         :milliseconds => 354560,
                :bytes => 11796244,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [22] #<Track:0x000000098816d0> {
                   :id => 1459,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Manifest Destiny",
             :composer => "Toby Smith",
         :milliseconds => 382197,
                :bytes => 12676962,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [23] #<Track:0x000000098813d8> {
                   :id => 1460,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "The Kids",
             :composer => "Toby Smith",
         :milliseconds => 309995,
                :bytes => 10334529,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [24] #<Track:0x00000009881248> {
                   :id => 1461,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Mr. Moon",
             :composer => "Stuard Zender/Toby Smith",
         :milliseconds => 329534,
                :bytes => 11043559,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [25] #<Track:0x00000009881108> {
                   :id => 1462,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Scam",
             :composer => "Stuart Zender",
         :milliseconds => 422321,
                :bytes => 14019705,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [26] #<Track:0x00000009880fa0> {
                   :id => 1464,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Morning Glory",
             :composer => "J. Kay/Jay Kay",
         :milliseconds => 384130,
                :bytes => 12777210,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    },
    [27] #<Track:0x00000009880e10> {
                   :id => 1465,
             :album_id => 118,
             :genre_id => 15,
        :media_type_id => 1,
                 :name => "Space Cowboy",
             :composer => "J. Kay/Jay Kay",
         :milliseconds => 385697,
                :bytes => 12906520,
           :unit_price => 0.99,
           :created_at => Thu, 01 May 2008 07:04:10 UTC +00:00,
           :updated_at => Wed, 29 Jan 2014 22:14:59 UTC +00:00
    }
]
