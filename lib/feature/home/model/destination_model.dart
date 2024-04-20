import 'category_type.dart';

class DestinationModel{
  int? id;
  String? name;
  CategoryType? category;
  int? days;
  int? price;
  String? description;
  List<String>? activities=[];
  List<String>? imagesList = [];

  DestinationModel({this.id,this.name,this.category,this.imagesList,
  this.days,this.description,this.activities,this.price});
}




