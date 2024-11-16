import 'package:flutter/material.dart';

class MyChipText extends StatefulWidget {
  const MyChipText({super.key});

  @override
  State<MyChipText> createState() => _MyChipTextState();
}

class _MyChipTextState extends State<MyChipText> {
  final List<String> filters = const [
    "Floral",
    "Aquatic",
    "Woody",
    "Fruity",
    "Oriental",
    "Gourmand",
    "Chypre",
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: filters.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final filter = filters[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = filter;
                });
              },
              child: Chip(
                backgroundColor: selectedFilter == filter
                    ? Colors.amber
                    : Theme.of(context).colorScheme.secondary,
                side: BorderSide.none,
                label: Text(filter),
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
