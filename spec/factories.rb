FactoryGirl.define do
  factory(:question) do
    title('A Question')
    text('What is the meaning of life')
  end

  factory(:answer) do
    title('The meaning of life')
    text('Its all about the journey, man.')
  end
end
