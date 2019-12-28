class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content, :creator
    belongs_to :message
end
