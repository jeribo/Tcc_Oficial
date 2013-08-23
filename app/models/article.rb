class Article < ActiveRecord::Base
  attr_accessible :body, :body_html, :slug, :title
  extend FriendlyId
  friendly_id :title, use: :slugged
  before_save :generate_html
  private
    def should_generate_new_friendly_id?
      new_record?
    end
    def generate_html
      self.body_html = RDiscount.new(self.body).to_html
    end
end
