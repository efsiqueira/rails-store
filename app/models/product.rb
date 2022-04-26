class Product < ApplicationRecord

    belongs_to :departamento, optional: true

    validates :preco, :quantidade, presence: true
    validates :nome, length: {minimum: 4}

end
