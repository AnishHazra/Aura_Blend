//! food items

class Food {
  final String name;
  final String description;
  final String imagePath;
  final int price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//! food categories

enum FoodCategory {
  chanel,
  dior,
  tomFord,
  ysl,
}

extension FoodCategoryExtension on FoodCategory {
  String toReadableString() {
    switch (this) {
      case FoodCategory.chanel:
        return 'Chanel';
      case FoodCategory.dior:
        return 'Dior';
      case FoodCategory.tomFord:
        return 'Tom Ford';
      case FoodCategory.ysl:
        return 'YSL';
      // Add more cases here if you uncomment other categories
      default:
        return '';
    }
  }
}

//! food addons
class Addon {
  String name;
  int price;

  Addon({
    required this.name,
    required this.price,
  });
}
