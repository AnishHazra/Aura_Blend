import 'package:flutter/material.dart';

class PerfumePage extends StatelessWidget {
  const PerfumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search your products',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xffcad3e0),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffcad3e0), Color(0xffb6d0f3)],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('POPULAR FRAGRANCES',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBrandLogo('assets/images/burberry_logo.png'),
                  _buildBrandLogo('assets/images/chanel-logo.png'),
                  _buildBrandLogo('assets/images/Dior-Logo.png'),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'POPULAR PRODUCTS',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildProductCard(
                      image: 'assets/images/mystique.jpeg',
                      title: 'Aura Blend',
                      price: '\$222',
                      quantity: '40ml',
                    ),
                    const SizedBox(width: 16.0),
                    _buildProductCard(
                      image: 'assets/images/7.jpeg',
                      title: 'Yves Saint',
                      price: '\$320',
                      quantity: '55ml',
                    ),
                    const SizedBox(width: 16.0),
                    _buildProductCard(
                      image: 'assets/images/9.jpeg',
                      title: 'Hugo Boss',
                      price: '\$420',
                      quantity: '40ml',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'BEST SELLERS',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildProductCard(
                      image: 'assets/images/11.jpeg',
                      title: 'White Balance',
                      price: '\$200',
                      quantity: '60ml',
                    ),
                    const SizedBox(width: 16.0),
                    _buildProductCard(
                      image: 'assets/images/13.jpeg',
                      title: 'Hugo Boss',
                      price: '\$150',
                      quantity: '40ml',
                    ),
                    const SizedBox(width: 16.0),
                    _buildProductCard(
                      image: 'assets/images/17.jpeg',
                      title: 'Yves Saint Laurent',
                      price: '\$300',
                      quantity: '40ml',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandLogo(String brandName) {
    return Container(
      width: 120,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(brandName),
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String title,
    required String price,
    required String quantity,
  }) {
    return Card(
      color: const Color(0xffA37334),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170,
            height: 150,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '($quantity)',
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 60),
                const Icon(Icons.shopping_cart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
