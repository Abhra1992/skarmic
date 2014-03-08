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

    puts "Company Recruiters and Positions"
    Company.find_each do |c|
      puts "Adding Recruiters"
      3.times do
        c.recruiters.new do |r|
          r.fname = Faker::Name.first_name
          r.lname = Faker::Name.last_name
          r.username = Faker::Internet.user_name(r.fname)
          r.email = Faker::Internet.email(r.fname)
          r.password = "00000000"
          r.save
        end
      end

      puts "Adding Positions"
      3.times do
        c.positions.new do |p|
          p.title = Faker::Name.title
          p.hours = 20 + rand(30)
          p.duration = 0
          p.skills_required = Faker::Lorem.sentences(5)
          p.skills_desired = Faker::Lorem.sentences(3)
          p.compensation = 1000 + 100 * rand(6)
          p.responsibilities = Faker::Lorem.sentences(5)
          p.count = 1 + rand(10)
          p.available_from = rand(100).days.from_now.to_date
          p.save
        end
      end

      puts "Connecting Recruiters to Positions"
      6.times do
        r = c.recruiters.sample
        p = c.positions.sample
        r.positions << p
      end
    end

    puts "Adding Candidates"
    20.times do
      Candidate.new do |c|
        c.fname = Faker::Name.first_name
        c.lname = Faker::Name.last_name
        c.username = Faker::Internet.user_name(c.fname)
        c.about = Faker::Lorem.sentence
        c.city = Faker::Address.city
        c.email = Faker::Internet.email(c.fname)
        c.password = "00000000"
        c.save
      end
    end

    puts "Adding Applications"
    Position.find_each do |p|
      Candidate.all.sample(5).each do |c|
        p.applications.new do |a|
          a.candidate = c
          a.stage = 0
          a.rating = rand(6)
          a.save
        end
      end
    end

    puts "Adding Messages and Notes"
    Application.find_each do |a|
      (c, r) = [a.candidate, a.recruiters.sample]
      6.times do
        a.messages.new do |m|
          m.body = Faker::Lorem.sentence
          m.messager = [c, r].sample
          m.save
        end
      end
    end
  end
end