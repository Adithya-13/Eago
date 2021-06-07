import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductEntity extends BaseEntity {
  final List<ProductItemEntity> productList;

  ProductEntity({required this.productList});
}

class ProductItemEntity extends BaseEntity {
  final int id;
  final String title;
  final String seller;
  final String image;
  final String lessDescription;
  final String description;
  final int price;
  final double rating;
  final List<String> otherProductImages;
  final List<Color> listColor;

  ProductItemEntity({
    int? id,
    String? image,
    String? title,
    int? price,
    String? description,
    String? seller,
    String? lessDescription,
    double? rating,
    List<String>? otherProductImages,
    List<Color>? listColor,
  })  : id = id ?? 0,
        image = image ?? Resources.bag1,
        title = title ?? '-',
        price = price ?? 0,
        description = description ?? '-',
        seller = seller ?? '-',
        lessDescription = lessDescription ?? '-',
        rating = rating ?? 0.0,
        otherProductImages = otherProductImages ?? [],
        listColor = listColor ?? [];
}