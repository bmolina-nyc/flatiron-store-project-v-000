class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items 

  def total
    total = []
    self.line_items.each do |li|
      item = Item.find(li.item_id)
      total << item.price * li.quantity
    end
    total.inject(:+)
  end

  def add_item(item_id)
    item = Item.find(item_id)
    line_item = line_items.detect { |li| li.item_id == item.id }

    if line_item
      line_item.quantity += 1 
      line_item.save
    else
      line_item = LineItem.new(cart_id: self.id, item_id: item.id)
    end
    line_item
  end
  
end
