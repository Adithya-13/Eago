import 'package:eago_app/data/models/models.dart';
import 'package:eago_app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class DummyData {

  static List<Product> products = [
    Product(
        id: 1,
        title: "Office Code",
        price: 234,
        size: 12,
        description: _dummyText,
        image: Resources.bag1,
        color: Color(0xFF3D82AE)),
    Product(
        id: 2,
        title: "Belt Bag",
        price: 234,
        size: 8,
        description: _dummyText,
        image: Resources.bag2,
        color: Color(0xFFD3A984)),
    Product(
        id: 3,
        title: "Hang Top",
        price: 234,
        size: 10,
        description: _dummyText,
        image: Resources.bag3,
        color: Color(0xFF989493)),
    Product(
        id: 4,
        title: "Old Fashion",
        price: 234,
        size: 11,
        description: _dummyText,
        image: Resources.bag4,
        color: Color(0xFFE6B398)),
    Product(
        id: 5,
        title: "Office Code",
        price: 234,
        size: 12,
        description: _dummyText,
        image: Resources.bag5,
        color: Color(0xFFFB7883)),
    Product(
      id: 6,
      title: "Office Code",
      price: 234,
      size: 12,
      description: _dummyText,
      image: Resources.bag6,
      color: Color(0xFFAEAEAE),
    ),
  ];

  static String _dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

}