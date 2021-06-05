import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductEntity extends BaseEntity {
  final List<ProductItemEntity> productList;

  ProductEntity({required this.productList});
}

class ProductItemEntity extends BaseEntity {
  final int id;
  final String image;
  final String title;
  final String description;
  final int price;
  final int size;
  final Color color;

  ProductItemEntity({
    int? id,
    String? image,
    String? title,
    int? price,
    int? size,
    String? description,
    Color? color,
  })  : id = id ?? 0,
        image = image ?? Resources.bag1,
        title = title ?? '-',
        price = price ?? 0,
        size = size ?? 0,
        description = description ?? '-',
        color = color ?? Colors.white;
}