require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :transaction

    def initialize(employee_discount = 0)
      @total = 0
      @discount = employee_discount
      @items = []
      @transaction = []
    end

    def add_item(item, price, quatinty = 1)
      self.total += price * quatinty
      quatinty.times do
          self.items << item
      end
      self.transaction << price
    end

    def apply_discount
      if self.discount != 0
        self.total = self.total - (self.total*(self.discount.to_f/100)).round
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end

    def void_last_transaction
        self.items.pop
        self.total -= self.transaction.pop
    end

end
