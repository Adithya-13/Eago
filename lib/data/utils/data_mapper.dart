import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/data/models/models.dart';

extension Mapper on List<Product> {
  ProductEntity get toProductEntity {
    return ProductEntity(
        productList: this.map((item) => ProductItemEntity(
          id: item.id,
          title: item.title,
          description: item.description,
          lessDescription: item.lessDescription,
          price: item.price,
          image: item.image,
          seller: item.seller,
          rating: item.rating,
          otherProductImages: item.otherProductImages,
        )).toList());
  }
}
