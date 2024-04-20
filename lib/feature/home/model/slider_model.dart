class SliderModel{
  String? imagePath;
  String? type;

  SliderModel({this.imagePath,this.type});
}
List<SliderModel> sliderList = [
  SliderModel(
    imagePath: "assets/images/slider/maldives.jpg",
    type: "Islands",
  ),
  SliderModel(
    imagePath: "assets/images/slider/everest.jpg",
    type: "Mountains",
  ),
  SliderModel(
    imagePath: "assets/images/slider/sea3.jpg",
    type: "Seas",
  ),
  SliderModel(
    imagePath: "assets/images/slider/liverpool.jpeg",
    type: "coastal",
  ),
  SliderModel(
    imagePath: "assets/images/slider/ancient.jpeg",
    type: "Historical",
  ),
  SliderModel(
    imagePath: "assets/images/slider/colombia1.jpg",
    type: "Amazing",
  ),
  SliderModel(
    imagePath: "assets/images/slider/disenyland.jpg",
    type: "Entertainment",
  ),
];