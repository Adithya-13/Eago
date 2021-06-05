import 'constants.dart';

class OnBoard {
  final String title;
  final String illustration;
  final String description;

  OnBoard(
      {required this.title,
        required this.illustration,
        required this.description});
}

class StaticData {
  static List<OnBoard> getOnBoardingList() => [
    OnBoard(
        title: 'Lorem ipsum',
        illustration: Resources.onBoard1,
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi diam mauris, vulputate eu elit malesuada, tincidunt fermentum purus.'),
    OnBoard(
        title: 'Dolor sit amet',
        illustration: Resources.onBoard2,
        description:
        'Donec sed velit faucibus, ornare nulla id, luctus sapien. Pellentesque molestie pulvinar eros ultrices egestas. Fusce bibendum aliquet lectus quis congue.'),
    OnBoard(
        title: 'Complete Your Tasks',
        illustration: Resources.onBoard3,
        description:
        'Aliquam commodo mattis massa id tristique. Sed euismod quam enim, vulputate placerat mauris ornare nec.'),
    OnBoard(
        title: 'Consectetur adipiscing elit',
        illustration: Resources.onBoard4,
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi diam mauris, vulputate eu elit malesuada, tincidunt fermentum purus.'),
    OnBoard(
        title: 'Morbi diam mauris',
        illustration: Resources.onBoard5,
        description:
        'Donec sed velit faucibus, ornare nulla id, luctus sapien. Pellentesque molestie pulvinar eros ultrices egestas. Fusce bibendum aliquet lectus quis congue.'),
    OnBoard(
        title: 'Vulputate eu elit malesuada',
        illustration: Resources.onBoard6,
        description:
        'Aliquam commodo mattis massa id tristique. Sed euismod quam enim, vulputate placerat mauris ornare nec.'),
  ];
}
