# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Attendee.destroy_all
# Event.destroy_all
# OrganizationSocial.destroy_all
# OrganizationContact.destroy_all
# OrganizationImage.destroy_all
# Supporter.destroy_all
# Organization.destroy_all
# User.destroy_all

puts "deleted all"

organization_name_ending_arr = ["Foundation","Association","International","Organization","Research"]
problems_arr = ["problems","issues","disease"]
places_arr = ["brooklyn","the bronx","manhattan","queens","la mesa","el cajon","la jolla","mira mesa"]

########################
#Gods of Canabis NonProfits
########################
10.times do
  ####NameGenerator
  # g_name = Faker::Ancient.unique.titan
  g_name = Faker::JapaneseMedia::DragonBall.character
  ending = organization_name_ending_arr[rand(0..organization_name_ending_arr.length-1)]
  abr = Faker::Cannabis.cannabinoid_abbreviation
  medical = Faker::Cannabis.unique.medical_use
  problem = problems_arr[rand(0..problems_arr.length-1)]
  name = ( "#{g_name}'s #{abr} for #{medical} #{problem} #{ending}'").titleize

  org = Organization.new(name:name, homepage_url:"https://www.nationalbreastcancer.org")

  #####Logo Generator
  org.logo_url = Faker::Avatar.unique.image

  #####Misssion Statement Generator
  cannabis = Faker::Cannabis.cannabinoid
  mission = "#{g_name}'s mission is to use #{cannabis} to help cure #{medical} #{problem}."
  org.mission_statement = mission

  #####Bio Generator
  benefit = Faker::Cannabis.unique.health_benefit
  type = Faker::Cannabis.type
  category = Faker::Cannabis.unique.category
  bio = "#{g_name} has had #{medical} #{problem} for centuries. They found relief through #{abr} or #{cannabis}. This #{type} #{benefit} and is being heavily researched by our team. We prefer the #{category} method for use."
  org.bio = bio


  #####Address Generator
  location = places_arr[rand(0..places_arr.length-1)].titleize
  org.address = location

  # puts ""
  # puts org.name
  # puts org.logo_url
  # puts org.mission_statement
  # puts org.address
  # puts org.bio

  org.save()
  ########################
  #Organization Contacts
  ########################
  phone = Faker::PhoneNumber.cell_phone

  mail = "test123@gmail.com"

  contact = OrganizationContact.create(organization_id:org.id,phone:phone,email:mail)

########################
#Organization Socials
########################
twitter_url =" https://twitter.com/"
insta_url = "https://www.instagram.com/"

social1 = OrganizationSocial.create(organization_id:org.id,social_media_name:"Twitter",url:twitter_url)

social2 = OrganizationSocial.create(organization_id:org.id,social_media_name:"Instagram",url:insta_url)

########################
#Organization Images
########################
  10.times do 
    link = Faker::LoremFlickr.image("500x500", ['helping','help'])

    OrganizationImage.create(organization_id:org.id, img_url:link)
  end

    2.times do 
      day_arr = Array(1..31)
      day = day_arr[rand(0..day_arr.length-1)]
      month_arr = Array(1..12)
      month = month_arr[rand(0..month_arr.length-1)]
      new_benefit = Faker::Cannabis.unique.health_benefit

      name = "#{g_name}'s #{cannabis} drive."
      description = "#{g_name} is hosting a #{cannabis} drive. All donations will go toward research for #{new_benefit} research."
      complete = "pending"
      img_url = Faker::LoremFlickr.image("500x500", ['helping','help'])
      date = "2019-#{month}-#{day} 18:00:00"
      
      Event.create(organization_id:org.id,name:name,date:date,complete:complete, description:description, img_url:img_url)
    end

end

########################
#Users
########################
stein = User.create(email:"bruh@bruh", password:"bruh", username:"bruh")

########################
#Initial Supporter
########################
orgs = Organization.all
orgs.each do |org|
  Supporter.create(organization_id:org.id,user_id:stein.id)
end

########################
#Gods of Canabis NonProfits
########################


