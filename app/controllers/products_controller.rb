class ProductsController < ApplicationController
  before_action :authorize_request
  
  def index
    products = Product.all

    render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      available: true
    )

    if product.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end
end
