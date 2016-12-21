class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def total 
    item = Item.find(self.item_id)
    self.quantity * item.price
  end
  
end
