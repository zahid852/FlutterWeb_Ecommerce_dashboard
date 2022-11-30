import 'package:ecomerce_web/App/extensions.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/responses/response.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';

import 'package:ecomerce_web/Presentation/Category/components/add_cat.dart';

const Empty = '';
const Zero = 0;
const List<Category> CATEGORY_LIST = [];

extension AddCatResponseMapper on AddCatResponse? {
  AddCategory toDomain() {
    return AddCategory(this?.id.orEmpty() ?? Empty);
  }
}

extension CatResponseMapper on CatResponse? {
  Category toDomain(String id) {
    return Category(
        id,
        this?.names.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.parameter.orZero() ?? Zero);
  }
}

extension CatUpdateResponseMapper on CatUpdateResponse? {
  CategoryWithoutId toDomain() {
    return CategoryWithoutId(
        this?.name.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.parameter ?? Zero);
  }
}

extension AddSubCatResponseMapper on AddSubCatResponse? {
  AddSubCategory toDomain() {
    return AddSubCategory(this?.id.orEmpty() ?? Empty);
  }
}

extension SubCatResponseMapper on SubCatResponse? {
  SubCategory toDomain(String subCatId) {
    return SubCategory(
        subCatId,
        this?.name.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.parameter.orZero() ?? Zero,
        this
                ?.furtherSubCatResponse
                ?.entries
                .map((further_Sub_Cat_Response) => further_Sub_Cat_Response
                    .value
                    .toDomain(further_Sub_Cat_Response.key))
                .toList() ??
            []);
  }
}

extension FurtherSubCatResponseMapper on FurtherSubCatResponse? {
  Category toDomain(String id) {
    return Category(
      id,
      this?.further_name.orEmpty() ?? Empty,
      this?.further_des.orEmpty() ?? Empty,
      this?.further_imageUrl.orEmpty() ?? Empty,
      this?.further_parameter.orZero() ?? Zero,
    );
  }
}

extension AddSubCatProductResponseMapper on AddCatProductResponse? {
  AddProduct toDomain() {
    return AddProduct(this?.id.orEmpty() ?? Empty);
  }
}

extension SubCatProductsResponseMapper on SubCatProductsResponse? {
  Product toDomain(String id) {
    return Product(
        id,
        this?.names.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.color.orEmpty() ?? Empty,
        this?.size.orEmpty() ?? Empty,
        this?.limit.orEmpty() ?? Empty,
        this?.price.orEmpty() ?? Empty);
  }
}

extension UpdateSubCatProductResponseMapper on UpdateSubCatProductResponse? {
  ProductWithoutId toDomain() {
    return ProductWithoutId(
        this?.names.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.color.orEmpty() ?? Empty,
        this?.size.orEmpty() ?? Empty,
        this?.limit.orEmpty() ?? Empty,
        this?.price.orEmpty() ?? Empty);
  }
}

extension UpdateCatProductResponseMapper on UpdateCatProductResponse? {
  ProductWithoutId toDomain() {
    return ProductWithoutId(
        this?.names.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.color.orEmpty() ?? Empty,
        this?.size.orEmpty() ?? Empty,
        this?.limit.orEmpty() ?? Empty,
        this?.price.orEmpty() ?? Empty);
  }
}

extension UpdateFurtherSubCatProductResponseMapper
    on UpdateFurtherSubCatProductsResponse? {
  ProductWithoutId toDomain() {
    return ProductWithoutId(
        this?.names.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.color.orEmpty() ?? Empty,
        this?.size.orEmpty() ?? Empty,
        this?.limit.orEmpty() ?? Empty,
        this?.price.orEmpty() ?? Empty);
  }
}

extension FurtherSubCatProductsResponseMapper
    on FurtherSubCatProductsResponse? {
  Product toDomain(String id) {
    return Product(
        id,
        this?.names.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.color.orEmpty() ?? Empty,
        this?.size.orEmpty() ?? Empty,
        this?.limit.orEmpty() ?? Empty,
        this?.price.orEmpty() ?? Empty);
  }
}

extension CatProductsResponseMapper on CatProductsResponse? {
  Product toDomain(String id) {
    return Product(
        id,
        this?.names.orEmpty() ?? Empty,
        this?.des.orEmpty() ?? Empty,
        this?.imageUrl.orEmpty() ?? Empty,
        this?.color.orEmpty() ?? Empty,
        this?.size.orEmpty() ?? Empty,
        this?.limit.orEmpty() ?? Empty,
        this?.price.orEmpty() ?? Empty);
  }
}
