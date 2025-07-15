class AddProducts < ActiveRecord::Migration[8.0]
 def change
    Product.create(
      title: 'Вкусная',
      description: 'Очень вкусная!',
      price: 350,
      size: 30,
      is_spicy: false,
      is_veg: false,
      is_best_offer: false,
      path_to_image: '/images/1.jpg'
    )

    Product.create(
      title: 'Нихуевая',
      description: 'Та самая!',
      price: 450,
      size: 30,
      is_spicy: false,
      is_veg: false,
      is_best_offer: false,
      path_to_image: '/images/2.jpg'
    )

    Product.create(
      title: 'Каво!?',
      description: 'Ты такую ещё не пробовал!!!',
      price: 550,
      size: 30,
      is_spicy: false,
      is_veg: true,
      is_best_offer: false,
      path_to_image: '/images/3.jpg'
    )
  end
end
