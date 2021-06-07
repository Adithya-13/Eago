import 'package:eago_app/data/data_providers/locals/dummy_data.dart';
import 'package:eago_app/data/entities/entities.dart';
import 'package:eago_app/data/utils/data_mapper.dart';

class ProductRepository {
  Future<ProductEntity> getProductList() async {
    await Future.delayed(Duration(milliseconds: 1500));
    final productList = DummyData.products;
    return productList.toProductEntity;
  }
}

