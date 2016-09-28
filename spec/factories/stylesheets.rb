FactoryGirl.define do
  factory :stylesheet do
    family "Helvetica, sans-serif"
    size 20
    color "#0000FF"
    custom "h2 { font-weight: normal; } "
  end
end
