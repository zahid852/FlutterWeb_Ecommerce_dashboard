import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/app_api.dart';
import 'package:ecomerce_web/Data/responses/response.dart';
import 'package:ecomerce_web/Presentation/Category/components/add_cat.dart';

abstract class RemoteDataSource {
  Future<AddCatResponse> addCat(CatAddRequest catAddRequest);
  Future<Map<String, CatResponse?>?> allCat();
  Future<CatUpdateResponse> updateCat(CatUpdateRequest catUpdateRequest);
  Future<void> DeleteCat(CatDeleteRequest catDeleteRequest);
  Future<void> DeleteCatSub(CatDeleteRequest catDeleteRequest);

  Future<AddSubCatResponse> addSubCat(SubCatAddRequest SubcatAddRequest);
  Future<Map<String, SubCatResponse?>?> allSubCat(CatIdRequest catIdRequest);
  Future<CatUpdateResponse> updateSubCat(
      SubCatUpdateRequest subcatUpdateRequest);
  Future<void> DeleteSubCat(SubCatDeleteRequest subcatDeleteRequest);

  Future<AddSubCatResponse> addFurtherSubCat(
      FurtherSubCatAddRequest furtherSubCatAddRequest);
  Future<CatUpdateResponse> updateFurtherSubCat(
      FurtherSubCatUpdateRequest furthersubcatUpdateRequest);
  Future<void> DeleteFurtherSubCat(
      FurtherSubCatDeleteRequest furthersubcatDeleteRequest);

  Future<AddCatProductResponse> AddSubCatProduct(
      AddSubCatProductRequest addSubCatProductRequest);
  Future<AddCatProductResponse> AddFurtherSubCatProduct(
      AddFurtherSubCatProductRequest addFurtherSubCatProductRequest);
  Future<AddCatProductResponse> AddCatProduct(
      AddCatProductRequest addCatProductRequest);

  Future<Map<String, SubCatProductsResponse?>?> allSubCatProudcts(
      SubCatProductRequest subCatProductRequest);
  Future<Map<String, FurtherSubCatProductsResponse?>?> allFurtherSubCatProudcts(
      FurtherSubCatProductRequest subCatProductRequest);
  Future<Map<String, CatProductsResponse?>?> allCatProudcts(
      CatProductRequest catProductRequest);

  Future<UpdateSubCatProductResponse> UpdateSubCatProduct(
      UpdateSubCatProductRequest updateSubCatProductRequest);
  Future<UpdateFurtherSubCatProductsResponse> UpdateFurtherSubCatProduct(
      UpdateFurtherSubCatProductRequest updateSubCatProductRequest);
  Future<UpdateCatProductResponse> UpdateCatProduct(
      UpdateCatProductRequest updateCatProductRequest);

  Future<void> DeleteSubCatProduct(
      DeleteSubCatProductRequest deleteSubCatProductRequest);
  Future<void> DeleteFurtherSubCatProduct(
      DeleteFurtherSubCatProductRequest deleteFurtherSubCatProductRequest);
  Future<void> DeleteCatProduct(
      DeleteCatProductRequest deleteCatProductRequest);

  Future<void> DeleteCatPro(CatDeleteRequest catDeleteRequest);
  Future<void> DeleteSubCatPro(SubCatDeleteRequest subCatDeleteRequest);
  Future<void> DeleteFurtherSubCatPro(
      FurtherSubCatDeleteRequest furtherSubCatDeleteRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  appServiceClient _app_service_client;
  RemoteDataSourceImplementer(this._app_service_client);
  @override
  Future<AddCatResponse> addCat(CatAddRequest catAddRequest) {
    return _app_service_client.addCat(catAddRequest.name, catAddRequest.des,
        catAddRequest.url, catAddRequest.parameter);
  }

  @override
  Future<Map<String, CatResponse?>?> allCat() {
    return _app_service_client.AllCat();
  }

  @override
  Future<CatUpdateResponse> updateCat(CatUpdateRequest catUpdateRequest) {
    return _app_service_client.updateCat(
        catUpdateRequest.id,
        catUpdateRequest.name,
        catUpdateRequest.des,
        catUpdateRequest.url,
        catUpdateRequest.parameter);
  }

  @override
  Future<void> DeleteCat(CatDeleteRequest catDeleteRequest) {
    return _app_service_client.DeleteCat(catDeleteRequest.id);
  }

  @override
  Future<AddSubCatResponse> addSubCat(SubCatAddRequest SubcatAddRequest) {
    return _app_service_client.addSubCat(
        SubcatAddRequest.id,
        SubcatAddRequest.name,
        SubcatAddRequest.des,
        SubcatAddRequest.url,
        SubcatAddRequest.parameter);
  }

  @override
  Future<Map<String, SubCatResponse?>?> allSubCat(CatIdRequest catIdRequest) {
    return _app_service_client.AllSubCat(catIdRequest.id);
  }

  @override
  Future<CatUpdateResponse> updateSubCat(subcatUpdateRequest) {
    return _app_service_client.updateSubCat(
        subcatUpdateRequest.catId,
        subcatUpdateRequest.subCatId,
        subcatUpdateRequest.name,
        subcatUpdateRequest.des,
        subcatUpdateRequest.url,
        subcatUpdateRequest.parameter);
  }

  @override
  Future<void> DeleteSubCat(SubCatDeleteRequest subcatDeleteRequest) {
    return _app_service_client.DeleteSubCat(
        subcatDeleteRequest.CatId, subcatDeleteRequest.SubCatId);
  }

  @override
  Future<AddSubCatResponse> addFurtherSubCat(
      FurtherSubCatAddRequest furtherSubCatAddRequest) {
    return _app_service_client.addFurtherSubCat(
        furtherSubCatAddRequest.CatId,
        furtherSubCatAddRequest.SubCatId,
        furtherSubCatAddRequest.name,
        furtherSubCatAddRequest.des,
        furtherSubCatAddRequest.url,
        furtherSubCatAddRequest.parameter);
  }

  @override
  Future<CatUpdateResponse> updateFurtherSubCat(
      FurtherSubCatUpdateRequest furthersubcatUpdateRequest) {
    return _app_service_client.updateFurtherSubCat(
        furthersubcatUpdateRequest.catId,
        furthersubcatUpdateRequest.subCatId,
        furthersubcatUpdateRequest.furtherSubCatId,
        furthersubcatUpdateRequest.name,
        furthersubcatUpdateRequest.des,
        furthersubcatUpdateRequest.url,
        furthersubcatUpdateRequest.parameter);
  }

  @override
  Future<void> DeleteFurtherSubCat(
      FurtherSubCatDeleteRequest furthersubcatDeleteRequest) {
    return _app_service_client.DeleteFurtherSubCat(
        furthersubcatDeleteRequest.CatId,
        furthersubcatDeleteRequest.SubCatId,
        furthersubcatDeleteRequest.FurtherSubCatId);
  }

  @override
  Future<void> DeleteCatSub(CatDeleteRequest catDeleteRequest) {
    return _app_service_client.DeleteCatSub(catDeleteRequest.id);
  }

  @override
  Future<AddCatProductResponse> AddSubCatProduct(
      AddSubCatProductRequest addSubCatAddProductRequest) {
    return _app_service_client.addSubCatProduct(
        addSubCatAddProductRequest.catId,
        addSubCatAddProductRequest.subCatId,
        addSubCatAddProductRequest.name,
        addSubCatAddProductRequest.des,
        addSubCatAddProductRequest.url,
        addSubCatAddProductRequest.color,
        addSubCatAddProductRequest.size,
        addSubCatAddProductRequest.limit,
        addSubCatAddProductRequest.price);
  }

  @override
  Future<AddCatProductResponse> AddFurtherSubCatProduct(
      AddFurtherSubCatProductRequest addFurtherSubCatProductRequest) {
    return _app_service_client.addFurtherSubCatProduct(
        addFurtherSubCatProductRequest.catId,
        addFurtherSubCatProductRequest.subCatId,
        addFurtherSubCatProductRequest.furtherSubCatId,
        addFurtherSubCatProductRequest.name,
        addFurtherSubCatProductRequest.des,
        addFurtherSubCatProductRequest.url,
        addFurtherSubCatProductRequest.color,
        addFurtherSubCatProductRequest.size,
        addFurtherSubCatProductRequest.limit,
        addFurtherSubCatProductRequest.price);
  }

  @override
  Future<AddCatProductResponse> AddCatProduct(
      AddCatProductRequest addCatProductRequest) {
    return _app_service_client.addCatProduct(
        addCatProductRequest.catId,
        addCatProductRequest.name,
        addCatProductRequest.des,
        addCatProductRequest.url,
        addCatProductRequest.color,
        addCatProductRequest.size,
        addCatProductRequest.limit,
        addCatProductRequest.price);
  }

  @override
  Future<Map<String, SubCatProductsResponse?>?> allSubCatProudcts(
      SubCatProductRequest subCatProductRequest) {
    return _app_service_client.AllSubCatProducts(
        subCatProductRequest.catId, subCatProductRequest.subCatId);
  }

  @override
  Future<Map<String, FurtherSubCatProductsResponse?>?> allFurtherSubCatProudcts(
      FurtherSubCatProductRequest subCatProductRequest) {
    return _app_service_client.AllFurtherSubCatProducts(
        subCatProductRequest.catId,
        subCatProductRequest.subCatId,
        subCatProductRequest.furtherSubCatId);
  }

  @override
  Future<Map<String, CatProductsResponse?>?> allCatProudcts(
      CatProductRequest catProductRequest) {
    return _app_service_client.AllCatProducts(
      catProductRequest.catId,
    );
  }

  @override
  Future<UpdateSubCatProductResponse> UpdateSubCatProduct(
      UpdateSubCatProductRequest updateSubCatProductRequest) {
    return _app_service_client.updateSubCatProduct(
        updateSubCatProductRequest.catId,
        updateSubCatProductRequest.subCatId,
        updateSubCatProductRequest.subCatProId,
        updateSubCatProductRequest.name,
        updateSubCatProductRequest.des,
        updateSubCatProductRequest.url,
        updateSubCatProductRequest.color,
        updateSubCatProductRequest.size,
        updateSubCatProductRequest.limit,
        updateSubCatProductRequest.price);
  }

  @override
  Future<UpdateFurtherSubCatProductsResponse> UpdateFurtherSubCatProduct(
      UpdateFurtherSubCatProductRequest updatefSubCatProductRequest) {
    return _app_service_client.updatefurtherSubCatProduct(
        updatefSubCatProductRequest.catId,
        updatefSubCatProductRequest.subCatId,
        updatefSubCatProductRequest.furtherSubCatId,
        updatefSubCatProductRequest.furtherSubCatProId,
        updatefSubCatProductRequest.name,
        updatefSubCatProductRequest.des,
        updatefSubCatProductRequest.url,
        updatefSubCatProductRequest.color,
        updatefSubCatProductRequest.size,
        updatefSubCatProductRequest.limit,
        updatefSubCatProductRequest.price);
  }

  @override
  Future<UpdateCatProductResponse> UpdateCatProduct(
      UpdateCatProductRequest updateCatProductRequest) {
    return _app_service_client.updateCatProduct(
        updateCatProductRequest.catId,
        updateCatProductRequest.CatProId,
        updateCatProductRequest.name,
        updateCatProductRequest.des,
        updateCatProductRequest.url,
        updateCatProductRequest.color,
        updateCatProductRequest.size,
        updateCatProductRequest.limit,
        updateCatProductRequest.price);
  }

  @override
  Future<void> DeleteSubCatProduct(
      DeleteSubCatProductRequest deleteSubCatProductRequest) {
    return _app_service_client.deleteSubCatProduct(
      deleteSubCatProductRequest.catId,
      deleteSubCatProductRequest.subCatId,
      deleteSubCatProductRequest.subCatProId,
    );
  }

  @override
  Future<void> DeleteFurtherSubCatProduct(
      DeleteFurtherSubCatProductRequest deleteFurtherSubCatProductRequest) {
    return _app_service_client.deleteFurtherSubCatProduct(
        deleteFurtherSubCatProductRequest.catId,
        deleteFurtherSubCatProductRequest.subCatId,
        deleteFurtherSubCatProductRequest.FurtherSubCatId,
        deleteFurtherSubCatProductRequest.furtherSubCatProId);
  }

  @override
  Future<void> DeleteCatProduct(
      DeleteCatProductRequest deleteCatProductRequest) {
    return _app_service_client.deleteCatProduct(
      deleteCatProductRequest.catId,
      deleteCatProductRequest.CatProId,
    );
  }

  @override
  Future<void> DeleteCatPro(CatDeleteRequest catDeleteRequest) {
    return _app_service_client.DeleteCatPro(catDeleteRequest.id);
  }

  @override
  Future<void> DeleteFurtherSubCatPro(
      FurtherSubCatDeleteRequest furtherSubCatDeleteRequest) {
    return _app_service_client.DeleteFurtherSubCatPro(
        furtherSubCatDeleteRequest.CatId,
        furtherSubCatDeleteRequest.SubCatId,
        furtherSubCatDeleteRequest.FurtherSubCatId);
  }

  @override
  Future<void> DeleteSubCatPro(SubCatDeleteRequest subCatDeleteRequest) {
    return _app_service_client.DeleteSubCatPro(
        subCatDeleteRequest.CatId, subCatDeleteRequest.SubCatId);
  }
}
