import 'package:dio/dio.dart';
import 'package:ecomerce_web/App/constant.dart';
import 'package:ecomerce_web/Data/responses/response.dart';
import 'package:flutter/animation.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class appServiceClient {
  factory appServiceClient(Dio dio, {String baseUrl}) = _appServiceClient;
  @POST("/category.json")
  Future<AddCatResponse> addCat(
    @Field("cat_name") String name,
    @Field("cat_des") String des,
    @Field("cat_image_url") String url,
    @Field("cat_parameter") int parameter,
  );
  @GET("/category/.json")
  Future<Map<String, CatResponse?>?> AllCat();
  @PATCH("/category/{id}.json")
  Future<CatUpdateResponse> updateCat(
    @Path("id") String id,
    @Field("cat_name") String name,
    @Field("cat_des") String des,
    @Field("cat_image_url") String url,
    @Field("cat_parameter") int parameter,
  );
  @DELETE("/category/{id}.json")
  Future<void> DeleteCat(
    @Path("id") String id,
  );
  @DELETE("/subcategory/{id}.json")
  Future<void> DeleteCatSub(
    @Path("id") String id,
  );
  @DELETE("/product/{id}.json")
  Future<void> DeleteCatPro(
    @Path("id") String id,
  );
  @POST("/subcategory/{id}.json")
  Future<AddSubCatResponse> addSubCat(
    @Path("id") String id,
    @Field("Subcat_name") String name,
    @Field("Subcat_des") String des,
    @Field("Subcat_image_url") String url,
    @Field("Subcat_parameter") int parameter,
  );
  @GET("/subcategory/{id}.json")
  Future<Map<String, SubCatResponse?>?> AllSubCat(
    @Path("id") String id,
  );
  @PATCH("/subcategory/{CatId}/{SubCatId}.json")
  Future<CatUpdateResponse> updateSubCat(
    @Path("CatId") String catId,
    @Path("SubCatId") String subCatId,
    @Field("Subcat_name") String name,
    @Field("Subcat_des") String des,
    @Field("Subcat_image_url") String url,
    @Field("Subcat_parameter") int parameter,
  );
  @DELETE("/subcategory/{CatId}/{SubCatId}.json")
  Future<void> DeleteSubCat(
    @Path("CatId") String catId,
    @Path("SubCatId") String subCatId,
  );
  @DELETE("/product/{CatId}/{SubCatId}.json")
  Future<void> DeleteSubCatPro(
    @Path("CatId") String catId,
    @Path("SubCatId") String subCatId,
  );
  @POST("/subcategory/{CatId}/{SubCatId}/Further_subcategory.json")
  Future<AddSubCatResponse> addFurtherSubCat(
    @Path("CatId") String id,
    @Path("SubCatId") String subId,
    @Field("Further_Subcat_name") String name,
    @Field("Further_Subcat_des") String des,
    @Field("Further_Subcat_image_url") String url,
    @Field("Further_Subcat_parameter") int parameter,
  );
  @PATCH(
      "/subcategory/{CatId}/{SubCatId}/Further_subcategory/{FurtherSubCatId}.json")
  Future<CatUpdateResponse> updateFurtherSubCat(
    @Path("CatId") String catId,
    @Path("SubCatId") String subCatId,
    @Path("FurtherSubCatId") String furtherSubCatId,
    @Field("Further_Subcat_name") String name,
    @Field("Further_Subcat_des") String des,
    @Field("Further_Subcat_image_url") String url,
    @Field("Further_Subcat_parameter") int parameter,
  );
  @DELETE(
      "/subcategory/{CatId}/{SubCatId}/Further_subcategory/{FurtherSubCatId}.json")
  Future<void> DeleteFurtherSubCat(
    @Path("CatId") String catId,
    @Path("SubCatId") String subCatId,
    @Path("FurtherSubCatId") String furtherSubCatId,
  );

  @DELETE("/product/{CatId}/{SubCatId}/{FurtherSubCatId}.json")
  Future<void> DeleteFurtherSubCatPro(
    @Path("CatId") String catId,
    @Path("SubCatId") String subCatId,
    @Path("FurtherSubCatId") String furtherSubCatId,
  );
  @POST("/product/{catId}/{subCatId}.json")
  Future<AddCatProductResponse> addSubCatProduct(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
    @Field("s_pro_name") String name,
    @Field("s_pro_des") String des,
    @Field("s_pro_image_url") String url,
    @Field("s_pro_color") String color,
    @Field("s_pro_size") String size,
    @Field("s_pro_limit") String limit,
    @Field("s_pro_price") String price,
  );
  @POST("/product/{catId}/{subCatId}/{furtherSubCatId}.json")
  Future<AddCatProductResponse> addFurtherSubCatProduct(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
    @Path("furtherSubCatId") String furtherSubCatId,
    @Field("fsc_pro_name") String name,
    @Field("fsc_pro_des") String des,
    @Field("fsc_pro_image_url") String url,
    @Field("fsc_pro_color") String color,
    @Field("fsc_pro_size") String size,
    @Field("fsc_pro_limit") String limit,
    @Field("fsc_pro_price") String price,
  );
  @POST("/product/{catId}.json")
  Future<AddCatProductResponse> addCatProduct(
    @Path("catId") String catId,
    @Field("pro_name") String name,
    @Field("pro_des") String des,
    @Field("pro_image_url") String url,
    @Field("pro_color") String color,
    @Field("pro_size") String size,
    @Field("pro_limit") String limit,
    @Field("pro_price") String price,
  );

  @GET("/product/{catId}/{subCatId}.json")
  Future<Map<String, SubCatProductsResponse?>?> AllSubCatProducts(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
  );
  @GET("/product/{catId}/{subCatId}/{furtherSubCatId}.json")
  Future<Map<String, FurtherSubCatProductsResponse?>?> AllFurtherSubCatProducts(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
    @Path("furtherSubCatId") String furtherSubCatId,
  );
  @GET("/product/{catId}.json")
  Future<Map<String, CatProductsResponse?>?> AllCatProducts(
    @Path("catId") String catId,
  );
  @PATCH("/product/{catId}/{subCatId}/{subCatProId}.json")
  Future<UpdateSubCatProductResponse> updateSubCatProduct(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
    @Path("subCatProId") String proId,
    @Field("s_pro_name") String name,
    @Field("s_pro_des") String des,
    @Field("s_pro_image_url") String url,
    @Field("s_pro_color") String color,
    @Field("s_pro_size") String size,
    @Field("s_pro_limit") String limit,
    @Field("s_pro_price") String price,
  );

  @PATCH(
      "/product/{catId}/{subCatId}/{furtherSubCatId}/{furtherSubCatProId}.json")
  Future<UpdateFurtherSubCatProductsResponse> updatefurtherSubCatProduct(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
    @Path("furtherSubCatId") String furtherSubCatId,
    @Path("furtherSubCatProId") String furtherSubCatproId,
    @Field("fsc_pro_name") String name,
    @Field("fsc_pro_des") String des,
    @Field("fsc_pro_image_url") String url,
    @Field("fsc_pro_color") String color,
    @Field("fsc_pro_size") String size,
    @Field("fsc_pro_limit") String limit,
    @Field("fsc_pro_price") String price,
  );
  @PATCH("/product/{catId}/{CatProId}.json")
  Future<UpdateCatProductResponse> updateCatProduct(
    @Path("catId") String catId,
    @Path("CatProId") String proId,
    @Field("pro_name") String name,
    @Field("pro_des") String des,
    @Field("pro_image_url") String url,
    @Field("pro_color") String color,
    @Field("pro_size") String size,
    @Field("pro_limit") String limit,
    @Field("pro_price") String price,
  );

  @DELETE("/product/{catId}/{subCatId}/{subCatProId}.json")
  Future<void> deleteSubCatProduct(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
    @Path("subCatProId") String proId,
  );
  @DELETE(
      "/product/{catId}/{subCatId}/{furtherSubCatId}/{furtherSubCatProId}.json")
  Future<void> deleteFurtherSubCatProduct(
    @Path("catId") String catId,
    @Path("subCatId") String subCatId,
    @Path("furtherSubCatId") String furtherSubCatId,
    @Path("furtherSubCatProId") String furtherSubCatproId,
  );
  @DELETE("/product/{catId}/{CatProId}.json")
  Future<void> deleteCatProduct(
    @Path("catId") String catId,
    @Path("CatProId") String proId,
  );
}
