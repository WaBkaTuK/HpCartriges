class Cartrige < ApplicationRecord
  @file
  has_many :printers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 , too_short: "Мало символов, минимум 5"}
  validates :description, presence:true, length: { minimum: 5 , too_short: "Мало символов, минимум 5"}
  validates :color, presence: true, length: { minimum: 5 , too_short: "Мало символов, минимум 5"}
  validates :resource, presence: true, numericality: { only_integer: true, greater_than: 999, message: "Должно быть больше 999" }

  def get_printers
  end
end
