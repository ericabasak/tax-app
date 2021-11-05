class Product < ApplicationRecord

    validates :name, presence: true
    validates :price, presence: true
    validates :imported, inclusion: [true, false]
    validates :exempt, inclusion: [true, false]
    
    SALES_TAX = 0.10
    IMPORTED_SALES_TAX = 0.05

    # price
    def calculatePrice
        (price * SALES_TAX).round(0.05)
    end

    # calculates the sales tax which is 10% on all items EXCEPT books, food, medical
    def self.calculateSalesTax(product)
        taxable_products = product.select {|p| !p.exempt }
        sum = 0
        taxable_products.each {|s| sum = sum + s.calculatePrice}
        return sum
    end

    # calculates the import duty which is 5% that is an additional sales tax on items that are imported
    def self.calculateImportTax(product)
        taxable_imported_goods = product.select {|f| f.imported }
        price_in_cents = taxable_imported_goods.sum {|p| p.price }
        return price_in_cents * IMPORTED_SALES_TAX
    end

    def self.totalBillIncludingPriceAndAllTaxes(product)
        calculateSalesTax(product) + calculateImportTax(product) + product.sum {|s| s.price }
    end

end
