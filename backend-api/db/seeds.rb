Comment.destroy_all
Comment.reset_pk_sequence
Message.destroy_all
Message.reset_pk_sequence

20.times do 
  Message.create!(
    content: Faker::Hipster.paragraphs(number: 1),
    creator: Faker::Name.name
  )
end

p "#{Message.count} messages created😊"

def coomment_sauce(msg)
  coin_toss = Faker::Boolean.boolean(true_ratio: 0.6)
  Faker::Number.between(from: 3, to: 10).times do
    Comment.create!(
      content: Faker::Hipster.sentence,
      creator: Message.all.sample.creator,
      message_id: msg.id
    ) 
  end if coin_toss == true
end

Message.all.each do |msg|
  coomment_sauce(msg)
  if msg.comments.count != 0
    p "#{msg.comments.count} comments created on #{msg.creator}'s message 😊" 
  end
end