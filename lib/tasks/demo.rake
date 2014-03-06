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
  end
end