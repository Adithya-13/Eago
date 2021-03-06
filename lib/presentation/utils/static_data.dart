import 'constants.dart';

class OnBoard {
  final int id;
  final String title;
  final String illustration;
  final String description;

  OnBoard({
    required this.id,
    required this.title,
    required this.illustration,
    required this.description,
  });
}

class StaticData {
  static List<OnBoard> getOnBoardingList() => [
        OnBoard(
            id: 0,
            title: 'Easy to Buy',
            illustration: Resources.onBoard1,
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi diam mauris, vulputate eu elit malesuada, tincidunt fermentum purus.'),
        OnBoard(
            id: 1,
            title: 'Just one Click',
            illustration: Resources.onBoard2,
            description:
                'Donec sed velit faucibus, ornare nulla id, luctus sapien. Pellentesque molestie pulvinar eros ultrices egestas. Fusce bibendum aliquet lectus quis congue.'),
        OnBoard(
            id: 2,
            title: 'Best Quality',
            illustration: Resources.onBoard3,
            description:
                'Aliquam commodo mattis massa id tristique. Sed euismod quam enim, vulputate placerat mauris ornare nec.'),
        OnBoard(
            id: 3,
            title: 'Lot of Variants',
            illustration: Resources.onBoard4,
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi diam mauris, vulputate eu elit malesuada, tincidunt fermentum purus.'),
        OnBoard(
            id: 4,
            title: 'Beautiful Design',
            illustration: Resources.onBoard5,
            description:
                'Donec sed velit faucibus, ornare nulla id, luctus sapien. Pellentesque molestie pulvinar eros ultrices egestas. Fusce bibendum aliquet lectus quis congue.'),
        OnBoard(
            id: 5,
            title: 'Welcome to Eago!',
            illustration: Resources.onBoard6,
            description:
                'Aliquam commodo mattis massa id tristique. Sed euismod quam enim, vulputate placerat mauris ornare nec.'),
      ];

  static List<String> getCategoryList() => [
        "Hand bag",
        "Jewellery",
        "Footwear",
        "Dresses",
      ];
}
