import 'package:flutter/material.dart';

class MyReceipt extends StatelessWidget {
  final String receipt;

  const MyReceipt({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Thank you for your order!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Text(receipt),
            ),
            const SizedBox(height: 25),
            const Text("Estimated delivery time is: 40min"),
            const SizedBox(height: 25),
            const Text("Delivery phone number is: 0346443131")
          ],
        ),
      ),
    );
  }
}
