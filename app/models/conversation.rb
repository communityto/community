class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  validates :author, uniqueness: {scope: :receiver}

  scope :participating, -> (user) do
  where("(Conversations.author_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
  end
end
