import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/data/models/models.dart';

extension Mapper on List<Product> {
  ProductEntity get toProductEntity {
    return ProductEntity(
        productList: this.map((item) => ProductItemEntity(
          id: item.id,
          title: item.title,
          description: item.description,
          price: item.price,
          size: item.size,
          image: item.image,
          color: item.color,
        )).toList());
  }
}
