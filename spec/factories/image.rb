FactoryBot.define do
  factory :image do
    image_url  {File.new("#{Rails.root}/spec/fixtures/test.jpg")}
  end
end