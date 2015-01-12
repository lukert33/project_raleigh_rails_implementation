# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

color_chall = '<div class="container">
  <div id="timer">
    <div id="visualizer" class="circle-base">
    </div>

    <div class="prompt">
      <p><em>space</em> alters</p>
      <p><em>z</em> captures...</p>
    </div>
  </div>
</div>

<script type="text/javascript" src="/js/color-meter/breathclock.js"></script>
<script type="text/javascript" src="/js/color-meter/visualizer.js"></script>
<script type="text/javascript" src="/js/color-meter/runner.js"></script>'

i = 1
until i == 22
  page = Page.create(body: Faker::Lorem.paragraphs(5).join("\n"), next_page_id: i+1)
  if page.id % 3 == 0
    Challenge.create(page_id: page.id, success_page_id: i+1, fail_page_id: i+2, html_display: color_chall)
    page.next_page = nil
    page.save
  end
  i+=1
end

pro_users = []
5.times do
  pro_users << User.create(username:Faker::Internet.user_name, password:Faker::Internet.password, email: Faker::Internet.email)
end

new_users = []
3.times do
  new_users << User.create(username:Faker::Internet.user_name, password:Faker::Internet.password, email:Faker::Internet.email)
end

pro_users.each do |user|
  i = 0
  until i > Challenge.all.count
    outcome = [true,false].sample
    UserChallenge.create(user_id: rand(user.id), challenge_id: i, success: outcome )
    i+=1
  end
end

pro_users.each do |user|
  i = 1
  until i > Page.all.count
    UserPage.create(user_id: user.id, page_id: i)
    i += 1
  end
end
