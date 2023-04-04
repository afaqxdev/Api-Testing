class ShoesModel {
  int? id;
  String? name;
  int? price;
  String? image;
  String? description;
  int? quantity;

  ShoesModel(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.description,
      this.quantity});

  ShoesModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    return data;
  }
}
