// To parse this JSON data, do
//
//     final shoppingProduct = shoppingProductFromJson(jsonString);

import 'dart:convert';

import 'package:compras/models/product_model.dart';

ShoppingProduct shoppingProductFromJson(String str) => ShoppingProduct.fromJson(json.decode(str));

String shoppingProductToJson(ShoppingProduct data) => json.encode(data.toJson());

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingProduct {
  final Product product;
  final int quantity;
  // -----------------------------------------------------
  ShoppingProduct({
    required this.product,
    required this.quantity,
  });
  // -----------------------------------------------------
  ShoppingProduct copyWith({
    Product? product,
    int? quantity,
  }) => 
    ShoppingProduct(
      product:  product  ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  // -----------------------------------------------------
  factory ShoppingProduct.fromJson(Map<String, dynamic> json) => ShoppingProduct(
    product: json["product"],
    quantity: json["quantity"],
  );
  // -----------------------------------------------------
  Map<String, dynamic> toJson() => {
    "product": product,
    "quantity": quantity,
  };
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~