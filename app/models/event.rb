class Event < ActiveRecord::Base

  attr_accessible :city, :start_date, :start_time, :end_date, :end_time, :description, :state, :street, :street2, :title, :zip, :creator_id, :updated_at, :created_at, :price, :image_url

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item


  # belongs_to :creator, class_name: "User", inverse_of: :created_events
  # has_and_belongs_to_many :users

  validates :city, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :street, presence: true
  validates :title, presence: true
  validates :zip, presence: true


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |event|
        csv << event.attributes.values_at(*column_names)
      end
    end
  end

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line items present')
      return false
    end
  end
end
