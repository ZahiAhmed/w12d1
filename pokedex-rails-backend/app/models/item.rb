# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  name       :string           not null
#  price      :integer          not null
#  happiness  :integer          not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
  validates :name length: {maximum: 255}, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :happiness, :image_url, :price, presence: true
  
  
  belongs_to :pokemon,
    primary_id: :id,
    foreign_key: :pokemon_id,
    className: :Pokemon

  
end
