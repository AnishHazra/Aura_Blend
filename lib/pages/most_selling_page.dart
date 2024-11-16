import 'package:aura_blend/models/product.dart';
import 'package:aura_blend/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:aura_blend/components/most_selling_food_tile.dart';
import 'package:aura_blend/components/my_chip_text.dart';
import 'package:aura_blend/components/my_drawer.dart';
import 'package:aura_blend/components/my_promo_banner.dart';
import 'package:aura_blend/pages/cart_page.dart';
import 'package:aura_blend/pages/home_page.dart';
import 'package:provider/provider.dart';

class MostSellingPage extends StatelessWidget {
  const MostSellingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<Product>();
    final foodMenu = restaurant.menu;
    return Scaffold(
      appBar: AppBar(
        actions: [
          //! Cart button
          IconButton(
            onPressed: () {
              //! go to cart page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
        backgroundColor: const Color(0xffcad3e0),
        title: const Text("Aura Blend"),
      ),
      drawer: const MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffcad3e0), Color(0xffb6d0f3)],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const MyPromoBanner(),
            const MyChipText(),
            //! menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most popular foods",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //! go to food page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => MostSellingFoodTile(
                  food: foodMenu[index],
                  onTap: () {
                    //! go to food detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemPage(
                          food: foodMenu[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),
            //! popular food
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/images/16.jpeg",
                          height: 60,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          Text(
                            "Dior",
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //price
                          Text(
                            "₹320",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //heart icon
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                    size: 28,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
