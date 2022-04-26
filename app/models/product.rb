class Product < ApplicationRecord

    belongs_to :departamento, optional: true

    validates :preco, :quantidade, :departamento, presence: true
    validates :nome, length: {minimum: 4}

end
