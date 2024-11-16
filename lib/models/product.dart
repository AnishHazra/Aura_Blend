import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:aura_blend/models/cart_item.dart';
import 'package:aura_blend/models/item.dart';
import 'package:intl/intl.dart';

class Product extends ChangeNotifier {
  //! list of food menu
  final List<Food> _menu = [
    //! chanel
    Food(
      name: 'Chanel No. 5',
      imagePath: 'assets/images/1.jpeg',
      price: 120,
      description:
          "The timeless classic with a blend of aldehydes, jasmine, and ylang-ylang.",
      category: FoodCategory.chanel,
      availableAddons: [
        Addon(name: "Half", price: 120),
        Addon(name: "Full", price: 200),
      ],
    ),
    Food(
      name: 'Coco Mademoiselle',
      imagePath: 'assets/images/2.jpeg',
      price: 320,
      description:
          "A modern, fresh, and sophisticated scent with citrus, rose, and patchouli notes.",
      category: FoodCategory.chanel,
      availableAddons: [
        Addon(name: "Half", price: 180),
        Addon(name: "Full", price: 320),
      ],
    ),
    Food(
      name: 'Chance Eau Tendre',
      imagePath: 'assets/images/3.jpeg',
      price: 150,
      description:
          "A delicate, fruity-floral fragrance with grapefruit, quince, and white musk.",
      category: FoodCategory.chanel,
      availableAddons: [
        Addon(name: "Half", price: 150),
        Addon(name: "Full", price: 280),
      ],
    ),
    Food(
      name: 'Bleu de Chanel',
      imagePath: 'assets/images/4.jpeg',
      price: 120,
      description:
          "A refined and masculine fragrance featuring citrus, ginger, and woody accords.",
      category: FoodCategory.chanel,
      availableAddons: [
        Addon(name: "Half", price: 120),
        Addon(name: "Full", price: 200),
      ],
    ),
    Food(
      name: 'Gabrielle Chanel',
      imagePath: 'assets/images/5.jpeg',
      price: 250,
      description:
          "A radiant floral perfume with notes of jasmine, orange blossom, and tuberose.",
      category: FoodCategory.chanel,
      availableAddons: [
        Addon(name: "Half", price: 250),
        Addon(name: "Full", price: 350),
      ],
    ),

    //! Dior
    Food(
      name: 'J’adore',
      imagePath: 'assets/images/6.jpeg',
      price: 100,
      description:
          "A luxurious and feminine fragrance with a blend of floral notes like jasmine, rose, and ylang-ylang.",
      category: FoodCategory.dior,
      availableAddons: [
        Addon(name: "5PCS", price: 100),
        Addon(name: "10PCS", price: 180),
      ],
    ),
    Food(
      name: 'Miss Dior',
      imagePath: 'assets/images/7.jpeg',
      price: 100,
      description:
          "A romantic and elegant scent featuring a mix of citrus, rose, and patchouli.",
      category: FoodCategory.dior,
      availableAddons: [
        Addon(name: "5PCS", price: 100),
        Addon(name: "10PCS", price: 180),
      ],
    ),
    Food(
      name: 'Sauvage',
      imagePath: 'assets/images/8.jpeg',
      price: 100,
      description:
          "A bold and fresh fragrance for men, combining bergamot, pepper, and ambergris.",
      category: FoodCategory.dior,
      availableAddons: [
        Addon(name: "2PCS", price: 100),
        Addon(name: "5PCS", price: 180),
      ],
    ),

    //! Tom Ford
    Food(
      name: 'Black Orchid',
      imagePath: 'assets/images/9.jpeg',
      price: 60,
      description:
          "A bold and luxurious fragrance with notes of black truffle, black orchid, patchouli, and vanilla.",
      category: FoodCategory.tomFord,
      availableAddons: [
        Addon(name: "Half", price: 60),
        Addon(name: "Full", price: 100),
      ],
    ),
    Food(
      name: 'Oud Wood',
      imagePath: 'assets/images/10.jpeg',
      price: 70,
      description:
          "A rich and exotic scent featuring oud, sandalwood, rosewood, and spices, perfect for a refined and sophisticated aura.",
      category: FoodCategory.tomFord,
      availableAddons: [
        Addon(name: "Half", price: 70),
        Addon(name: "Full", price: 120),
      ],
    ),
    Food(
      name: 'Tobacco Vanille',
      imagePath: 'assets/images/11.jpeg',
      price: 100,
      description:
          "A warm and spicy blend of tobacco leaf, vanilla, cocoa, and dried fruits, exuding opulence and comfort.",
      category: FoodCategory.tomFord,
      availableAddons: [
        Addon(name: "Half", price: 100),
        Addon(name: "Full", price: 180),
      ],
    ),

    //! YSL
    Food(
      name: 'Libre',
      imagePath: 'assets/images/12.jpeg',
      price: 70,
      description:
          "A bold and modern fragrance with lavender, orange blossom, and musk, symbolizing freedom and strength.",
      category: FoodCategory.ysl,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 10),
        Addon(name: "Extra Patties", price: 20),
      ],
    ),
    Food(
      name: 'Black Opium',
      imagePath: 'assets/images/13.jpeg',
      price: 100,
      description:
          "A seductive, warm scent with coffee, vanilla, and white flowers, offering a rich, addictive experience.",
      category: FoodCategory.ysl,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 10),
        Addon(name: "Extra Patties", price: 20),
      ],
    ),
    Food(
      name: 'Mon Paris',
      imagePath: 'assets/images/14.jpeg',
      price: 120,
      description:
          "A sweet, romantic fragrance with notes of strawberry, pear, jasmine, and patchouli, inspired by the city of love.",
      category: FoodCategory.ysl,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 10),
        Addon(name: "Extra Patties", price: 20),
      ],
    ),
  ];

  //! user cart
  final List<CartItem> _cart = [];

  //! delivery address
  String _deliveryAddress = '1004, 26 Pragati Tower';

  /*Getters*/
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*Operations*/

  //! add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //! check if the food items are the same
      bool isSameFood = item.food == food;

      //! check if the last of selected addons the same
      bool isSameAddons = const ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });

    //! if the food is already exists increase it
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //! otherwise, add a new cart items
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //! remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //! get total price
  int getTotalPrice() {
    int total = 0;
    for (CartItem cartItem in _cart) {
      int itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //! get total number of items
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //! clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //! update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*Helpers*/

  //! generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    //! format the date to include up to seconds only
    String formattedDate =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${cartItem.food.price.toStringAsFixed(2)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ₹${getTotalPrice().toStringAsFixed(2)}");
    receipt.writeln();
    receipt.writeln("Delivery Address: $deliveryAddress");

    return receipt.toString();
  }

  //! format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (${addon.price})").join(", ");
  }
}
