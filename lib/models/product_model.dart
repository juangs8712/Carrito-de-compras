// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Product {
  // -----------------------------------------------------
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
    required this.discountPercentage,
  });
  // -----------------------------------------------------

  final int    id;
  final String title;
  final String description;
  final int    price;
  final double rating;
  final int    stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
  final double? discountPercentage;

  // -----------------------------------------------------
  Product copyWith({
    int?    id,
    String? title,
    String? description,
    int?    price,
    double? rating,
    int?    stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
    double? discountPercentage,
  }) => 
    Product(
      id:          id          ?? this.id,
      title:       title       ?? this.title,
      description: description ?? this.description,
      price:       price       ?? this.price,
      rating:      rating      ?? this.rating,
      stock:       stock       ?? this.stock,
      brand:       brand       ?? this.brand,
      category:    category    ?? this.category,
      thumbnail:   thumbnail   ?? this.thumbnail,
      images:      images      ?? this.images,
      discountPercentage: discountPercentage ?? this.discountPercentage,
    );
  // -----------------------------------------------------

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id:          json["id"],
    title:       json["title"],
    description: json["description"],
    price:       json["price"],
    rating:      json["rating"]?.toDouble(),
    stock:       json["stock"],
    brand:       json["brand"],
    category:    json["category"],
    thumbnail:   json["thumbnail"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    images: List<String>.from(json["images"].map((x) => x)),
  );
  // -----------------------------------------------------

  Map<String, dynamic> toJson() => {
    "id":          id,
    "title":       title,
    "description": description,
    "price":       price,
    "rating":      rating,
    "stock":       stock,
    "brand":       brand,
    "category":    category,
    "thumbnail":   thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
    "discountPercentage": discountPercentage,
  };
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~