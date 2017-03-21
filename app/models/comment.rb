class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :room
end
