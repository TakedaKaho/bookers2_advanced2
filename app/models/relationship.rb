class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
end

#わからなくなったらhttps://zenn.dev/ganmo3/articles/a3633e8f3209da 