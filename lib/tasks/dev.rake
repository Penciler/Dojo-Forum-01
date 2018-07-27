namespace :dev do

  task all: [:reset, :fake_user, :fake_catagory, :fake_post, :fake_reply]

  task reset: :environment do
    User.destroy_all
    Reply.destroy_all
    Post.destroy_all
    Catagory.destroy_all
  end

  task fake_user: :environment do
    
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

    5.times do
      Catagory.create!(
        name:  FFaker::Product.brand,
      )
    end
    puts 'have created fake users'
    puts "now you have #{Catagory.count} catagories data"
  end

  task fake_post: :environment do

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

  task fake_reply: :environment do

    5.times do
      post_id=Post.all.sample.id
      25.times do
        Reply.create!(
          content: FFaker::Lorem.paragraphs,
          user_id: User.all.sample.id,
          post_id: post_id
      )
      end
    end

    puts 'have created fake replies'
    puts "now you have #{Reply.count} replies data"
  end  

end