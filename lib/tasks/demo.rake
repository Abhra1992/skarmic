require 'faker'
namespace :db do
  desc "Load Demo Data in Dev DB"
  task :demo => :environment do
    puts "Adding Companies"
    10.times do
      Company.new do |c|
        c.name = Faker::Company.name
        c.address = "%s, %s" % [Faker::Address.street_address, Faker::Address.street_name]
        c.city = Faker::Address.city
        c.state = Faker::Address.state_abbr
        c.zip = Faker::Address.zip
        c.established = 1990 + rand(30)
        c.about = Faker::Lorem.paragraphs(3)
        c.benefits = Faker::Lorem.sentences(4)
        c.save
      end
    end

    puts "Adding Recruiters and Positions"
    Company.find_each do |c|
      5.times do
        Recruiter.new do |r|
          r.fname = Faker::Name.first_name
          r.lname = Faker::Name.last_name
          r.username = Faker::Internet.user_name(r.name)
          r.company = c
          r.email = Faker::Internet.email(r.fname)
          r.password = "00000000"
          r.save
        end
      end
    end
  end
end