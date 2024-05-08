import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_helper.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_keys.dart';

import '../../../account/view_model/data/firestore_keys.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthInitState());
  static AuthCubit get(context)=>BlocProvider.of<AuthCubit>(context);

  //Text Form Fields Controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  //Form Keys
  GlobalKey<FormState> loginFormKey =GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey =GlobalKey<FormState>();
  //Obscure
  bool obscureText=true;
  bool confObscureText = true;
  void changeObscure()
  {
    obscureText=!obscureText;
    emit(ChangeObscureSuccessState());
  }
  void changeConObscure()
  {
    confObscureText=!confObscureText;
    emit(ChangeConObscureSuccessState());
  }
  //Clear Controllers
  void reset()
  {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmedPasswordController.clear();
    obscureText=true;
    confObscureText=true;
  }
 // Validators Name, email, Password, Confirmed Password
  String? nameValidator(String? value){
    if(value == "")
      {
        return "This field can't be empty";
      }
    return null;
  }
  String? emailValidator(String? value){
    if(value == "")
    {
      return "This field can't be empty";
    }
    else if(value != null &&
        value.contains(RegExp(r'[@]')) &&
        value.contains(RegExp(r'[.]')) &&
        (value.contains(RegExp(r'[A-Z]'))||
        value.contains(RegExp(r'[a-z]'))))
      {
          return null;
      }
    return "Enter Valid Email";
  }
  String? passwordValidator(String? value) {
    if (value == "") {
      return "This field can't be empty";
    }
    else if (value != null && value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }
  String? ConPasswordValidator(String? value) {
    if (value == "") {
      return "This field can't be empty";
    }
    else if (value != null && value != passwordController.text) {
      return "Password not match";
    }
    return null;
  }
 /*************************************************************************/
//Firebase Auth

Future<void> firebaseSignUp() async{
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    );
    Fluttertoast.showToast(
        msg: 'Sign Up successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColor.grey,
        textColor: AppColor.foreGround,
        fontSize: 16.0
    );
     SharedHelper.set(key: SharedKeys.user_id, value: userCredential.user?.uid ?? "");
     SharedHelper.set(key: SharedKeys.name, value: nameController.text);
     SharedHelper.set(key: SharedKeys.email, value: emailController.text);
   await addProfile(user_id: SharedHelper.get(key: SharedKeys.user_id,),
    name: nameController.text,email: emailController.text);

    print(userCredential.user?.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      Fluttertoast.showToast(
          msg: 'The password provided is too weak.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: AppColor.red,
          textColor: AppColor.white,
          fontSize: 16.0
      );
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      Fluttertoast.showToast(
          msg: 'The account already exists',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: AppColor.red,
          textColor: AppColor.white,
          fontSize: 16.0
      );
    }
    rethrow;
  } catch (e) {
    print(e);
    rethrow;
  }
}



Future<void> firebaseLogin() async{
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    );
    Fluttertoast.showToast(
        msg: 'Login successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColor.grey,
        textColor: AppColor.foreGround,
        fontSize: 16.0
    );
    SharedHelper.set(key: SharedKeys.user_id, value: userCredential.user?.uid ?? "");
    SharedHelper.set(key: SharedKeys.email, value: emailController.text);
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(
        msg: 'Wrong email or password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColor.red,
        textColor: AppColor.white,
        fontSize: 16.0
    );
     rethrow;
  }
}

Future<void> firebaseLogout() async{

  GoogleSignIn googleUser = GoogleSignIn();
  googleUser.disconnect();
  await FirebaseAuth.instance.signOut();
  Fluttertoast.showToast(
      msg: 'logout',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColor.grey,
      textColor: AppColor.foreGround,
      fontSize: 16.0
  );
}

Future<void> firebaseResetPassword() async{
  if(emailController.text == "")
    {
      Fluttertoast.showToast(
          msg: 'Enter your email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: AppColor.red,
          textColor: AppColor.white,
          fontSize: 16.0
      );
      return;
    }
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value) {
      Fluttertoast.showToast(
          msg: 'Email was sent',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: AppColor.foreGround,
          textColor: AppColor.grey,
          fontSize: 16.0
      );
    });

  }on FirebaseAuthException catch (e)
  {
    Fluttertoast.showToast(
        msg: 'Wrong Email',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColor.red,
        textColor: AppColor.white,
        fontSize: 16.0
    );
    rethrow;
  }catch(e){
    Fluttertoast.showToast(
        msg: 'Wrong Email',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColor.red,
        textColor: AppColor.white,
        fontSize: 16.0
    );
    rethrow;
  }
}

  Future<void> signInWithGoogle() async {

    emit(GoogleSignInLoadingState());

    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if(googleUser == null)
    // {
    //   print("no sign up");
    //   return;
    // }


    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      SharedHelper.set(key: SharedKeys.user_id, value: value.user?.uid ?? "");
      SharedHelper.set(key: SharedKeys.email, value: value.user?.email);

       addProfile(user_id: SharedHelper.get(key: SharedKeys.user_id,),
      email: SharedHelper.get(key: SharedKeys.email,));

      Fluttertoast.showToast(
          msg: 'Login successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: AppColor.grey,
          textColor: AppColor.foreGround,
          fontSize: 16.0
      );
      print(value.user?.uid);
      emit(GoogleSignInSuccessState());
    }).catchError((error){
      print(error.toString());
      print("take away");
      throw error;
    });

  }


  User? getUserCurrentState(){
   User? user = FirebaseAuth.instance.currentUser;
   if(user == null){
     print("signed out");
   }else{
     print("signed in");
   }
   return user;
  }



  CollectionReference account = FirebaseFirestore.instance.
  collection(FireStoreKeys.account);


  Future<void> addProfile({
    String? name,String? email,String? user_id,String?phone,
    String? city,String? address})
  async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("account").
    where(FireStoreKeys.user_id,isEqualTo: SharedHelper.get(key: SharedKeys.user_id)).
        get();
    if(querySnapshot.docs.isNotEmpty)
      {
        print("AAAAAAAA");
        return;
      }
    emit(AddAccountLoadingState());
    await account.add({
      FireStoreKeys.user_id:user_id?? "",
      FireStoreKeys.name:name?? "",
      FireStoreKeys.email:email?? "",
      FireStoreKeys.address:address?? "",
      FireStoreKeys.city:city?? "",
      FireStoreKeys.phone:phone?? "",
    }).then((value){
      print("Account Add Successfully");
      emit(AddAccountSuccessState());
    }).catchError((error){
      emit(AddAccountErrorState());
      print("Account Add Error");
    });
  }

}