import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ecomerce_web/Data/dataSource/data_source.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Data/network/error_handler.dart';
import 'package:ecomerce_web/Data/network/network_info.dart';
import 'package:ecomerce_web/Data/responses/response.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';

class repositryImplementer implements repositry {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  repositryImplementer(this._remoteDataSource, this._networkInfo);

  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  Future<Either<Failure, AddCategory>> addCatRepositry(
      CatAddRequest catAddRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot = await database
            .ref("category")
            .orderByChild('cat_name')
            .equalTo(catAddRequest.name)
            .once();
        if (snapshot.snapshot.exists) {
          return Left(DataSource.CAT_NAME_ALREADY_EXISTS.getFailure());
        }

        final response = await _remoteDataSource.addCat(catAddRequest);

        return right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Category>>> allCatRepositry() async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.allCat();

        return right(
            response?.entries.map((e) => e.value.toDomain(e.key)).toList() ??
                []);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryWithoutId>> updateCatRepositry(
      CatUpdateRequest catUpdateRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot1 = await database
            .ref("category/${catUpdateRequest.id}/cat_name")
            .once();
        DatabaseEvent snapshot = await database
            .ref("category")
            .orderByChild('cat_name')
            .equalTo(catUpdateRequest.name)
            .once();

        if ((snapshot.snapshot.exists &&
                (snapshot1.snapshot.value == catUpdateRequest.name) ||
            !snapshot.snapshot.exists)) {
          final response = await _remoteDataSource.updateCat(catUpdateRequest);

          return right(response.toDomain());
        }

        return Left(DataSource.CAT_NAME_ALREADY_EXISTS.getFailure());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCatRepositry(
      CatDeleteRequest catDeleteRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.DeleteCat(catDeleteRequest);
        DatabaseEvent snapshot =
            await database.ref("product/${id}").orderByChild('pro_name').once();
        if (snapshot.snapshot.exists) {
          await _remoteDataSource.DeleteCatPro(
              CatDeleteRequest(catDeleteRequest.id));
        }
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddSubCategory>> addSubCatRepositry(
      SubCatAddRequest subcatAddRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot = await database
            .ref("subcategory/${subcatAddRequest.id}")
            .orderByChild('Subcat_name')
            .equalTo(subcatAddRequest.name)
            .once();
        if (snapshot.snapshot.exists) {
          return Left(DataSource.CAT_NAME_ALREADY_EXISTS.getFailure());
        }
        final response = await _remoteDataSource.addSubCat(subcatAddRequest);
        return right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<SubCategory>>> allSubCatRepositry(
      CatIdRequest catIdRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.allSubCat(catIdRequest);
        return right(
            response?.entries.map((e) => e.value.toDomain(e.key)).toList() ??
                []);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryWithoutId>> updateSubCatRepositry(
      SubCatUpdateRequest subCatUpdateRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot1 = await database
            .ref(
                "subcategory/${subCatUpdateRequest.catId}/${subCatUpdateRequest.subCatId}/Subcat_name")
            .once();
        DatabaseEvent snapshot = await database
            .ref("subcategory/${subCatUpdateRequest.catId}")
            .orderByChild('Subcat_name')
            .equalTo(subCatUpdateRequest.name)
            .once();
        if ((snapshot.snapshot.exists &&
                (snapshot1.snapshot.value == subCatUpdateRequest.name)) ||
            !snapshot.snapshot.exists) {
          final response =
              await _remoteDataSource.updateSubCat(subCatUpdateRequest);
          return right(response.toDomain());
        }

        return Left(DataSource.CAT_NAME_ALREADY_EXISTS.getFailure());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteSubCatRepositry(
      SubCatDeleteRequest subcatDeleteRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response =
            await _remoteDataSource.DeleteSubCat(subcatDeleteRequest);
        DatabaseEvent snapshot = await database
            .ref(
                "product/${subcatDeleteRequest.CatId}/${subcatDeleteRequest.SubCatId}")
            .orderByChild('s_pro_name')
            .once();

        if (snapshot.snapshot.exists) {
          await _remoteDataSource.DeleteSubCatPro(SubCatDeleteRequest(
              subcatDeleteRequest.CatId, subcatDeleteRequest.SubCatId));
        }
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddSubCategory>> addFurtherSubCatRepositry(
      FurtherSubCatAddRequest furtherSubCatAddRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot = await database
            .ref(
                "subcategory/${furtherSubCatAddRequest.CatId}/${furtherSubCatAddRequest.SubCatId}/Further_subcategory")
            .orderByChild('Further_Subcat_name')
            .equalTo(furtherSubCatAddRequest.name)
            .once();
        if (snapshot.snapshot.exists) {
          return Left(DataSource.CAT_NAME_ALREADY_EXISTS.getFailure());
        }
        final response =
            await _remoteDataSource.addFurtherSubCat(furtherSubCatAddRequest);
        return right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryWithoutId>> updateFurtherSubCatRepositry(
      FurtherSubCatUpdateRequest furthersubCatUpdateRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot1 = await database
            .ref(
                "subcategory/${furthersubCatUpdateRequest.catId}/${furthersubCatUpdateRequest.subCatId}/Further_subcategory/${furthersubCatUpdateRequest.furtherSubCatId}/Further_Subcat_name")
            .once();

        DatabaseEvent snapshot = await database
            .ref(
                "subcategory/${furthersubCatUpdateRequest.catId}/${furthersubCatUpdateRequest.subCatId}/Further_subcategory")
            .orderByChild('Further_Subcat_name')
            .equalTo(furthersubCatUpdateRequest.name)
            .once();
        if (((snapshot.snapshot.exists &&
                snapshot1.snapshot.value == furthersubCatUpdateRequest.name) ||
            !snapshot.snapshot.exists)) {
          final response = await _remoteDataSource
              .updateFurtherSubCat(furthersubCatUpdateRequest);
          return right(response.toDomain());
        }

        return Left(DataSource.CAT_NAME_ALREADY_EXISTS.getFailure());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteFurtherSubCatRepositry(
      FurtherSubCatDeleteRequest furthersubcatDeleteRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.DeleteFurtherSubCat(
            furthersubcatDeleteRequest);
        DatabaseEvent snapshot = await database
            .ref(
                "product/${id}/${furthersubcatDeleteRequest.SubCatId}/${furthersubcatDeleteRequest.FurtherSubCatId}")
            .orderByChild('fsc_pro_name')
            .once();
        if (snapshot.snapshot.exists) {
          await _remoteDataSource.DeleteFurtherSubCatPro(
              FurtherSubCatDeleteRequest(
                  furthersubcatDeleteRequest.CatId,
                  furthersubcatDeleteRequest.SubCatId,
                  furthersubcatDeleteRequest.FurtherSubCatId));
        }
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCatSubRepositry(
      CatDeleteRequest catDeleteRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.DeleteCatSub(catDeleteRequest);
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddProduct>> addSubCatProductRepositry(
      AddSubCatProductRequest addSubCatAddProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot = await database
            .ref(
                "product/${addSubCatAddProductRequest.catId}/${addSubCatAddProductRequest.subCatId}")
            .orderByChild('s_pro_name')
            .equalTo(addSubCatAddProductRequest.name)
            .once();
        if (snapshot.snapshot.exists) {
          return Left(DataSource.PRO_NAME_ALREADY_EXISTS.getFailure());
        }

        final response = await _remoteDataSource.AddSubCatProduct(
            addSubCatAddProductRequest);

        return right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddProduct>> addFurtherSubCatProductRepositry(
      AddFurtherSubCatProductRequest addFurtherSubCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot = await database
            .ref(
                "product/${addFurtherSubCatProductRequest.catId}/${addFurtherSubCatProductRequest.subCatId}/${addFurtherSubCatProductRequest.furtherSubCatId}")
            .orderByChild('fsc_pro_name')
            .equalTo(addFurtherSubCatProductRequest.name)
            .once();
        if (snapshot.snapshot.exists) {
          return Left(DataSource.PRO_NAME_ALREADY_EXISTS.getFailure());
        }
        final response = await _remoteDataSource.AddFurtherSubCatProduct(
            addFurtherSubCatProductRequest);

        return right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddProduct>> addCatProductRepositry(
      AddCatProductRequest addCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot = await database
            .ref("product/${addCatProductRequest.catId}")
            .orderByChild('pro_name')
            .equalTo(addCatProductRequest.name)
            .once();
        if (snapshot.snapshot.exists) {
          return Left(DataSource.PRO_NAME_ALREADY_EXISTS.getFailure());
        }

        final response =
            await _remoteDataSource.AddCatProduct(addCatProductRequest);

        return right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> allSubCatProductRepositry(
      SubCatProductRequest subCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response =
            await _remoteDataSource.allSubCatProudcts(subCatProductRequest);
        return right(
            response?.entries.map((e) => e.value.toDomain(e.key)).toList() ??
                []);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> allFurtherSubCatProductRepositry(
      FurtherSubCatProductRequest furtherSubCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource
            .allFurtherSubCatProudcts(furtherSubCatProductRequest);
        return right(
            response?.entries.map((e) => e.value.toDomain(e.key)).toList() ??
                []);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> allCatProductRepositry(
      CatProductRequest catProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response =
            await _remoteDataSource.allCatProudcts(catProductRequest);
        return right(
            response?.entries.map((e) => e.value.toDomain(e.key)).toList() ??
                []);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductWithoutId>> updateSubCatProductRepositry(
      UpdateSubCatProductRequest updateSubCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot1 = await database
            .ref(
                "product/${updateSubCatProductRequest.catId}/${updateSubCatProductRequest.subCatId}/${updateSubCatProductRequest.subCatProId}/s_pro_name")
            .once();
        DatabaseEvent snapshot = await database
            .ref(
                "product/${updateSubCatProductRequest.catId}/${updateSubCatProductRequest.subCatId}")
            .orderByChild('s_pro_name')
            .equalTo(updateSubCatProductRequest.name)
            .once();
        if ((snapshot.snapshot.exists &&
                (snapshot1.snapshot.value ==
                    updateSubCatProductRequest.name)) ||
            !snapshot.snapshot.exists) {
          final response = await _remoteDataSource.UpdateSubCatProduct(
              updateSubCatProductRequest);

          return right(response.toDomain());
        }

        return Left(DataSource.PRO_NAME_ALREADY_EXISTS.getFailure());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductWithoutId>> updateFurtherSubCatProductRepositry(
      UpdateFurtherSubCatProductRequest
          updateFurtherSubCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot1 = await database
            .ref(
                "product/${updateFurtherSubCatProductRequest.catId}/${updateFurtherSubCatProductRequest.subCatId}/${updateFurtherSubCatProductRequest.furtherSubCatId}/${updateFurtherSubCatProductRequest.furtherSubCatProId}/fsc_pro_name")
            .once();
        DatabaseEvent snapshot = await database
            .ref(
                "product/${updateFurtherSubCatProductRequest.catId}/${updateFurtherSubCatProductRequest.subCatId}/${updateFurtherSubCatProductRequest.furtherSubCatId}")
            .orderByChild('fsc_pro_name')
            .equalTo(updateFurtherSubCatProductRequest.name)
            .once();
        if ((snapshot.snapshot.exists &&
                (snapshot1.snapshot.value ==
                    updateFurtherSubCatProductRequest.name)) ||
            !snapshot.snapshot.exists) {
          final response = await _remoteDataSource.UpdateFurtherSubCatProduct(
              updateFurtherSubCatProductRequest);

          return right(response.toDomain());
        }

        return Left(DataSource.PRO_NAME_ALREADY_EXISTS.getFailure());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductWithoutId>> updateCatProductRepositry(
      UpdateCatProductRequest updateCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        DatabaseEvent snapshot1 = await database
            .ref(
                "product/${updateCatProductRequest.catId}/${updateCatProductRequest.CatProId}/pro_name")
            .once();
        DatabaseEvent snapshot = await database
            .ref("product/${updateCatProductRequest.catId}")
            .orderByChild('pro_name')
            .equalTo(updateCatProductRequest.CatProId)
            .once();
        if ((snapshot.snapshot.exists &&
                (snapshot1.snapshot.value == updateCatProductRequest.name)) ||
            !snapshot.snapshot.exists) {
          final response =
              await _remoteDataSource.UpdateCatProduct(updateCatProductRequest);

          return right(response.toDomain());
        }

        return Left(DataSource.PRO_NAME_ALREADY_EXISTS.getFailure());
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteSubCatProductRepositry(
      DeleteSubCatProductRequest deleteSubCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.DeleteSubCatProduct(
            deleteSubCatProductRequest);
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteFurtherSubCatProductRepositry(
      DeleteFurtherSubCatProductRequest
          deleteFurtherSubCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.DeleteFurtherSubCatProduct(
            deleteFurtherSubCatProductRequest);
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCatProductRepositry(
      DeleteCatProductRequest deleteCatProductRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response =
            await _remoteDataSource.DeleteCatProduct(deleteCatProductRequest);
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCatProRepositry(
      CatDeleteRequest catDeleteRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.DeleteCatPro(catDeleteRequest);
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteFurtherSubCatProRepositry(
      FurtherSubCatDeleteRequest furtherSubCatDeleteRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response = await _remoteDataSource.DeleteFurtherSubCatPro(
            furtherSubCatDeleteRequest);
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteSubCatProRepositry(
      SubCatDeleteRequest subCatDeleteRequest) async {
    if (await _networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final response =
            await _remoteDataSource.DeleteSubCatPro(subCatDeleteRequest);
        return right(Empty);
      } catch (error) {
        return Left(ErrorHandler(error).failure);
      }
    } else {
      return Left(DataSource.NETWORK_ERROR.getFailure());
    }
  }
}
