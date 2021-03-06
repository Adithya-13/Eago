import 'package:eago_app/data/models/models.dart';
import 'package:eago_app/presentation/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class DummyData {
  static List<Product> products = [
    Product(
      id: 1,
      title: "Totally Totes",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 102,
      description: _dummyText,
      image: Resources.bag1,
      rating: 5.0,
      seller: 'Maricruz Delgado',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 2,
      title: "Snag a Bag",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 250,
      description: _dummyText,
      image: Resources.bag2,
      rating: 4.9,
      seller: 'Michael Scoffield',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 3,
      title: "Hang Top",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 86,
      description: _dummyText,
      image: Resources.bag3,
      rating: 4.7,
      seller: 'Lincoln Burrows',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 4,
      title: "Old Fashion",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 152,
      description: _dummyText,
      image: Resources.bag4,
      rating: 4.4,
      seller: 'Sara Tancredi',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 5,
      title: "Office Code",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 178,
      description: _dummyText,
      image: Resources.bag5,
      rating: 4.6,
      seller: 'Alexander Mahone',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 6,
      title: "Bag Bounty",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 147,
      description: _dummyText,
      image: Resources.bag6,
      rating: 4.7,
      seller: 'Fernando Sucre',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 7,
      title: "Tropical Totes",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 102,
      description: _dummyText,
      image: Resources.bag1,
      rating: 4.9,
      seller: 'T-Bag',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 8,
      title: "Belt Bag",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 250,
      description: _dummyText,
      image: Resources.bag2,
      rating: 5.0,
      seller: 'John Abruzzi',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 9,
      title: "Beholden Bags",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 86,
      description: _dummyText,
      image: Resources.bag3,
      rating: 4.3,
      seller: 'Brad Bellick',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 10,
      title: "Old Fashion",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 152,
      description: _dummyText,
      image: Resources.bag4,
      rating: 4.2,
      seller: 'LJ Burrows',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 11,
      title: "Tasteful Totes",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 178,
      description: _dummyText,
      image: Resources.bag5,
      rating: 4.1,
      seller: 'James Whistler',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
    Product(
      id: 12,
      title: "Bags to Basics",
      lessDescription: 'Ergonomical for humans body curve.',
      price: 147,
      description: _dummyText,
      image: Resources.bag6,
      rating: 4.7,
      seller: 'Nick Savrinn',
      otherProductImages: _images(),
      listColor: _colors(),
    ),
  ];

  static String _dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

  static List<String> _images() => [
        Resources.bag1,
        Resources.bag2,
        Resources.bag3,
        Resources.bag4,
        Resources.bag5,
        Resources.bag6,
      ];

  static List<Color> _colors() => [
        AppTheme.deepBlue,
        AppTheme.deepOrange,
        AppTheme.grey,
      ];
}
