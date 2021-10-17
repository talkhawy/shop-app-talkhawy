class CategoriesModel{
  String? name;
  String? avatar;
  CategoriesModel.fromjson(Map<dynamic,dynamic> map){
    this.name=map["name"];
    this.avatar=map["avatar"];
  }


}