import 'package:aura_blend/models/item.dart';
import 'package:aura_blend/models/product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aura_blend/components/add_to_cart_button.dart';
import 'package:provider/provider.dart';

import '../widgets/image_stack_widget.dart';

class ItemPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  ItemPage({super.key, required this.food});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  //! method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //! close the current food page to go back to menu
    Navigator.pop(context);
    //! format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    //! add the food to cart
    context.read<Product>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //! food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //! food price
                      Text(
                        "₹${widget.food.price}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //! food description
                      Text(widget.food.description),

                      const SizedBox(height: 10),

                      Divider(
                        color: Theme.of(context).colorScheme.surface,
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Review",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: ImageStackWidget(),
                              ),
                              Text(
                                "+100",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),

                      //! addons
                      // Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: Theme.of(context).colorScheme.surface,
                      //     ),
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     padding: EdgeInsets.zero,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemCount: widget.food.availableAddons.length,
                      //     itemBuilder: (context, index) {
                      //       //! get individual addon
                      //       Addon addon = widget.food.availableAddons[index];

                      //       return CheckboxListTile(
                      //         title: Text(addon.name),
                      //         subtitle: Text(
                      //           "₹${addon.price}",
                      //           style: TextStyle(
                      //             color: Theme.of(context).colorScheme.primary,
                      //           ),
                      //         ),
                      //         value: widget.selectedAddons[addon],
                      //         onChanged: (bool? value) {
                      //           setState(() {
                      //             widget.selectedAddons[addon] = value!;
                      //           });
                      //         },
                      //       );
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
                //! button -> add to cart
                AddToCartButton(
                  onTap: () {
                    addToCart(widget.food, widget.selectedAddons);
                    Fluttertoast.showToast(msg: "Add to cart");
                  },
                  text: "Add To Cart",
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        //! back button ->
        SafeArea(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: const Color(0xffFFF0F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.red,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
