

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

import 'dart:convert';

import 'package:compras/api/shopping_car_api.dart';

class CategoryProvider{
  static const rootPath = '/products/categories';

  // -----------------------------------------------------
  /// Obtener el listado de categorias disponibles.
  /// 
  /// Función para obtener el listado de categorias en forma de una lista de Strings.
  static Future<List<String>> getCategories() async {
  
    try {
      final response = await ShoppingApi.getResponse( rootPath );
      final List<String> categories = jsonDecode( response.body ).cast<String>();
      
      // Si la peticion no tuvo exito, lanzar un mensaje de error.
      if ( response.statusCode != 200 ) {
        throw 'Error obteniendo categorías';
      }
      
      return categories; 
    } catch (e) {
      throw e.toString();
    }
  }
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
