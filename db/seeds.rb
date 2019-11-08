# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unicorn_array = %w(ava celeste chad classy cloud9 dash disco eco flamare fluttershy granny james jd julia midnight patpat peta pripri sassy skrank sunny zevra ziara)

count = 1

if Unicorn.count == 0 
for i in unicorn_array 
    unicorn = Unicorn.new(name: i, original_price: rand(100..100000))
    unicorn.pic.attach(io: File.open("app/assets/images/unicorns/#{i}.png"), filename: "#{i}.png", content_type: "image/png")
    unicorn.save 
    p "created #{i} <3"

    user= User.create(email: "test#{count}@test.com", password: "Password123")
    count += 1

    user.unicorns.push(unicorn)
end 
    
end