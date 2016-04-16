FactoryGirl.define do
  factory :review do
    rating "1"
    comment "MyText"
  end
  factory :review_rating_blank, class: "Review" do
    rating "0"
    comment "MyText1"
  end
end
