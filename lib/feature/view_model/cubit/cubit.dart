import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/feature/home/model/category_type.dart';
import 'package:travel_app/feature/view_model/cubit/state.dart';

import '../../home/model/destination_model.dart';


class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitState());

  static HomeCubit get(context)=>BlocProvider.of<HomeCubit>(context);

  List<DestinationModel> destinationList = [

    //Ancient Places
    DestinationModel(
      id : 1,
      name: "Egypt",
      category: CategoryType.Ancient,
      days: 10,
      price: 120,
      imagesList: [
        "assets/images/category/ancient/egypt1.jpg",
        "assets/images/category/ancient/egypt2.jpg",
        "assets/images/category/ancient/egypt3..jpg",
      ],
      description: "Egypt, the mesmerising jewel of Africa,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Egypt’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Egypt’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],

    ),
    DestinationModel(
      id : 2,
      name: "Italy",
      category: CategoryType.Ancient,
      days: 8,
      price: 240,
      imagesList: [
        "assets/images/category/ancient/italy1.png",
        "assets/images/category/ancient/italy2.jpg",
        "assets/images/category/ancient/italy3.jpeg",
      ],
      description: "Italy, the mesmerising jewel of Europe,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Italy’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Italy’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 3,
      name: "China",
      category: CategoryType.Ancient,
      days: 6,
      price: 200,
      imagesList: [
        "assets/images/category/ancient/china1.jpg",
        "assets/images/category/ancient/china2.jpg",
        "assets/images/category/ancient/china3.jpg",
      ],
      description: "China, the mesmerising jewel of Asia,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring China’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring China’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 4,
      name: "Turkey",
      category: CategoryType.Ancient,
      days: 14,
      price: 250,
      imagesList: [
        "assets/images/category/ancient/turkey1.jpg",
        "assets/images/category/ancient/turkey2.jpeg",
        "assets/images/category/ancient/turkey3.jpg",
      ],
      description: "Turkey, the mesmerising jewel of Europe,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Turkey’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Turkey’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    //Modern Places
    DestinationModel(
      id : 5,
      name: "USA",
      category: CategoryType.Modern,
      days: 14,
      price: 800,
      imagesList: [
        "assets/images/category/modern/usa1.jpg",
        "assets/images/category/modern/usa2.jpg",
        "assets/images/category/modern/usa3.jpg",
      ],
      description: "USA"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring USA’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring USA’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 6,
      name: "Emirates",
      category: CategoryType.Modern,
      days: 10,
      price: 750,
      imagesList: [
        "assets/images/category/modern/emirates.jpg",
        "assets/images/category/modern/emirates2.jpg",
        "assets/images/category/modern/emirates3.png",
      ],
      description: "Emirates, the mesmerising jewel of Asia,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Emirates’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Emirates’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 7,
      name: "England",
      category: CategoryType.Modern,
      days: 9,
      price: 650,
      imagesList: [
        "assets/images/category/modern/england1.jpg",
        "assets/images/category/modern/engalnd2.jpeg",
        "assets/images/category/modern/england3.jpg",
        "assets/images/category/modern/england4.jpg",
      ],
      description: "England, the mesmerising jewel of Europe,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring England’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring England’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 8,
      name: "Russia",
      category: CategoryType.Modern,
      days: 8,
      price: 350,
      imagesList: [
        "assets/images/category/modern/russia1.jpg",
        "assets/images/category/modern/russia2.jpg",
        "assets/images/category/modern/russia3.jpg",
        "assets/images/category/modern/russia4.jpeg"
      ],
      description: "Russia, the mesmerising jewel of Europe,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Russia’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Russia’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 9,
      name: "Spain",
      category: CategoryType.Modern,
      days: 7,
      price: 600,
      imagesList: [
        "assets/images/category/modern/spain2.jpg",
        "assets/images/category/modern/spain1.jpg",
        "assets/images/category/modern/spain3.jpg",
      ],
      description: "Spain, the mesmerising jewel of Europe,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Spain’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Spain’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    //Special Places
    DestinationModel(
      id : 10,
      name: "Maldives",
      category: CategoryType.Special,
      days: 7,
      imagesList: [
        "assets/images/slider/maldives.jpg",
      ],
      description: "Maldives, the mesmerising jewel of the world,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Maldives  magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Maldives’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 11,
      name: "Japan",
      category: CategoryType.Special,
      days: 11,
      price: 580,
      imagesList: [
        "assets/images/category/special/japan2.jpg",
      ],
      description: "Japan, the mesmerising jewel of Asia,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring Japan’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring Japan’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 12,
      name: "India",
      category: CategoryType.Special,
      days: 10,
      price: 120,
      imagesList: [
        "assets/images/category/special/india_taj.jpg",
      ],
      description: "India, the mesmerising jewel of Asia,"
          " is a canvas where nature paints landscapes of unrivalled beauty"
          " and cities etch tales of rich history, culture, and exceptional cuisine — an alluring symphony that entices"
          " and captivates every discerning traveller."
          "At Travia, we craft unforgettable journeys that embrace the allure of this enchanting nation.",
      activities: [
        "Exploring India’s magnificent regions and their diverse landscapes on exclusive adventures.",
        "Enjoying the lap of luxury in carefully selected boutique accommodations.",
        "Savouring India’s gastronomic excellence in Awesome restaurants helmed by globally acclaimed chefs"
      ],
    ),
    DestinationModel(
      id : 13,
      name: "Everest",
      category: CategoryType.Special,
      days: 5,
      price: 450,
      imagesList: [
        "assets/images/slider/everest.jpg",
      ],
      description: "A unique experience of climbing Mount Everest,"
          " viewing stunning landscapes and spending an unforgettable adventure",
      activities: [
        "Climbing the Mountain and take great photos with friends",
        "delicious food on the surface of Everest"
      ],

    ),
    DestinationModel(
      id : 14,
      name: "Disneyland",
      category: CategoryType.Special,
      days: 6,
      price: 780,
      imagesList: [
        "assets/images/slider/disenyland.jpg",
      ],
      description: "Spend a good time on the biggest and wonderful land,"
          " play special games and take incredible photos",
      activities: [
      "Exploring Disneyland’s magnificent regions and their diverse landscapes on exclusive adventures.",
      "Enjoying the lap of luxury in carefully selected boutique accommodations.",
      ],
    ),
    DestinationModel(
      id : 15,
      name: "Ocean trip",
      category: CategoryType.Special,
      days: 25,
      price: 1200,
      imagesList: [
        "assets/images/slider/sea1.jpg",
      ],
      description: "will discover a lot about the secrets of the ocean with "
          "an unforgettable experience",
      activities: [
        "Exploring ocean’s magnificent regions and their sharks and fishes and a lot of Aquatic animals",
        "Enjoying the travelling on a fantastic ships.",
        "Enjoy sumptuous seafood"
      ],
    ),

  ];
  List<DestinationModel> categoryList = [];
  String? categoryName = "";

  void showCategory(CategoryType type)
  {
    categoryList.clear();
    categoryList= destinationList.where((element) => element.category == type).toList();
    if(type == CategoryType.Ancient) {
        categoryName = "Ancient";
      }else if(type == CategoryType.Modern) {
      categoryName = "Modern";
        }else if(type == CategoryType.Special) {
      categoryName = "Special";
    }
    emit(ShowCatSuccessState());

  }


  //Search Side
  List<DestinationModel> searchList = [];
  TextEditingController searchController = TextEditingController();
  void search(String value)
  {
    searchList.clear();
    emit(DestinationSearchLoadingState());

    for(var i in destinationList)
    {
      if((i.name??"").trim().toLowerCase().contains(value.trim().toLowerCase()))
      {
        searchList.add(i);
      }
    }
    emit(DestinationSearchSuccessState());
  }

  //Trip Side
  //Dot Indicator

int currentIndexImage = 0;
  PageController imageController = PageController();
  void changeIndexImageValue(int value){
    currentIndexImage = value;
    emit(ChangeIndexSuccessState());
  }

  //Trip Details
DestinationModel? tripModel;
  void getTripDetails(int id){
    tripModel = null;
    emit(GetTripDetailLoadingState());
    for(var i in destinationList)
      {
        if(i.id == id)
          {
            tripModel = i;
          }
      }
    emit(GetTripDetailSuccessState());

  }



}