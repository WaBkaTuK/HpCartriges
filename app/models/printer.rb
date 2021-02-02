class Printer < ApplicationRecord
  @file
belongs_to :cartrige


  validates :title,
   presence: true, length: { minimum: 5 , too_short: "Мало символов, минимум 5"}
  validates :description,
  presence: true, length: { minimum: 5 , too_short: "Мало символов, минимум 5"}
  validates :cartrige_id, presence: true, numericality: { only_integer: true}


end
