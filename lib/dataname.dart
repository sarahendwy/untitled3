import 'dart:convert';

class DataListModel{
  List<dynamic>? dataList;


  DataListModel.fromJson(Map<String, dynamic> json){
    dataList = [];
    json['data'].forEach((element) {
      dataList!.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  int? id;
  String? title;
  String? description;
  String? category;
  String? image;
  dynamic price;
  Rating? rating;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price= json['price'];
    title = json['title'];
    description = json['description'];
    category = json[' category'];
    image = json[' image'];
    rating= Rating.fromJson(json['rating']);
  }
}

class Rating{
  dynamic rate;
  int? count;

  Rating.fromJson(Map<String, dynamic>json){
    rate= json['rate'];
    count=json ['count'];
  }
}
