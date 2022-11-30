import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecomerce_web/Data/Repositry/repositry_impl.dart';
import 'package:ecomerce_web/Data/dataSource/data_source.dart';
import 'package:ecomerce_web/Data/network/app_api.dart';
import 'package:ecomerce_web/Data/network/dio_factory.dart';
import 'package:ecomerce_web/Data/network/network_info.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/addcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/allcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/deletecat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/updatecat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/addfurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/deletefurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/updatefurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/add_cat_product.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/addfurther_subcat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/addsubcat_product_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/all_furtherSubCat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/delete_subCat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/update_furSubCatPro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/update_subcatpro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/addsubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/allsubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/deletesubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/updatesubcat_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Domain/Usecase/product_Usecases/all_cat_product_usecase.dart';
import '../Domain/Usecase/product_Usecases/all_subCat_pro_usecase.dart';
import '../Domain/Usecase/product_Usecases/delete_catPro_usecase.dart';
import '../Domain/Usecase/product_Usecases/delete_furtherSubCatPro_usecase.dart';
import '../Domain/Usecase/product_Usecases/update_catPro_usecase.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // instance.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInforImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInforImpl(Connectivity(), ConnectivityResult.none));

  //dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  //app service instance
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<appServiceClient>(() => appServiceClient(dio));
  //remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  //repositry instance
  instance.registerLazySingleton<repositry>(
      () => repositryImplementer(instance(), instance()));

  //for Add Category Usecase instance
  instance.registerFactory<AddCatUsecase>(() => AddCatUsecase(instance()));
  //for All Category Usecase instance
  instance.registerFactory<AllCatUsecase>(() => AllCatUsecase(instance()));
  //for Update Category Usecase instance
  instance
      .registerFactory<UpdateCatUsecase>(() => UpdateCatUsecase(instance()));
  //for delete Category Usecase instance
  instance
      .registerFactory<DeleteCatUsecase>(() => DeleteCatUsecase(instance()));

  //for Add SubCategory Usecase instance
  instance
      .registerFactory<AddSubCatUsecase>(() => AddSubCatUsecase(instance()));
  //for All SubCategory Usecase instance
  instance
      .registerFactory<AllSubCatUsecase>(() => AllSubCatUsecase(instance()));
  //for Update SubCategory Usecase instance
  instance.registerFactory<UpdateSubCatUsecase>(
      () => UpdateSubCatUsecase(instance()));
  //for delete SubCategory Usecase instance
  instance.registerFactory<DeleteSubCatUsecase>(
      () => DeleteSubCatUsecase(instance()));
  //for Add further SubCategory Usecase instance
  instance.registerFactory<AddFurtherSubCatUsecase>(
      () => AddFurtherSubCatUsecase(instance()));
  //for Update Further SubCategory Usecase instance
  instance.registerFactory<UpdateFurtherSubCatUsecase>(
      () => UpdateFurtherSubCatUsecase(instance()));
  //for delete SubCategory Usecase instance
  instance.registerFactory<DeleteFurtherSubCatUsecase>(
      () => DeleteFurtherSubCatUsecase(instance()));

  instance.registerFactory<AddSubCatProductUsecase>(
      () => AddSubCatProductUsecase(instance()));
  instance.registerFactory<AddFurtherSubCatProductUsecase>(
      () => AddFurtherSubCatProductUsecase(instance()));
  instance.registerFactory<AddCatProductUsecase>(
      () => AddCatProductUsecase(instance()));

  instance.registerFactory<AllSubCatProductUsecase>(
      () => AllSubCatProductUsecase(instance()));

  instance.registerFactory<AllFurtherSubCatProductUsecase>(
      () => AllFurtherSubCatProductUsecase(instance()));

  instance.registerFactory<AllCatProductUsecase>(
      () => AllCatProductUsecase(instance()));
  instance.registerFactory<UpdateSubCatProductUsecase>(
      () => UpdateSubCatProductUsecase(instance()));
  instance.registerFactory<UpdateFurtherSubCatProductUsecase>(
      () => UpdateFurtherSubCatProductUsecase(instance()));
  instance.registerFactory<UpdateCatProductUsecase>(
      () => UpdateCatProductUsecase(instance()));

  instance.registerFactory<DeleteSubCatProductUsecase>(
      () => DeleteSubCatProductUsecase(instance()));
  instance.registerFactory<DeleteFurtherSubCatProductUsecase>(
      () => DeleteFurtherSubCatProductUsecase(instance()));
  instance.registerFactory<DeleteCatProductUsecase>(
      () => DeleteCatProductUsecase(instance()));
}
