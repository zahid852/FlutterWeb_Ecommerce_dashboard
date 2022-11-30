import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/add_cat_product.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/addfurther_subcat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/addsubcat_product_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/all_cat_product_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/all_furtherSubCat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/all_subCat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/delete_subCat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/update_subcatpro_usecase.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/all_subcat.dart';
import 'package:flutter/cupertino.dart';

import '../../../App/di.dart';
import '../../../Domain/Usecase/product_Usecases/delete_catPro_usecase.dart';
import '../../../Domain/Usecase/product_Usecases/delete_furtherSubCatPro_usecase.dart';
import '../../../Domain/Usecase/product_Usecases/update_catPro_usecase.dart';
import '../../../Domain/Usecase/product_Usecases/update_furSubCatPro_usecase.dart';

class ProductProvider extends ChangeNotifier {
  AddSubCatProductUsecase _addSubCatProductUseCase =
      instance<AddSubCatProductUsecase>();
  AddFurtherSubCatProductUsecase _addFurtherSubCatProductUseCase =
      instance<AddFurtherSubCatProductUsecase>();
  AddCatProductUsecase _addCatProductUseCase = instance<AddCatProductUsecase>();

  AllSubCatProductUsecase _allSubCatProductUseCase =
      instance<AllSubCatProductUsecase>();
  AllFurtherSubCatProductUsecase _allFurtherSubCatProductUseCase =
      instance<AllFurtherSubCatProductUsecase>();
  AllCatProductUsecase _allCatProductUseCase = instance<AllCatProductUsecase>();
  UpdateSubCatProductUsecase _updateSubCatProductUseCase =
      instance<UpdateSubCatProductUsecase>();
  UpdateFurtherSubCatProductUsecase _updateFurtherSubCatProductUseCase =
      instance<UpdateFurtherSubCatProductUsecase>();
  UpdateCatProductUsecase _updateCatProductUseCase =
      instance<UpdateCatProductUsecase>();

  DeleteSubCatProductUsecase _deleteSubCatProductUseCase =
      instance<DeleteSubCatProductUsecase>();
  DeleteFurtherSubCatProductUsecase _deleteFurtherSubCatProductUseCase =
      instance<DeleteFurtherSubCatProductUsecase>();
  DeleteCatProductUsecase _deleteCatProductUseCase =
      instance<DeleteCatProductUsecase>();
  List<Product> _allProduct = [];
  List<Product> get allProduct {
    return [..._allProduct];
  }

  ProductWithoutId productWithoutId =
      ProductWithoutId(Empty, Empty, Empty, Empty, Empty, Empty, Empty);
  Future<void> addSubCatProduct(AddSubCatProductInput input) async {
    try {
      (await _addSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addFurtherSubCatProduct(
      AddFurtherSubCatProductInput input) async {
    try {
      (await _addFurtherSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addCatProduct(AddCatProductInput input) async {
    try {
      (await _addCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> allSubCatProductsData(AllSubCatProductInput input) async {
    _allProduct = [];
    try {
      (await _allSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        _allProduct = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> allFurtherSubCatProductsData(
      AllFurtherSubCatProductInput input) async {
    _allProduct = [];
    try {
      (await _allFurtherSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        _allProduct = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> allCatProductsData(AllCatProductInput input) async {
    _allProduct = [];
    try {
      (await _allCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        print('data ${data}');
        _allProduct = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateSubCatProduct(UpdateSubCatProductInput input) async {
    try {
      (await _updateSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        productWithoutId = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateCatProduct(UpdateCatProductInput input) async {
    try {
      (await _updateCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        productWithoutId = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateFurtherSubCatProduct(
      UpdateFurtherSubCatProductInput input) async {
    try {
      (await _updateFurtherSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        productWithoutId = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> DeleteSubCatProduct(DeleteSubCatProductInput input) async {
    try {
      (await _deleteSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        final deletedItemIndex = _allProduct
            .indexWhere((ProItem) => ProItem.pro_id == input.subCatProId);
        _allProduct.removeAt(deletedItemIndex);
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> DeleteFurtherSubCatProduct(
      DeleteFurtherSubCatProductInput input) async {
    try {
      (await _deleteFurtherSubCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        final deletedItemIndex = _allProduct.indexWhere(
            (ProItem) => ProItem.pro_id == input.FurtherSubCatProId);
        _allProduct.removeAt(deletedItemIndex);
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> DeleteCatProduct(DeleteCatProductInput input) async {
    try {
      (await _deleteCatProductUseCase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        final deletedItemIndex = _allProduct
            .indexWhere((ProItem) => ProItem.pro_id == input.CatProId);
        _allProduct.removeAt(deletedItemIndex);
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }
}
