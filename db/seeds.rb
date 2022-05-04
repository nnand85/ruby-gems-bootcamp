PublicActivity.enabled = false

if User.find_by_email("nnand85@gmail.com").nil?
  admin = User.create!(email: "nnand85@gmail.com", password: "Password1", password_confirmation: "Password1", confirmed_at: Time.now)
  # admin.skip_confirmation!
  admin.add_role(:admin) unless admin.has_role?(:admin)
  admin.add_role(:teacher) unless admin.has_role?(:teacher)
end

30.times do
    Course.create!([{
        title: Faker::Educator.course_name,
        description: Faker::TvShows::GameOfThrones.quotes,
        user_id: User.last.id,
        short_description: Faker::Quote.famous_last_words,
        language: 'English',
        level: 'Intermediate',
        price: Faker::Number.between(from: 10, to: 1000)
    }])
end