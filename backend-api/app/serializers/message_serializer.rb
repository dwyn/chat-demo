class MessageSerializer < ActiveModel::Serializer
    attributes :id, :content, :creator
    has_many :comments, dependent: :destroy
end
