import 'package:aura_blend/models/product.dart';
import 'package:flutter/material.dart';
import 'package:aura_blend/components/add_to_cart_button.dart';
import 'package:aura_blend/components/my_cart_tile.dart';
import 'package:aura_blend/pages/delivery_progress_page.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    //! Razorpay
    Razorpay razorpay = Razorpay();

    void handlePaymentSuccess(PaymentSuccessResponse response) {
      // Do something when payment succeeds
      Fluttertoast.showToast(msg: "Payment Success");
    }

    void handlePaymentError(PaymentFailureResponse response) {
      // Do something when payment fails
      Fluttertoast.showToast(msg: "Payment Failed");
    }

    @override
    // ignore: unused_element
    void dispose() {
      super.dispose();
      razorpay.clear();
    }

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);

    var options = {
      'key': 'rzp_test_GcZZFDPP0jHtC4',
      'amount': 1000,
      'name': 'Regal Biryani',
      'description': 'Food Order',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com',
      }
    };

    return Consumer<Product>(
      builder: (context, restaurant, child) {
        //! cart
        final userCart = restaurant.cart;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: const Text('Order details'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //! clear cart button
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Are you sure you want to clear the order details?",
                      ),
                      actions: [
                        //! cancel button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        //! yess button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              //! list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Order is empty.."),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              //! button to pay
              userCart.isEmpty
                  ? const SizedBox()
                  : AddToCartButton(
                      onTap: () async {
                        final restaurant =
                            Provider.of<Product>(context, listen: false);
                        final receipt = restaurant
                            .displayCartReceipt(); // Generate receipt before clearing cart

                        options['amount'] = restaurant.getTotalPrice() *
                            100; // Update Razorpay amount
                        razorpay.open(options);

                        // Navigate to DeliveryProgressPage with the receipt
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DeliveryProgressPage(receipt: receipt),
                          ),
                        );

                        // Clear cart after navigation
                        restaurant.clearCart();
                      },
                      text: "Place My Order",
                    ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
