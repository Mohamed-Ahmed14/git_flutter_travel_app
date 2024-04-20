
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_helper.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_keys.dart';
import 'package:travel_app/feature/favourite/model/favourite.dart';
import 'package:travel_app/feature/favourite/view_model/cubit/state.dart';
import 'package:travel_app/feature/favourite/view_model/data/firestore_keys.dart';

import '../../../../core/colors/colors.dart';
import '../../../home/model/destination_model.dart';

class FavouriteCubit extends Cubit<FavouriteState>{
  FavouriteCubit() : super(FavouriteInitState());

  static FavouriteCubit get(context) =>BlocProvider.of<FavouriteCubit>(context);


  List<QueryDocumentSnapshot> favouriteList = [];

  bool isFaouriteItem(int id){
    if(favouriteList.isEmpty)
      {
        return false;
      }
    else{
      for(var i in favouriteList)
      {
        if(i["destination_id"] == id) {
          return true;
        }
      }
    }
    return false;
  }



  CollectionReference favourite = FirebaseFirestore.instance.
  collection(FireStoreKeys.favourite);

  Future<void> addToFavourite(DestinationModel destModel) async{
    print("add favourite");
    print(SharedHelper.get(key: SharedKeys.user_id));
    emit(AddFavouriteLoadingState());
    await favourite.add({
      FireStoreKeys.user_id:SharedHelper.get(key: SharedKeys.user_id),
      FireStoreKeys.destination_id : destModel.id,
      FireStoreKeys.destination_name: destModel.name,
      FireStoreKeys.destination_image:destModel.imagesList?[0] ?? "",
    }).then((value){
      print("Done");
      Fluttertoast.showToast(
          msg: 'add to favourite',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: AppColor.grey,
          textColor: AppColor.foreGround,
          fontSize: 16.0
      );
      emit(AddFavouriteSuccessState());
    }).catchError((error){
      emit(AddFavouriteErrorState());
    });


  }

  Future<void> getFavourite() async{
    emit(GetFavouriteLoadingState());
    await FirebaseFirestore.instance.collection(FireStoreKeys.favourite).
    where(FireStoreKeys.user_id,isEqualTo:SharedHelper.get(key: SharedKeys.user_id)).
    get().then((value) {
      favouriteList.clear();
      favouriteList.addAll(value.docs);
      // for(var i in value.docs)
      //   {
      //     favouriteList.add(FavouriteModel.fromJson(i.data()));
      //   }
      emit(GetFavouriteSuccessState());
    }).catchError((error){
      emit(GetFavouriteErrorState());
      throw error;
    });
  }

  Future<void> removeFavourite(String index) async{
    print("Remove favourite");
    emit(RemoveFavouriteLoadingState());
    await favourite.doc(index).delete()
        .then((value){
      print("Done deleting");
      Fluttertoast.showToast(
          msg: 'removed from favourite',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: AppColor.foreGround,
          textColor: AppColor.grey,
          fontSize: 16.0
      );
      emit(RemoveFavouriteSuccessState());
    }).catchError((error){
      emit(RemoveFavouriteErrorState());
    });


  }

}