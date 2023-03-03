module ApplicationHelper
  def cart_count_over_one
    return total_cart_items if total_cart_items > 0
  end

end
