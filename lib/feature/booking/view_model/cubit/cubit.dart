import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_helper.dart';
import 'package:travel_app/feature/auth/view_model/data/local/shared_keys.dart';
import 'package:travel_app/feature/booking/view_model/cubit/state.dart';
import 'package:travel_app/feature/booking/view_model/data/firestore_keys.dart';
import 'package:travel_app/feature/home/model/destination_model.dart';

import '../../../../core/colors/colors.dart';
import '../../model/order_model.dart';

class BookingCubit extends Cubit<BookingState>{
  BookingCubit():super(BookingInitState());
  static BookingCubit get(context)=>BlocProvider.of<BookingCubit>(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int noOfTickets=1;
  int totalPrice = 0;

  GlobalKey<FormState> bookingKey = GlobalKey<FormState>();

  String? validator(String? value){
    if(value == "")
      {
        return "This field is required";
      }
    return null;
  }

  DestinationModel? destinationModel;
  void setDestination(DestinationModel dest_model){
    destinationModel = dest_model;
    totalPrice=dest_model.price!;
  }

  void reset(){
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    cityController.clear();
    dateController.clear();
    noOfTickets=1;
    totalPrice =0;
  }

  void updateNoOfTickets(int value){
    noOfTickets = value;
    totalPrice = noOfTickets * (destinationModel?.price ??1);
    emit(UpdateNoOfTicketsSuccessState());
  }

  CollectionReference order = FirebaseFirestore.instance.
  collection(FireStoreKeys.order);

  Future<void> addOrder() async{
      emit(AddOrderLoadingState());

      await order.add({
        FireStoreKeys.user_id:SharedHelper.get(key: SharedKeys.user_id),

        FireStoreKeys.user_name:nameController.text,
        FireStoreKeys.user_email:emailController.text,
        FireStoreKeys.user_phone:phoneController.text,
        FireStoreKeys.user_city:cityController.text,

        FireStoreKeys.destination_id:destinationModel?.id ?? 0,
        FireStoreKeys.destination_name:destinationModel?.name ?? "",
        FireStoreKeys.destination_image:destinationModel?.imagesList?[0] ?? "",
        FireStoreKeys.destination_price:destinationModel?.price,
        FireStoreKeys.days:destinationModel?.days,

        FireStoreKeys.travel_date:dateController.text,
        FireStoreKeys.no_tickets:noOfTickets,
        FireStoreKeys.total_price:totalPrice,
      }).then((value) {
        print("Order Added");
        Fluttertoast.showToast(
            msg: 'trip booked',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: AppColor.grey,
            textColor: AppColor.foreGround,
            fontSize: 16.0
        );
        emit(AddOrderSuccessState());
      }).catchError((error){
        emit(AddOrderErrorState());
        throw error;
      });
  }
    List<OrderModel> ordersList = [];
  Future<void> getOrder()async{
    emit(GetOrderLoadingState());
    await order.where(
        FireStoreKeys.user_id,isEqualTo: SharedHelper.get(key: SharedKeys.user_id))
        .get().then((value){
          ordersList.clear();
          for(var i in value.docs)
            {
              ordersList.add(OrderModel.fromJson(i.data() as Map<String,dynamic>));
            }
          print("Get Data Succssfully");
      emit(GetOrderSuccessState());
    }).catchError((error){
      emit(GetOrderErrorState());
      throw error;
    });
  }
  OrderModel? singleOrder;
  void getSingleTrip(int index){
    singleOrder = ordersList[index];
    print(singleOrder?.travel_date);
    emit(GetSingOrderSuccessState());
  }

}