class OrderModel{
  String? user_name;
  String? user_email;
  String? user_phone;
  String? user_city;
  int? destination_id;
  String? destination_name;
  String? destination_image;
  int? destination_price;
  int? days;
  String? travel_date;
  int? no_tickets;
  int? total_price;


  OrderModel(
      this.user_name,
      this.user_email,
      this.user_phone,
      this.user_city,
      this.destination_id,
      this.destination_name,
      this.destination_image,
      this.destination_price,
      this.days,
      this.travel_date,
      this.no_tickets,
      this.total_price);
  OrderModel.fromJson(Map<String,dynamic> json){
    user_name = json["user_name"];
    user_email = json["user_email"];
    user_phone = json["user_phone"];
    user_city = json["user_city"];
    destination_id = json["destination_id"];
    destination_name = json["destination_name"];
    destination_image = json["destination_image"];
    destination_price = json["destination_price"];
    travel_date = json["travel_date"];
    no_tickets = json["no_tickets"];
    total_price = json["total_price"];
    days = json["days"];


  }
}