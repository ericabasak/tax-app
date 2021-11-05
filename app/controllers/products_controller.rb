class ProductsController < ApplicationController

    helper_method :convertToDollar

    def index
        @products = Product.all
    end

    def addItem
        params.require(:products).permit(:id)
        p = Product.find(params[:products][:id])
        if p.nil?
            render status: 404
        end

        session[:items] = session[:items] ||[]
        session[:items] << p.id

        @cart = []
        session[:items].each do |item|
            @cart << Product.find(item)
        end

        @tax = Product.calculateSalesTax(@cart)
        @importedTax = Product.calculateImportTax(@cart)
        @totalBill = Product.totalBillIncludingPriceAndAllTaxes(@cart)
    end

    def clearSession
        session.clear
        redirect_to products_url
    end

    def destroy
        session[:items] = session[:items].filter{ |e| e != params[:id].to_i }
        redirect_to products_path
    end

    # helper method
    def convertToDollar(price)
        (price.to_f/100).round(2)
    end

    
end 
