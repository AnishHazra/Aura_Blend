import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aura_blend/components/my_promo_button.dart';

class MyPromoBanner extends StatelessWidget {
  const MyPromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! promo message
          Column(
            children: [
              Text(
                "Get 30% Promo",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),

              const SizedBox(height: 20),
              //redeem button
              MyPromoButton(
                  text: "Redeem",
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "Added this feature soon",
                    );
                  }),
            ],
          ),
          Image.asset(
            'assets/images/promo_image.png',
            height: 150,
          )
        ],
      ),
    );
  }
}
