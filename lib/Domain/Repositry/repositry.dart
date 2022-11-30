import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';

abstract class repositry {
  Future<Either<Failure, AddCategory>> addCatRepositry(
      CatAddRequest catAddRequest);
  Future<Either<Failure, List<Category>>> allCatRepositry();
  Future<Either<Failure, CategoryWithoutId>> updateCatRepositry(
      CatUpdateRequest catUpdateRequest);
  Future<Either<Failure, void>> deleteCatRepositry(
      CatDeleteRequest catDeleteRequest);
  Future<Either<Failure, void>> deleteCatSubRepositry(
      CatDeleteRequest catDeleteRequest);

  Future<Either<Failure, AddSubCategory>> addSubCatRepositry(
      SubCatAddRequest subcatAddRequest);
  Future<Either<Failure, List<SubCategory>>> allSubCatRepositry(
      CatIdRequest catIdRequest);
  Future<Either<Failure, CategoryWithoutId>> updateSubCatRepositry(
      SubCatUpdateRequest subCatUpdateRequest);
  Future<Either<Failure, void>> deleteSubCatRepositry(
      SubCatDeleteRequest subcatDeleteRequest);

  Future<Either<Failure, AddSubCategory>> addFurtherSubCatRepositry(
      FurtherSubCatAddRequest furtherSubCatAddRequest);
  Future<Either<Failure, CategoryWithoutId>> updateFurtherSubCatRepositry(
      FurtherSubCatUpdateRequest furthersubCatUpdateRequest);
  Future<Either<Failure, void>> deleteFurtherSubCatRepositry(
      FurtherSubCatDeleteRequest furthersubcatDeleteRequest);

  Future<Either<Failure, AddProduct>> addSubCatProductRepositry(
      AddSubCatProductRequest addSubCatAddProductRequest);
  Future<Either<Failure, AddProduct>> addFurtherSubCatProductRepositry(
      AddFurtherSubCatProductRequest addFurtherSubCatProductRequest);
  Future<Either<Failure, AddProduct>> addCatProductRepositry(
      AddCatProductRequest addCatProductRequest);
  Future<Either<Failure, List<Product>>> allSubCatProductRepositry(
      SubCatProductRequest subCatProductRequest);
  Future<Either<Failure, List<Product>>> allFurtherSubCatProductRepositry(
      FurtherSubCatProductRequest furtherSubCatProductRequest);
  Future<Either<Failure, List<Product>>> allCatProductRepositry(
      CatProductRequest catProductRequest);
  Future<Either<Failure, ProductWithoutId>> updateSubCatProductRepositry(
      UpdateSubCatProductRequest updateSubCatProductRequest);
  Future<Either<Failure, ProductWithoutId>> updateFurtherSubCatProductRepositry(
      UpdateFurtherSubCatProductRequest updateFurtherSubCatProductRequest);
  Future<Either<Failure, ProductWithoutId>> updateCatProductRepositry(
      UpdateCatProductRequest updateCatProductRequest);
  Future<Either<Failure, void>> deleteSubCatProductRepositry(
      DeleteSubCatProductRequest deleteSubCatProductRequest);
  Future<Either<Failure, void>> deleteFurtherSubCatProductRepositry(
      DeleteFurtherSubCatProductRequest deleteFurtherSubCatProductRequest);
  Future<Either<Failure, void>> deleteCatProductRepositry(
      DeleteCatProductRequest deleteCatProductRequest);

  Future<Either<Failure, void>> deleteCatProRepositry(
      CatDeleteRequest catDeleteRequest);
  Future<Either<Failure, void>> deleteSubCatProRepositry(
      SubCatDeleteRequest subCatDeleteRequest);
  Future<Either<Failure, void>> deleteFurtherSubCatProRepositry(
      FurtherSubCatDeleteRequest furtherSubCatDeleteRequest);
}
