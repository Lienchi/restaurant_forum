namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        image: File.open(Rails.root.join("seed_img/restaurant/#{rand(1..20)}.jpg")),
        favorites_count: 0
      )
    end
    puts "have created fake restaurants!"
    puts "now you have #{Restaurant.count} restaurants data!"
  end
end

namespace :dev do
  task fake_user: :environment do
    User.destroy_all

    User.create!(
      email: "root@example.com",
      password: "12345678",
      name: "Root",
      intro: FFaker::Lorem.sentence,
      role: "admin",
      avatar: File.open(Rails.root.join("seed_img/avatar/#{rand(1..10)}.png"))
    )
    20.times do |i|
      User.create!(
        email: FFaker::Internet.email,
        password: "12345678",
        name: FFaker::Name.first_name,
        intro: FFaker::Lorem.sentence,
        avatar: File.open(Rails.root.join("seed_img/avatar/#{rand(1..10)}.png"))
      )
    end
    puts "have created admin and fake users!"
    puts "now you have #{User.count} users data!"
  end
end

namespace :dev do
  task fake_comment: :environment do
    Comment.destroy_all

    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.paragraph,
          user: User.all.sample
        )
      end
    end
    puts "have created fake comments!"
    puts "now you have #{Comment.count} comments data!"
  end
end