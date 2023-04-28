

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

import 'package:compras/api/shopping_car_api.dart';
import 'package:compras/models/product_model.dart';

class ProductProvider{
  static const rootPath = '/products';

  // -----------------------------------------------------
  /// Obtener el listado de productos disponibles.
  /// 
  /// Función para obtener el listado de productos disponibles. Si ocurre algún error
  /// la función lanza un excepción, de lo contrario retorna un map con los siguientes pares clave-valor:
  /// {
  ///   'total' : total,
  ///   'products' : List<Product>
  /// }
  static Future<Map<String, dynamic>> readProducts({
    required String path,
    required  Map<String, String> queryParameters 
  }) async {
  
    final urlPath = '$rootPath/$path';
    final response = await ShoppingApi.read( urlPath, queryParameters );
    final Map<String, dynamic> body = response['body'];

    // Si la peticion no tuvo exito, lanzar un mensaje de error.
    if ( response['statusCode'] != 200 ) {
      throw ShoppingApi.getErrorString( body ) ?? '';
    }

    final items = body['products'].cast<Map<String, dynamic>>();
    final products = items.map<Product>((json) => Product.fromJson( json )).toList();

    // await Future.delayed( Duration( milliseconds: 2000 ));
    return {
      'total'    : body['total'],
      'skip'     : body['skip'],
      'limit'    : body['limit'],
      'products' : products
    }; 
  }
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
