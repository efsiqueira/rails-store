class ProductsController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]

    def index
        @produtos = Product.order(:nome).limit 6
        @produto_com_desconto = Product.order(:preco).limit 1
    end

    def new
        @produto = Product.new
        @departamentos = Departamento.all
    end

    def create
        @produto = Product.new produto_params
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso."
            redirect_to root_path
        else
            renderiza :new
        end
    end

    def edit
        renderiza :edit
    end

    def update
        if @produto.update produto_params
            flash[:notice] = "Produto atualizado com sucesso."
            redirect_to root_url
        else
            renderiza :edit
        end
    end

    def destroy
        @produto.destroy
        redirect_to root_path
    end

    def search
        @nome = params[:nome]
        @products = Product.where "nome like ?", "%#{@nome}%"
    end

    private

    def produto_params
        params.require(:product).permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
    end

    def set_produto
        @produto = Product.find(params[:id])
    end

    def renderiza(view)
        @departamentos = Departamento.all
        render view
    end

end
