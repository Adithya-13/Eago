import 'package:eago_app/data/data_providers/locals/dummy_data.dart';
import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/data/utils/data_mapper.dart';

class ProductRepository {
  Future<ProductEntity> getProductList() async {
    final productList = DummyData.products;
    return productList.toProductEntity;
  }
}

