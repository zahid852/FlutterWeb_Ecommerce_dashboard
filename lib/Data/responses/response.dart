import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class AddCatResponse {
  @JsonKey(name: "name")
  String? id;
  AddCatResponse(this.id);

  factory AddCatResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddCatResponseToJson(this);
}

@JsonSerializable()
class CatResponse {
  @JsonKey(name: "cat_name")
  String? names;
  @JsonKey(name: "cat_des")
  String? des;
  @JsonKey(name: "cat_image_url")
  String? imageUrl;
  @JsonKey(name: "cat_parameter")
  int? parameter;
  CatResponse(this.names, this.des, this.imageUrl, this.parameter);

  factory CatResponse.fromJson(Map<String, dynamic> json) =>
      _$CatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatResponseToJson(this);
}

@JsonSerializable()
class CatUpdateResponse {
  @JsonKey(name: "cat_name")
  String? name;
  @JsonKey(name: "cat_des")
  String? des;
  @JsonKey(name: "cat_image_url")
  String? imageUrl;
  @JsonKey(name: "cat_parameter")
  int? parameter;
  CatUpdateResponse(this.name, this.des, this.imageUrl, this.parameter);

  factory CatUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$CatUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatUpdateResponseToJson(this);
}

@JsonSerializable()
class AddSubCatResponse {
  @JsonKey(name: "name")
  String? id;
  AddSubCatResponse(this.id);

  factory AddSubCatResponse.fromJson(Map<String, dynamic> json) =>
      _$AddSubCatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddSubCatResponseToJson(this);
}

@JsonSerializable()
class SubCatResponse {
  @JsonKey(name: "Subcat_name")
  String? name;
  @JsonKey(name: "Subcat_des")
  String? des;
  @JsonKey(name: "Subcat_image_url")
  String? imageUrl;
  @JsonKey(name: "Subcat_parameter")
  int? parameter;
  @JsonKey(name: "Further_subcategory")
  Map<String, FurtherSubCatResponse?>? furtherSubCatResponse;
  SubCatResponse(this.name, this.des, this.imageUrl, this.parameter,
      this.furtherSubCatResponse);

  factory SubCatResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubCatResponseToJson(this);
}

@JsonSerializable()
class FurtherSubCatResponse {
  @JsonKey(name: "Further_Subcat_name")
  String? further_name;
  @JsonKey(name: "Further_Subcat_des")
  String? further_des;
  @JsonKey(name: "Further_Subcat_image_url")
  String? further_imageUrl;
  @JsonKey(name: "Further_Subcat_parameter")
  int? further_parameter;
  FurtherSubCatResponse(this.further_name, this.further_des,
      this.further_imageUrl, this.further_parameter);

  factory FurtherSubCatResponse.fromJson(Map<String, dynamic> json) =>
      _$FurtherSubCatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FurtherSubCatResponseToJson(this);
}

@JsonSerializable()
class SubCatUpdateResponse {
  @JsonKey(name: "Subcat_name")
  String? name;
  @JsonKey(name: "Subcat_des")
  String? des;
  @JsonKey(name: "Subcat_image_url")
  String? imageUrl;
  @JsonKey(name: "Subcat_parameter")
  int? parameter;
  SubCatUpdateResponse(this.name, this.des, this.imageUrl, this.parameter);

  factory SubCatUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCatUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubCatUpdateResponseToJson(this);
}
// @JsonSerializable()
// class AllCatResponse {
//   List<CatResponse>? catResponse;
//   AllCatResponse(this.catResponse);

//   factory AllCatResponse.fromJson(Map<String, dynamic> json) =>
//       _$AllCatResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$AllCatResponseToJson(this);
// }
@JsonSerializable()
class AddCatProductResponse {
  @JsonKey(name: "name")
  String? id;
  AddCatProductResponse(this.id);

  factory AddCatProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCatProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddCatProductResponseToJson(this);
}

@JsonSerializable()
class SubCatProductsResponse {
  @JsonKey(name: "s_pro_name")
  String? names;
  @JsonKey(name: "s_pro_des")
  String? des;
  @JsonKey(name: "s_pro_image_url")
  String? imageUrl;
  @JsonKey(name: "s_pro_color")
  String? color;
  @JsonKey(name: "s_pro_size")
  String? size;
  @JsonKey(name: "s_pro_limit")
  String? limit;
  @JsonKey(name: "s_pro_price")
  String? price;
  SubCatProductsResponse(this.names, this.des, this.imageUrl, this.color,
      this.size, this.limit, this.price);

  factory SubCatProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCatProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubCatProductsResponseToJson(this);
}

@JsonSerializable()
class UpdateSubCatProductResponse {
  @JsonKey(name: "s_pro_name")
  String? names;
  @JsonKey(name: "s_pro_des")
  String? des;
  @JsonKey(name: "s_pro_image_url")
  String? imageUrl;
  @JsonKey(name: "s_pro_color")
  String? color;
  @JsonKey(name: "s_pro_size")
  String? size;
  @JsonKey(name: "s_pro_limit")
  String? limit;
  @JsonKey(name: "s_pro_price")
  String? price;
  UpdateSubCatProductResponse(this.names, this.des, this.imageUrl, this.color,
      this.size, this.limit, this.price);

  factory UpdateSubCatProductResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubCatProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSubCatProductResponseToJson(this);
}

@JsonSerializable()
class FurtherSubCatProductsResponse {
  @JsonKey(name: "fsc_pro_name")
  String? names;
  @JsonKey(name: "fsc_pro_des")
  String? des;
  @JsonKey(name: "fsc_pro_image_url")
  String? imageUrl;
  @JsonKey(name: "fsc_pro_color")
  String? color;
  @JsonKey(name: "fsc_pro_size")
  String? size;
  @JsonKey(name: "fsc_pro_limit")
  String? limit;
  @JsonKey(name: "fsc_pro_price")
  String? price;
  FurtherSubCatProductsResponse(this.names, this.des, this.imageUrl, this.color,
      this.size, this.limit, this.price);

  factory FurtherSubCatProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$FurtherSubCatProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FurtherSubCatProductsResponseToJson(this);
}

@JsonSerializable()
class UpdateFurtherSubCatProductsResponse {
  @JsonKey(name: "fsc_pro_name")
  String? names;
  @JsonKey(name: "fsc_pro_des")
  String? des;
  @JsonKey(name: "fsc_pro_image_url")
  String? imageUrl;
  @JsonKey(name: "fsc_pro_color")
  String? color;
  @JsonKey(name: "fsc_pro_size")
  String? size;
  @JsonKey(name: "fsc_pro_limit")
  String? limit;
  @JsonKey(name: "fsc_pro_price")
  String? price;
  UpdateFurtherSubCatProductsResponse(this.names, this.des, this.imageUrl,
      this.color, this.size, this.limit, this.price);

  factory UpdateFurtherSubCatProductsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateFurtherSubCatProductsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateFurtherSubCatProductsResponseToJson(this);
}

@JsonSerializable()
class UpdateCatProductResponse {
  @JsonKey(name: "pro_name")
  String? names;
  @JsonKey(name: "pro_des")
  String? des;
  @JsonKey(name: "pro_image_url")
  String? imageUrl;
  @JsonKey(name: "pro_color")
  String? color;
  @JsonKey(name: "pro_size")
  String? size;
  @JsonKey(name: "pro_limit")
  String? limit;
  @JsonKey(name: "pro_price")
  String? price;
  UpdateCatProductResponse(this.names, this.des, this.imageUrl, this.color,
      this.size, this.limit, this.price);

  factory UpdateCatProductResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCatProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCatProductResponseToJson(this);
}

@JsonSerializable()
class CatProductsResponse {
  @JsonKey(name: "pro_name")
  String? names;
  @JsonKey(name: "pro_des")
  String? des;
  @JsonKey(name: "pro_image_url")
  String? imageUrl;
  @JsonKey(name: "pro_color")
  String? color;
  @JsonKey(name: "pro_size")
  String? size;
  @JsonKey(name: "pro_limit")
  String? limit;
  @JsonKey(name: "pro_price")
  String? price;
  CatProductsResponse(this.names, this.des, this.imageUrl, this.color,
      this.size, this.limit, this.price);

  factory CatProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$CatProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatProductsResponseToJson(this);
}
