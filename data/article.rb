# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
  validates :category, presence: true
  validates :author, presence: true
end