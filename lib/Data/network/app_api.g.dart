// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _appServiceClient implements appServiceClient {
  _appServiceClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://ecomerce-8d610-default-rtdb.firebaseio.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AddCatResponse> addCat(name, des, url, parameter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'cat_name': name,
      'cat_des': des,
      'cat_image_url': url,
      'cat_parameter': parameter
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddCatResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/category.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddCatResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Map<String, CatResponse?>?> AllCat() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, CatResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/category/.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data?.map((k, dynamic v) =>
        MapEntry(k, CatResponse.fromJson(v as Map<String, dynamic>)));
    return value;
  }

  @override
  Future<CatUpdateResponse> updateCat(id, name, des, url, parameter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'cat_name': name,
      'cat_des': des,
      'cat_image_url': url,
      'cat_parameter': parameter
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CatUpdateResponse>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/category/${id}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CatUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> DeleteCat(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/category/${id}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> DeleteCatSub(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/subcategory/${id}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> DeleteCatPro(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/product/${id}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<AddSubCatResponse> addSubCat(id, name, des, url, parameter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'Subcat_name': name,
      'Subcat_des': des,
      'Subcat_image_url': url,
      'Subcat_parameter': parameter
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddSubCatResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/subcategory/${id}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddSubCatResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Map<String, SubCatResponse?>?> AllSubCat(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, SubCatResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/subcategory/${id}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data?.map((k, dynamic v) =>
        MapEntry(k, SubCatResponse.fromJson(v as Map<String, dynamic>)));
    return value;
  }

  @override
  Future<CatUpdateResponse> updateSubCat(
      catId, subCatId, name, des, url, parameter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'Subcat_name': name,
      'Subcat_des': des,
      'Subcat_image_url': url,
      'Subcat_parameter': parameter
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CatUpdateResponse>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/subcategory/${catId}/${subCatId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CatUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> DeleteSubCat(catId, subCatId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/subcategory/${catId}/${subCatId}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> DeleteSubCatPro(catId, subCatId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/product/${catId}/${subCatId}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<AddSubCatResponse> addFurtherSubCat(
      id, subId, name, des, url, parameter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'Further_Subcat_name': name,
      'Further_Subcat_des': des,
      'Further_Subcat_image_url': url,
      'Further_Subcat_parameter': parameter
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddSubCatResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/subcategory/${id}/${subId}/Further_subcategory.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddSubCatResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CatUpdateResponse> updateFurtherSubCat(
      catId, subCatId, furtherSubCatId, name, des, url, parameter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'Further_Subcat_name': name,
      'Further_Subcat_des': des,
      'Further_Subcat_image_url': url,
      'Further_Subcat_parameter': parameter
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        CatUpdateResponse>(Options(
            method: 'PATCH', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/subcategory/${catId}/${subCatId}/Further_subcategory/${furtherSubCatId}.json',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CatUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> DeleteFurtherSubCat(catId, subCatId, furtherSubCatId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'DELETE', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/subcategory/${catId}/${subCatId}/Further_subcategory/${furtherSubCatId}.json',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> DeleteFurtherSubCatPro(catId, subCatId, furtherSubCatId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options,
                '/product/${catId}/${subCatId}/${furtherSubCatId}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<AddCatProductResponse> addSubCatProduct(
      catId, subCatId, name, des, url, color, size, limit, price) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      's_pro_name': name,
      's_pro_des': des,
      's_pro_image_url': url,
      's_pro_color': color,
      's_pro_size': size,
      's_pro_limit': limit,
      's_pro_price': price
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddCatProductResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/product/${catId}/${subCatId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddCatProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddCatProductResponse> addFurtherSubCatProduct(catId, subCatId,
      furtherSubCatId, name, des, url, color, size, limit, price) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'fsc_pro_name': name,
      'fsc_pro_des': des,
      'fsc_pro_image_url': url,
      'fsc_pro_color': color,
      'fsc_pro_size': size,
      'fsc_pro_limit': limit,
      'fsc_pro_price': price
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddCatProductResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/product/${catId}/${subCatId}/${furtherSubCatId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddCatProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddCatProductResponse> addCatProduct(
      catId, name, des, url, color, size, limit, price) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'pro_name': name,
      'pro_des': des,
      'pro_image_url': url,
      'pro_color': color,
      'pro_size': size,
      'pro_limit': limit,
      'pro_price': price
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddCatProductResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/product/${catId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddCatProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Map<String, SubCatProductsResponse?>?> AllSubCatProducts(
      catId, subCatId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, SubCatProductsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/product/${catId}/${subCatId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data?.map((k, dynamic v) => MapEntry(
        k, SubCatProductsResponse.fromJson(v as Map<String, dynamic>)));
    return value;
  }

  @override
  Future<Map<String, FurtherSubCatProductsResponse?>?> AllFurtherSubCatProducts(
      catId, subCatId, furtherSubCatId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, FurtherSubCatProductsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/product/${catId}/${subCatId}/${furtherSubCatId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data?.map((k, dynamic v) => MapEntry(
        k, FurtherSubCatProductsResponse.fromJson(v as Map<String, dynamic>)));
    return value;
  }

  @override
  Future<Map<String, CatProductsResponse?>?> AllCatProducts(catId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, CatProductsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/product/${catId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data?.map((k, dynamic v) =>
        MapEntry(k, CatProductsResponse.fromJson(v as Map<String, dynamic>)));
    return value;
  }

  @override
  Future<UpdateSubCatProductResponse> updateSubCatProduct(
      catId, subCatId, proId, name, des, url, color, size, limit, price) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      's_pro_name': name,
      's_pro_des': des,
      's_pro_image_url': url,
      's_pro_color': color,
      's_pro_size': size,
      's_pro_limit': limit,
      's_pro_price': price
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateSubCatProductResponse>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/product/${catId}/${subCatId}/${proId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateSubCatProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateFurtherSubCatProductsResponse> updatefurtherSubCatProduct(
      catId,
      subCatId,
      furtherSubCatId,
      furtherSubCatproId,
      name,
      des,
      url,
      color,
      size,
      limit,
      price) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'fsc_pro_name': name,
      'fsc_pro_des': des,
      'fsc_pro_image_url': url,
      'fsc_pro_color': color,
      'fsc_pro_size': size,
      'fsc_pro_limit': limit,
      'fsc_pro_price': price
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        UpdateFurtherSubCatProductsResponse>(Options(
            method: 'PATCH', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/product/${catId}/${subCatId}/${furtherSubCatId}/${furtherSubCatproId}.json',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateFurtherSubCatProductsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateCatProductResponse> updateCatProduct(
      catId, proId, name, des, url, color, size, limit, price) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'pro_name': name,
      'pro_des': des,
      'pro_image_url': url,
      'pro_color': color,
      'pro_size': size,
      'pro_limit': limit,
      'pro_price': price
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateCatProductResponse>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/product/${catId}/${proId}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateCatProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteSubCatProduct(catId, subCatId, proId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(
                _dio.options, '/product/${catId}/${subCatId}/${proId}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> deleteFurtherSubCatProduct(
      catId, subCatId, furtherSubCatId, furtherSubCatproId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'DELETE', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/product/${catId}/${subCatId}/${furtherSubCatId}/${furtherSubCatproId}.json',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> deleteCatProduct(catId, proId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/product/${catId}/${proId}.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
