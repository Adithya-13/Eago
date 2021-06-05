import 'package:flutter/material.dart';

class Product {
  final int id;
  final String image;
  final String title;
  final String description;
  final int price;
  final int size;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.size,
    required this.description,
    required this.color,
  });
}
