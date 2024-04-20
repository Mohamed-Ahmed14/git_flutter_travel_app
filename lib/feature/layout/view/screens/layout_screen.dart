import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors/colors.dart';
import 'package:travel_app/feature/home/view/widgets/category/destination_widget.dart';


import '../../../account/view_model/cubit/cubit.dart';
import '../../../booking/view_model/cubit/cubit.dart';
import '../../../favourite/view_model/cubit/cubit.dart';
import '../../view_model/layout_cubit/layout_cubit.dart';
import '../../view_model/layout_cubit/layout_state.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState(){
    // TODO: implement initState
    AccountCubit.get(context).showProfile();
    BookingCubit.get(context).getOrder();
    FavouriteCubit.get(context).getFavourite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit,LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.current_index,
            onTap: (value){
              cubit.changeLayout(value);
            },
            elevation: 20,

            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.backGround,
            selectedItemColor: AppColor.foreGround,
            unselectedItemColor: AppColor.grey,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.travel_explore_outlined),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined),
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket_rounded),
                label: "Trips",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
          body: cubit.screens[cubit.current_index],
        );
      },

    );
  }
}
