require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_item
    attr_reader :items

    def initialize discount = nil
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item item, price, quantity = 1
        self.total += price * quantity
        quantity.times { self.items << item }
        self.last_item = {price: price, quantity: quantity}
        # binding.pry
    end

    def apply_discount
        return "There is no discount to apply." unless self.discount
        discount = self.discount.to_f / 100.0
        self.total = self.total - discount * self.total
        self.total = self.total.to_i if self.total / self.total.to_i == 1.0
        "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        self.last_item[:quantity].times { self.items.pop }
        self.total -= self.last_item[:price] * self.last_item[:quantity]
    end
end

# register = CashRegister.new(10)
# register.add_item('cheese', 2.5, 3)
