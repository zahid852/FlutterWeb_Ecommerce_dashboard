// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCatResponse _$AddCatResponseFromJson(Map<String, dynamic> json) =>
    AddCatResponse(
      json['name'] as String?,
    );

Map<String, dynamic> _$AddCatResponseToJson(AddCatResponse instance) =>
    <String, dynamic>{
      'name': instance.id,
    };

CatResponse _$CatResponseFromJson(Map<String, dynamic> json) => CatResponse(
      json['cat_name'] as String?,
      json['cat_des'] as String?,
      json['cat_image_url'] as String?,
      json['cat_parameter'] as int?,
    );

Map<String, dynamic> _$CatResponseToJson(CatResponse instance) =>
    <String, dynamic>{
      'cat_name': instance.names,
      'cat_des': instance.des,
      'cat_image_url': instance.imageUrl,
      'cat_parameter': instance.parameter,
    };

CatUpdateResponse _$CatUpdateResponseFromJson(Map<String, dynamic> json) =>
    CatUpdateResponse(
      json['cat_name'] as String?,
      json['cat_des'] as String?,
      json['cat_image_url'] as String?,
      json['cat_parameter'] as int?,
    );

Map<String, dynamic> _$CatUpdateResponseToJson(CatUpdateResponse instance) =>
    <String, dynamic>{
      'cat_name': instance.name,
      'cat_des': instance.des,
      'cat_image_url': instance.imageUrl,
      'cat_parameter': instance.parameter,
    };

AddSubCatResponse _$AddSubCatResponseFromJson(Map<String, dynamic> json) =>
    AddSubCatResponse(
      json['name'] as String?,
    );

Map<String, dynamic> _$AddSubCatResponseToJson(AddSubCatResponse instance) =>
    <String, dynamic>{
      'name': instance.id,
    };

SubCatResponse _$SubCatResponseFromJson(Map<String, dynamic> json) =>
    SubCatResponse(
      json['Subcat_name'] as String?,
      json['Subcat_des'] as String?,
      json['Subcat_image_url'] as String?,
      json['Subcat_parameter'] as int?,
      (json['Further_subcategory'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : FurtherSubCatResponse.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$SubCatResponseToJson(SubCatResponse instance) =>
    <String, dynamic>{
      'Subcat_name': instance.name,
      'Subcat_des': instance.des,
      'Subcat_image_url': instance.imageUrl,
      'Subcat_parameter': instance.parameter,
      'Further_subcategory': instance.furtherSubCatResponse,
    };

FurtherSubCatResponse _$FurtherSubCatResponseFromJson(
        Map<String, dynamic> json) =>
    FurtherSubCatResponse(
      json['Further_Subcat_name'] as String?,
      json['Further_Subcat_des'] as String?,
      json['Further_Subcat_image_url'] as String?,
      json['Further_Subcat_parameter'] as int?,
    );

Map<String, dynamic> _$FurtherSubCatResponseToJson(
        FurtherSubCatResponse instance) =>
    <String, dynamic>{
      'Further_Subcat_name': instance.further_name,
      'Further_Subcat_des': instance.further_des,
      'Further_Subcat_image_url': instance.further_imageUrl,
      'Further_Subcat_parameter': instance.further_parameter,
    };

SubCatUpdateResponse _$SubCatUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    SubCatUpdateResponse(
      json['Subcat_name'] as String?,
      json['Subcat_des'] as String?,
      json['Subcat_image_url'] as String?,
      json['Subcat_parameter'] as int?,
    );

Map<String, dynamic> _$SubCatUpdateResponseToJson(
        SubCatUpdateResponse instance) =>
    <String, dynamic>{
      'Subcat_name': instance.name,
      'Subcat_des': instance.des,
      'Subcat_image_url': instance.imageUrl,
      'Subcat_parameter': instance.parameter,
    };

AddCatProductResponse _$AddCatProductResponseFromJson(
        Map<String, dynamic> json) =>
    AddCatProductResponse(
      json['name'] as String?,
    );

Map<String, dynamic> _$AddCatProductResponseToJson(
        AddCatProductResponse instance) =>
    <String, dynamic>{
      'name': instance.id,
    };

SubCatProductsResponse _$SubCatProductsResponseFromJson(
        Map<String, dynamic> json) =>
    SubCatProductsResponse(
      json['s_pro_name'] as String?,
      json['s_pro_des'] as String?,
      json['s_pro_image_url'] as String?,
      json['s_pro_color'] as String?,
      json['s_pro_size'] as String?,
      json['s_pro_limit'] as String?,
      json['s_pro_price'] as String?,
    );

Map<String, dynamic> _$SubCatProductsResponseToJson(
        SubCatProductsResponse instance) =>
    <String, dynamic>{
      's_pro_name': instance.names,
      's_pro_des': instance.des,
      's_pro_image_url': instance.imageUrl,
      's_pro_color': instance.color,
      's_pro_size': instance.size,
      's_pro_limit': instance.limit,
      's_pro_price': instance.price,
    };

UpdateSubCatProductResponse _$UpdateSubCatProductResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateSubCatProductResponse(
      json['s_pro_name'] as String?,
      json['s_pro_des'] as String?,
      json['s_pro_image_url'] as String?,
      json['s_pro_color'] as String?,
      json['s_pro_size'] as String?,
      json['s_pro_limit'] as String?,
      json['s_pro_price'] as String?,
    );

Map<String, dynamic> _$UpdateSubCatProductResponseToJson(
        UpdateSubCatProductResponse instance) =>
    <String, dynamic>{
      's_pro_name': instance.names,
      's_pro_des': instance.des,
      's_pro_image_url': instance.imageUrl,
      's_pro_color': instance.color,
      's_pro_size': instance.size,
      's_pro_limit': instance.limit,
      's_pro_price': instance.price,
    };

FurtherSubCatProductsResponse _$FurtherSubCatProductsResponseFromJson(
        Map<String, dynamic> json) =>
    FurtherSubCatProductsResponse(
      json['fsc_pro_name'] as String?,
      json['fsc_pro_des'] as String?,
      json['fsc_pro_image_url'] as String?,
      json['fsc_pro_color'] as String?,
      json['fsc_pro_size'] as String?,
      json['fsc_pro_limit'] as String?,
      json['fsc_pro_price'] as String?,
    );

Map<String, dynamic> _$FurtherSubCatProductsResponseToJson(
        FurtherSubCatProductsResponse instance) =>
    <String, dynamic>{
      'fsc_pro_name': instance.names,
      'fsc_pro_des': instance.des,
      'fsc_pro_image_url': instance.imageUrl,
      'fsc_pro_color': instance.color,
      'fsc_pro_size': instance.size,
      'fsc_pro_limit': instance.limit,
      'fsc_pro_price': instance.price,
    };

UpdateFurtherSubCatProductsResponse
    _$UpdateFurtherSubCatProductsResponseFromJson(Map<String, dynamic> json) =>
        UpdateFurtherSubCatProductsResponse(
          json['fsc_pro_name'] as String?,
          json['fsc_pro_des'] as String?,
          json['fsc_pro_image_url'] as String?,
          json['fsc_pro_color'] as String?,
          json['fsc_pro_size'] as String?,
          json['fsc_pro_limit'] as String?,
          json['fsc_pro_price'] as String?,
        );

Map<String, dynamic> _$UpdateFurtherSubCatProductsResponseToJson(
        UpdateFurtherSubCatProductsResponse instance) =>
    <String, dynamic>{
      'fsc_pro_name': instance.names,
      'fsc_pro_des': instance.des,
      'fsc_pro_image_url': instance.imageUrl,
      'fsc_pro_color': instance.color,
      'fsc_pro_size': instance.size,
      'fsc_pro_limit': instance.limit,
      'fsc_pro_price': instance.price,
    };

UpdateCatProductResponse _$UpdateCatProductResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateCatProductResponse(
      json['pro_name'] as String?,
      json['pro_des'] as String?,
      json['pro_image_url'] as String?,
      json['pro_color'] as String?,
      json['pro_size'] as String?,
      json['pro_limit'] as String?,
      json['pro_price'] as String?,
    );

Map<String, dynamic> _$UpdateCatProductResponseToJson(
        UpdateCatProductResponse instance) =>
    <String, dynamic>{
      'pro_name': instance.names,
      'pro_des': instance.des,
      'pro_image_url': instance.imageUrl,
      'pro_color': instance.color,
      'pro_size': instance.size,
      'pro_limit': instance.limit,
      'pro_price': instance.price,
    };

CatProductsResponse _$CatProductsResponseFromJson(Map<String, dynamic> json) =>
    CatProductsResponse(
      json['pro_name'] as String?,
      json['pro_des'] as String?,
      json['pro_image_url'] as String?,
      json['pro_color'] as String?,
      json['pro_size'] as String?,
      json['pro_limit'] as String?,
      json['pro_price'] as String?,
    );

Map<String, dynamic> _$CatProductsResponseToJson(
        CatProductsResponse instance) =>
    <String, dynamic>{
      'pro_name': instance.names,
      'pro_des': instance.des,
      'pro_image_url': instance.imageUrl,
      'pro_color': instance.color,
      'pro_size': instance.size,
      'pro_limit': instance.limit,
      'pro_price': instance.price,
    };
