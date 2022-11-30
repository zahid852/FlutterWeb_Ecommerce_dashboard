import 'package:ecomerce_web/App/di.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/deletecat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/addfurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/deletefurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/updatefurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/addsubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/deletesubcat_usecase.dart';
import 'package:flutter/material.dart';

import '../../../Domain/Usecase/subcategory_usecase/allsubcat_usecase.dart';
import '../../../Domain/Usecase/subcategory_usecase/updatesubcat_usecase.dart';

class SubCategoryProvider extends ChangeNotifier {
  AddSubCatUsecase _addSubCatUsecase = instance<AddSubCatUsecase>();
  AllSubCatUsecase _allSubCatUsecase = instance<AllSubCatUsecase>();
  UpdateSubCatUsecase _updateSubCatUsecase = instance<UpdateSubCatUsecase>();
  DeleteSubCatUsecase _deleteSubCatUsecase = instance<DeleteSubCatUsecase>();

  AddFurtherSubCatUsecase _addFurtherSubCatUsecase =
      instance<AddFurtherSubCatUsecase>();
  UpdateFurtherSubCatUsecase _updateFurtherSubCatUsecase =
      instance<UpdateFurtherSubCatUsecase>();
  DeleteFurtherSubCatUsecase _deleteFurtherSubCatUsecase =
      instance<DeleteFurtherSubCatUsecase>();

  String name = Empty;
  String des = Empty;
  String imageUrl = Empty;
  int parameter = Zero;
  String furtherSubCatName = Empty;
  String furtherSubCatDes = Empty;
  String furtherSubCatImageUrl = Empty;
  int furtherSubCatParameter = Zero;
  List<Category> furtherSubCategories = [];
  List<SubCategory> _allSubCatData = [];
  List<SubCategory> get allSubCategoryData {
    return [..._allSubCatData];
  }

  Future<void> addSubCatData(SubCatAddInput input) async {
    try {
      (await _addSubCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> allSubCatData(CatIdInput input) async {
    _allSubCatData = [];

    try {
      (await _allSubCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        _allSubCatData = data;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateSubCatData(SubCatUpdateInput input) async {
    try {
      (await _updateSubCatUsecase.execute(input)).fold((failure) {
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

  Future<void> deleteSubCatData(SubCatDeleteInput input) async {
    try {
      (await _deleteSubCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        final deletedItemIndex = _allSubCatData
            .indexWhere((SubcatItem) => SubcatItem.id == input.SubCatId);
        _allSubCatData.removeAt(deletedItemIndex);
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addFurtherSubCatData(FurtherSubCatAddInput input) async {
    try {
      (await _addFurtherSubCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateFurtherSubCatData(FurtherSubCatUpdateInput input) async {
    try {
      (await _updateFurtherSubCatUsecase.execute(input)).fold((failure) {
        throw failure;
      }, (data) {
        furtherSubCatName = data.name;
        furtherSubCatDes = data.des;
        furtherSubCatImageUrl = data.imageUrl;
        furtherSubCatParameter = data.parameter;
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteFurtherSubCatData(FurtherSubCatDeleteInput input) async {
    try {
      (await _deleteFurtherSubCatUsecase.execute(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        final deletedItemIndex = furtherSubCategories.indexWhere(
            (FurtherSubcatItem) =>
                FurtherSubcatItem.id == input.FurtherSubCatId);
        furtherSubCategories.removeAt(deletedItemIndex);
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteSubCatPro(SubCatDeleteInput input) async {
    try {
      (await _deleteSubCatUsecase.executeSubCatPro(input)).fold((failure) {
        print(failure.code.toString() + " " + failure.message);
        throw failure;
      }, (data) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteFurtherSubCatPro(FurtherSubCatDeleteInput input) async {
    try {
      (await _deleteFurtherSubCatUsecase.executeFurtherSubCatPro(input)).fold(
          (failure) {
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
