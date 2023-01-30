# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
    validates :captured, inclusion: [true, false]
    validates :number, :name, :attack, :defense, :poke_type, :image_url, presence: true
    validates :name length: {minimum: 3, maximum: 255}
    validates :name, :number, uniqueness: {message: "'%{value}' is already in use"}
    validates :attack, :defense, numericality: {in: 0..100}
    validates :number numericality: {greater_than: 0}
    validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not a valid Pokemon type" }
  
    TYPES = [
        'fire',
        'electric',
        'normal',
        'ghost',
        'psychic',
        'water',
        'bug',
        'dragon',
        'grass',
        'fighting',
        'ice',
        'flying',
        'poison',
        'ground',
        'rock',
        'steel'
    ].sort.freeze

end
