FactoryGirl.define do
  factory :challenge do
    html_display {"<h1>This is a challenge</h1>"}

    after(:create) do |challenge|
      challenge.page = FactoryGirl.create(:page)
      challenge.success_page = FactoryGirl.create(:page)
      challenge.fail_page = FactoryGirl.create(:page)
    end
  end

end
