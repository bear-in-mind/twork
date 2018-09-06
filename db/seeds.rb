puts "Deleting db..."
AudioFile.destroy_all
Session.destroy_all
Track.destroy_all
Project.destroy_all
Talent.destroy_all
Skill.destroy_all
User.destroy_all

puts "Creating seeds..."
# Instrument Skills
Skill.create!(name: "Bass")
Skill.create!(name: "Drums")
Skill.create!(name: "Keyboards")
Skill.create!(name: "Vocals")
Skill.create!(name: "Background Vocals")
Skill.create!(name: "Piano")
Skill.create!(name: "Organ")
Skill.create!(name: "Synths")
Skill.create!(name: "Beatmaking")
Skill.create!(name: "Electric Guitar")
Skill.create!(name: "Classical Guitar")
Skill.create!(name: "Acoustic Guitar")
Skill.create!(name: "Lapsteel Guitar")
Skill.create!(name: "Tenor Saxophone")
Skill.create!(name: "Alto Saxophone")
Skill.create!(name: "Soprano Saxophone")
Skill.create!(name: "Baritone Saxophone")
Skill.create!(name: "Clarinet")
Skill.create!(name: "Bass Clarinet")
Skill.create!(name: "Flute")
Skill.create!(name: "Double Bass")
Skill.create!(name: "Violin")
Skill.create!(name: "Cello")
Skill.create!(name: "Viola")
Skill.create!(name: "Trumpet")
Skill.create!(name: "Trombone")
Skill.create!(name: "Tuba")
Skill.create!(name: "Horn")
Skill.create!(name: "Harp")
Skill.create!(name: "Percussions")
Skill.create!(name: "Classical Percussion")
Skill.create!(name: "Oboe")
Skill.create!(name: "Bassoon")
Skill.create!(name: "Traditional Instruments")
Skill.create!(name: "DJ")
Skill.create!(name: "MC")

# Musical Skills
Skill.create!(name: "Arranger")
Skill.create!(name: "Producer")
Skill.create!(name: "Composer")
Skill.create!(name: "Lyricist")
Skill.create!(name: "Songwriter")
Skill.create!(name: "Sound Designer")
Skill.create!(name: "Conductor")
Skill.create!(name: "Synth Programming")
Skill.create!(name: "Copyist")
Skill.create!(name: "Music Director")

# Technical Skills
Skill.create!(name: "Recording Engineer")
Skill.create!(name: "FOH Engineer")
Skill.create!(name: "Mixing Engineer")
Skill.create!(name: "Mastering Engineer")
Skill.create!(name: "Monitor Engineer")
Skill.create!(name: "Lighting Technician")
Skill.create!(name: "Maintenance Engineer")
Skill.create!(name: "Pro Tools Operator")
Skill.create!(name: "Ableton Programmer")
Skill.create!(name: "Luthier")

# Business Skills
Skill.create!(name: "A&R Manager")
Skill.create!(name: "A&R Director")
Skill.create!(name: "Label Mananger")
Skill.create!(name: "Label Director")
Skill.create!(name: "Artist Manager")
Skill.create!(name: "Marketing Manager")
Skill.create!(name: "Media Relations / PR")
Skill.create!(name: "Executive")
Skill.create!(name: "Business Affair")
Skill.create!(name: "Distribution Manager")
Skill.create!(name: "Merchandiser")
Skill.create!(name: "Music Attorney")
Skill.create!(name: "Music Supervisor")
Skill.create!(name: "New Media Manager")
Skill.create!(name: "Office Manager")
Skill.create!(name: "Project Manager")
Skill.create!(name: "Promotions Department")
Skill.create!(name: "Radio Producer")
Skill.create!(name: "Radio Programmer")
Skill.create!(name: "Radio Promotion")
Skill.create!(name: "Radio Talent")
Skill.create!(name: "Royalty Accounts")
Skill.create!(name: "Sales")

# Live
Skill.create!(name: "Festival Organizer")
Skill.create!(name: "Booking Agent")
Skill.create!(name: "Promoter")
Skill.create!(name: "Technical Director")
Skill.create!(name: "Technician, Backliner")
Skill.create!(name: "Road Manager")
Skill.create!(name: "Tour Manager")
Skill.create!(name: "Tour Producer")
Skill.create!(name: "Venue Director")

# Other Skills
Skill.create!(name: "Music Journalist")
Skill.create!(name: "Music Teacher")
Skill.create!(name: "Music Therapist")
Skill.create!(name: "Musicologist")

# Users
a = User.new(
  first_name: "Maxime",
  last_name: "Garoute",
  city: "Paris",
  email: "max@twork.xyz",
  password: "123456",
  main_occupation: "Drummer",
  genres: ["Funk", "Disco", "Pop"],
  bio: "I'm a French drummer with deep roots in 80s american culture. I was very influenced by artists like Peter Gabriel, Toto, Michael Jackson and Price. My band is called Venice!"
)
a.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1535386159/profile_pictures/35082803_772381303151861_9123527924262109184_o.jpg"
a.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1535386502/banner_images/venice_banner.jpg"
a.save!

b = User.new(
  first_name: "Nicolas",
  last_name: "Bauguil",
  city: "Paris",
  email: "nico@twork.xyz",
  password: "123456",
  main_occupation: "Guitarist",
  bio: "I'm a French guitar player. I play all guitars, all genres: I'm as much a fan of Michael Jackson as AC/DC !",
  genres: ["Funk", "Pop", "Electronic", "Rock"]
)

b.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1535386159/profile_pictures/10900237_10152801343043025_955411608168163016_o.jpg"
b.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1535386501/banner_images/nico_banner.jpg"
b.save!

c = User.new(
  first_name: "Louis",
  last_name: "Sommer",
  city: "Paris",
  email: 'louis.sommer@gmail.com',
  password: "123456",
  main_occupation: "Producer",
  genres: ["Funk", "Disco", "Pop", "R&B", "Electronic"],
  bio: "I'm a musician, arranger and producer from Paris. Deeply influenced by black music, jazz, and electronic music, I will adapt to any project, in any genre, provided I'll have the right to make it groove!"
)

c.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1535386159/profile_pictures/23592023_10210478946039138_4604273126648435503_o.jpg"
c.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1535386502/banner_images/venice_banner.jpg"
c.save!

d = User.new(
  first_name: "Benjamin",
  last_name: "Diamond",
  city: "Paris",
  email: "benj@twork.xyz",
  password: "123456",
  main_occupation: "Artist",
  bio: "I'm a songwriter, composer, producer and vocalist. Got famous with my band Stardust with Thomas Bangalter. Open to any vocals featuring mostly on Electronic tracks.",
  genres: ["Funk", "Pop", "Electronic"],
)

d.remote_avatar_url = "http://res.cloudinary.com/twerk/image/upload/c_crop,g_face,h_800,w_822/v1535386178/profile_pictures/BenjaminDiamond.jpg"
d.save!

e = User.new(
  first_name: "Johann",
  last_name: "Dalgaard",
  city: "Paris",
  email: "johann@twork.xyz",
  password: "123456",
  main_occupation: "Keyboardist",
  genres: ["Pop", "Funk"],
  bio: "Hey ! I'm a keyboard player from Denmark. I'm a huge blues fan, and am quite skilled with the organ. I can ply any style and love pop as well!"
)

e.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1535386159/profile_pictures/13174054_10153837541604145_7560661546128707137_n.jpg"
e.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1535386502/banner_images/johann_banner.jpg"
e.save!

f = User.new(
  first_name: "Sebastien",
  last_name: "Teti",
  city: "Los Angeles",
  email: "seb@twork.xyz",
  password: "123456",
  main_occupation: "Mixing Engineer",
  genres: ["Pop", "Electronic", "Rock"],
  bio: "I'm a front-of-house engineer, as well as a very skilled mixer. I especially like electronic music."
)

f.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1535386159/profile_pictures/11055352_10154133769018636_7975568259011370824_o.jpg"
f.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1535386502/banner_images/seb_banner.jpg"
f.save!

g = User.new(
  first_name: "Maxime",
  last_name: "Delpierre",
  city: "Paris",
  email: "delpierre@twork.xyz",
  password: "123456",
  main_occupation: "Guitarist",
  genres: ["Pop", "Jazz", "Electronic", "Rock"],
)

g.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1536216922/profile_pictures/delpierre.jpg"
g.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1535386502/banner_images/seb_banner.jpg"
g.save!

# Talents
louis = User.find_by(first_name: "Louis")
max = User.find_by(last_name: "Garoute")
nico = User.find_by(first_name: "Nicolas")
johann = User.find_by(first_name: "Johann")
benj = User.find_by(first_name: "Benjamin")
seb = User.find_by(first_name: "Sebastien")
delpierre = User.find_by(last_name: "Delpierre")

Talent.create!(skill: Skill.find_by(name: "Bass"), user: louis)
louis_bass = Talent.last
Talent.create!(skill: Skill.find_by(name: "Arranger"), user: louis)
Talent.create!(skill: Skill.find_by(name: "Clarinet"), user: louis)
Talent.create!(skill: Skill.find_by(name: "Bass Clarinet"), user: louis)
Talent.create!(skill: Skill.find_by(name: "Keyboards"), user: louis)
Talent.create!(skill: Skill.find_by(name: "Ableton Programmer"), user: louis)
Talent.create!(skill: Skill.find_by(name: "Drums"), user: max)
max_drums = Talent.last
Talent.create!(skill: Skill.find_by(name: "Percussions"), user: max)
Talent.create!(skill: Skill.find_by(name: "Producer"), user: max)
Talent.create!(skill: Skill.find_by(name: "Electric Guitar"), user: nico)
nico_guitar = Talent.last
Talent.create!(skill: Skill.find_by(name: "Acoustic Guitar"), user: nico)
Talent.create!(skill: Skill.find_by(name: "Keyboards"), user: nico)
Talent.create!(skill: Skill.find_by(name: "Producer"), user: nico)
Talent.create!(skill: Skill.find_by(name: "Keyboards"), user: johann)
johann_keys = Talent.last
Talent.create!(skill: Skill.find_by(name: "Arranger"), user: johann)
Talent.create!(skill: Skill.find_by(name: "Vocals"), user: benj)
benj_vox = Talent.last
Talent.create!(skill: Skill.find_by(name: "Producer"), user: benj)
Talent.create!(skill: Skill.find_by(name: "FOH Engineer"), user: seb)
seb_mix = Talent.last
Talent.create!(skill: Skill.find_by(name: "Recording Engineer"), user: seb)
Talent.create!(skill: Skill.find_by(name: "Producer"), user: delpierre)
Talent.create!(skill: Skill.find_by(name: "Electric Guitar"), user: delpierre)


# Projects
Project.create!(project_owner: louis, name: "Venice", deadline: Date.new(2018,10,1))
venice = Project.last
Project.create!(project_owner: louis, name: "Luce", deadline: Date.new(2019,1,1))
luce = Project.last
Project.create!(project_owner: louis, name: "Malca", deadline: Date.new(2018,11,16))
malca = Project.last
Project.create!(project_owner: louis, name: "Remix JC Naimro", deadline: Date.new(2018,9,15))
remix = Project.last
Project.create!(project_owner: johann, name: "Aske Jacoby", deadline: Date.new(2018,9,15))
aske = Project.last

# Tracks
Track.create!(project: venice, name: "Sandy")
sandy = Track.last
Track.create!(project: venice, name: "If You")
if_you = Track.last
Track.create!(project: venice, name: "Slow Down")
slow_down = Track.last
Track.create!(project: luce, name: "La Vague Amour")
vague = Track.last
Track.create!(project: luce, name: "Ciao")
ciao = Track.last
Track.create!(project: luce, name: "L'Ilot Paradis")
ilot = Track.last
Track.create!(project: malca, name: "Saudi Palace")
saudi = Track.last
Track.create!(project: malca, name: "Ivory Tower")
ivory = Track.last
Track.create!(project: malca, name: "Casablanca Jungle")
casa = Track.last
Track.create!(project: remix, name: "Aveou Doudou")
aveou = Track.last
Track.create!(project: aske, name: "Sequoias")
sequoias = Track.last

# Sessions
Session.create!(track: ciao, talent: max_drums)
drum_rec = Session.last
Session.create!(track: ilot, talent: max_drums)
Session.create!(track: vague, talent: nico_guitar)
Session.create!(track: sequoias, talent: louis_bass)
bass_rec = Session.last
Session.create!(track: slow_down, talent: max_drums)
Session.create!(track: if_you, talent: max_drums)
Session.create!(track: aveou, talent: seb_mix)
Session.create!(track: aveou, talent: max_drums)
Session.create!(track: casa, talent: seb_mix)
Session.create!(track: ivory, talent: seb_mix)
Session.create!(track: sandy, talent: benj_vox)
Session.create!(track: sandy, talent: seb_mix)
Session.create!(track: if_you, talent: benj_vox)
Session.create!(track: slow_down, talent: benj_vox)

# Audio_files

ciao_drums = AudioFile.new(name: 'Drums t2 (solo)', user_id: max.id, session_id: drum_rec.id)
ciao_drums.remote_audio_url = "https://res.cloudinary.com/twerk/video/upload/v1536219385/twork%20audio%20def/Ciao_DRUMS_ONLY.m4a"
ciao_drums.save!
drum = AudioFile.last

ciao_track = AudioFile.new(name: 'Basic Track DMS', user_id: max.id, session_id: drum_rec.id)
ciao_track.remote_audio_url = "https://res.cloudinary.com/twerk/video/upload/v1536219385/twork%20audio%20def/Ciao_BASIC_TRACK.m4a"
ciao_track.save!
track = AudioFile.last

# Comments

Comment.new(audio_file: drum, content: "Perfect break on exit !", user_id: louis.id, track_instant: 15)
Comment.new(audio_file: track, content: "Awesome work bro !", user_id: max.id, track_instant: 7)
Comment.new(audio_file: track, content: "Perfect, sending you the solo track right away", user_id: max.id)

# Brief for Ciao
ciao.update!(brief: "Sunny, summer vibe with strong Italo-Disco references. Overall feel is bright, funny, with a real feel-good vibe and should have a solid groove. \n References : MJ (Off the Wall period), late 70s Italian pop, Giorgio Moroder...")

puts "Seeding done!"
