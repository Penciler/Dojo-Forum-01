namespace :dev do

  task all: [:fake_user, :fake_catagory, :fake_post]

  task fake_user: :environment do
    User.destroy_all

    20.times do
      User.create!(
        name:  FFaker::Name.first_name,
        email: FFaker::Internet.unique.email,      
        password: '12345678',
      )
    end
    puts 'have created fake users'
    puts "now you have #{User.count} users data"
  end

  task fake_catagory: :environment do
    Catagory.destroy_all

    5.times do
      Catagory.create!(
        name:  FFaker::Product.brand,
      )
    end
    puts 'have created fake users'
    puts "now you have #{Catagory.count} catagories data"
  end

  task fake_post: :environment do
    Post.destroy_all

    50.times do
      Post.create!(
        title:  FFaker::Lorem.phrase,
        content: FFaker::Lorem.paragraphs,
        user_id: User.all.sample.id,
        catagory_id: Catagory.all.sample.id
      )
    end

    puts 'have created fake users'
    puts "now you have #{Post.count} posts data"
  end

end