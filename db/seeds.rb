PublicActivity.enabled = false

User.create!(email: 'nnand85@gmail.com', password: 'Password1', password_confirmation: 'Password1')

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