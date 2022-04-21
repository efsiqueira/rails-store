class ProductsController < ApplicationController

    def index
        @produtos = Product.order(:nome)
        @produto_com_desconto = Product.order(:preco).limit 1
    end

    def create
        produto = params.require(:product).permit(:nome, :descricao, :preco, :quantidade)
        Product.create produto
        redirect_to root_path
    end

    def destroy
        id = params[:id]
        Product.destroy id
        redirect_to root_path
    end

    def search
        @nome = params[:nome]
        @products = Product.where "nome like ?", "%#{@nome}%"
    end

end
