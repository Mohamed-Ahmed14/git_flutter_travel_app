class FavouriteModel{
  String? user_id;
  int? destination_id;

  FavouriteModel(this.user_id, this.destination_id);

  FavouriteModel.fromJson(Map<String,dynamic> json){
      user_id = json["user_id"];
      destination_id = json["destination_id"];
  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = new Map<String,dynamic>();
    data["user_id"]  = this.user_id;
    data["destination_id"]  = this.destination_id;
    return data;
  }

}