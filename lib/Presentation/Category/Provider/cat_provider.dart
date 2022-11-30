import 'package:ecomerce_web/App/di.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/addcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/allcat_usecase.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/deletecat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/updatecat_usecase.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  AddCatUsecase _addCatUsecase = instance<AddCatUsecase>();
  AllCatUsecase _allCatUsecase = instance<AllCatUsecase>();
  UpdateCatUsecase _updateCatUsecase = instance<UpdateCatUsecase>();
  DeleteCatUsecase _deleteCatUsecase = instance<DeleteCatUsecase>();
  String name = Empty;
  String des = Empty;
  String imageUrl = Empty;
  int parameter = Zero;
  List<Category> _allCatData = [];
  List<Category> get allCategoryData {
    return [..._allCatData];
  }

  Future<void> addCatData(CatAddInput input) async {
    try {
      (await _addCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> allCatData() async {
    try {
      print('getting');
      (await _allCatUsecase.execute(Empty)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        _allCatData = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateCatData(CatUpdateInput input) async {
    try {
      (await _updateCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        name = data.name;
        des = data.des;
        imageUrl = data.imageUrl;
        parameter = data.parameter;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteCatData(CatDeleteInput input) async {
    try {
      (await _deleteCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        final deletedItemIndex =
            _allCatData.indexWhere((catItem) => catItem.id == input.id);
        _allCatData.removeAt(deletedItemIndex);
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteCatSubData(CatDeleteInput input) async {
    try {
      (await _deleteCatUsecase.executeCatSub(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteCatProData(CatDeleteInput input) async {
    try {
      (await _deleteCatUsecase.executeCatPro(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }
}
