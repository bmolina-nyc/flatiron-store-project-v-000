class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items 

  def total
    self.items.collect{ |i| i.price}.inject(:+)
  end

  def add_item(item_id)


    item = Item.find(item_id)
    line_item = line_items.detect { |li| li.item_id == item.id }

    if line_item
      line_item.quantity += 1 
      item.inventory -= 1 
      line_item.save
      item.save 
      self.save
    else
      line_item = LineItem.new(cart_id: self.id, item_id: item.id, cart: self)
      item.inventory -= 1 
      item.save 
    end

    line_item
  end
  
end
