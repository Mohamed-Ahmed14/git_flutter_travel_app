import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_app/feature/account/view_model/cubit/state.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_helper.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_keys.dart';

import '../../../../core/colors/colors.dart';
import '../../../account/view_model/data/firestore_keys.dart';

class AccountCubit extends Cubit<AccountState>{
  AccountCubit():super(AccountInitState());
  static AccountCubit get(context)=>BlocProvider.of<AccountCubit>(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();



  GlobalKey<FormState> accountKey = GlobalKey<FormState>();




  CollectionReference account = FirebaseFirestore.instance.
  collection(FireStoreKeys.account);


//   Future<void> addProfile({
//     String? name,String? email,String? user_id,String?phone,
//     String? city,String? address})
//   async{
//     emit(AddAccountLoadingState());
//     await account.add({
//       FireStoreKeys.user_id:user_id?? "",
//       FireStoreKeys.name:name?? "",
//       FireStoreKeys.email:email?? "",
//       FireStoreKeys.address:address?? "",
//       FireStoreKeys.city:city?? "",
//     }).then((value){
//       print("Account Add Successfully");
//       emit(AddAccountSuccessState());
//     }).catchError((error){
//       emit(AddAccountErrorState());
//       print("Account Add Error");
//     });
// }

  QueryDocumentSnapshot? accountData;

  Future<void> showProfile() async{
    accountData=null;
    emit(ShowProfLoadingState());
    await account.where(FireStoreKeys.user_id,isEqualTo: SharedHelper.get(key: SharedKeys.user_id)).
        get().then((value) {
          accountData = value.docs[0];
          setProfDataToCont();
          print("Nice");
      emit(ShowProfSuccessState());
    }).catchError((onError){
      emit(ShowProfErrorState());
    });
  }
  Future<void> editProfile() async{

    emit(EditProfileLoadingState());
  }



  void setProfDataToCont(){
    if(accountData?[FireStoreKeys.name] == null)
    {
      nameController.text = "";
    }else
    {
      nameController.text =accountData?[FireStoreKeys.name];
    }
    if(accountData?[FireStoreKeys.email] == null)
    {
      emailController.text = "";
    }else
    {
      emailController.text = accountData?[FireStoreKeys.email];
    }
    if(accountData?[FireStoreKeys.phone] == null)
    {
      phoneController.text = "";
    }else
    {
      phoneController.text = accountData?[FireStoreKeys.phone];
    }
    if(accountData?[FireStoreKeys.city] == null)
    {
      cityController.text = "";
    }else
    {
      cityController.text = accountData?[FireStoreKeys.city]!;
    }
    if(accountData?[FireStoreKeys.address] == null)
    {
      addressController.text = "";
    }else
    {
      addressController.text = accountData?[FireStoreKeys.address];
    }
  }

  //Edit Profile Form
  bool isEditPressed = false;
  Color? formColor = Colors.grey[600];

  void changeFormStatus(){
    isEditPressed = !isEditPressed;
    if(isEditPressed)
    {
      formColor = Colors.grey[400];
    }
    else{
      formColor = Colors.grey[600];
    }
    emit(ChangeFormState());
  }


  Future<void> updateProfile() async{

    emit(EditProfileLoadingState());
    await account.doc(accountData?.id).update({
      FireStoreKeys.name:nameController.text,
      FireStoreKeys.address:addressController.text,
      FireStoreKeys.city:cityController.text,
      FireStoreKeys.phone:phoneController.text,
    }).then((value){
      print("profile updated");
      SharedHelper.set(key: SharedKeys.name, value: nameController.text);
      Fluttertoast.showToast(
          msg: 'profile updated',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: AppColor.grey,
          textColor: AppColor.foreGround,
          fontSize: 16.0
      );
      emit(EditProfileSuccessState());
    }).catchError((error){
      emit(EditProfileErrorState());
    });
  }

}