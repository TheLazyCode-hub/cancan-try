class Post < ApplicationRecord
    has_paper_trail only: [:title, :body]
    belongs_to :user
    enum status: { draft: 0, verified: 1, authorized: 2 }

    def latest_authorized_version
        versions.where(status: 'authorized').last
      end
end
