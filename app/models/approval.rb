class Approval < ApplicationRecord
    belongs_to :approvable, polymorphic: true
  end