class Bar

  def initialize()

    @drink_price_list = {
      "Beer" => 3.55,
      "Cider" => 2.90,
      "Jack Daniels" => 3.75,
      "Margarita" => 4.10
    }

  end

  def add_drink_to_guest_tab(guest, drink)
    if guest.tab + @drink_price_list[drink] <= guest.cash
       guest.increase_guest_tab(@drink_price_list[drink])
       return true
    else
      "Sorry, pal - no more drinks for you. You're out of cash!"
      return false
    end
  end

end
