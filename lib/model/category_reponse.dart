class CategoryResponse {
  bool? error;
  String? message;
  Data? data;

  CategoryResponse({this.error, this.message, this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? image;
  List<Category>? category;
  List<Products>? products;
  int? favouriteCount;
  int? cartCount;

  Data(
      {this.image,
      this.category,
      this.products,
      this.favouriteCount,
      this.cartCount});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    favouriteCount = json['favouriteCount'];
    cartCount = json['cartCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['favouriteCount'] = this.favouriteCount;
    data['cartCount'] = this.cartCount;
    return data;
  }
}

class Category {
  String? sId;
  String? title;
  String? image;

  Category({this.sId, this.title, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}

class Products {
  String? sId;
  String? title;
  String? brand;
  String? stockStatus;
  String? image;
  String? discount;
  int? price;
  int? splPrice;
  String? uom;
  String? varientId;

  Products(
      {this.sId,
      this.title,
      this.brand,
      this.stockStatus,
      this.image,
      this.discount,
      this.price,
      this.splPrice,
      this.uom,
      this.varientId});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    stockStatus = json['stockStatus'];
    image = json['image'];
    discount = json['discount'];
    price = json['price'];
    splPrice = json['spl_price'];
    uom = json['uom'];
    varientId = json['varientId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['brand'] = this.brand;
    data['stockStatus'] = this.stockStatus;
    data['image'] = this.image;
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['spl_price'] = this.splPrice;
    data['uom'] = this.uom;
    data['varientId'] = this.varientId;
    return data;
  }
}
