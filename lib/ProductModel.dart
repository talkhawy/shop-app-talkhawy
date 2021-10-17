class product{
  String? name;
  String? description;
  int? price;
  String? image;
  String?title;

  product.fromjson(Map<dynamic,dynamic> map ){
    this.name=map["name"];
    this.description=map["description"];
    this.price=map["price"];
    this.image=map["avatar"];
    this.title=map["title"];

  }
}