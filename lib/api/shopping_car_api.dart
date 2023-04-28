import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import 'package:mime_type/mime_type.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingApi{

  static final _client = http.Client();
  // static const String base = 'localhost:8080';
  static const String base = 'dummyjson.com';

  // -----------------------------------------------------
  /// Realizar una petición http.get.
  static Future<Response> getResponse( String path, [ Map<String, dynamic>? queryParameters ] ) async{
    try {      
      final url = getUri( path, queryParameters );
      final resp = await _client.get( url, headers: _getHeaders );
      
      return resp;
    } catch (e) {
      throw ( e.toString() );
    }
  }
  // -----------------------------------------------------
  /// Realizar una petición http.get.
  /// 
  /// [path] - Path de la ruta al cual se le va a realizar la petición http.
  /// 
  /// [queryParameters] - Opcional. Query a enviar en los parámetros en caso de que sea necesario.
  ///  
  /// La funcion devuelve un Map<String, dynamic> con las claves [statusCode], [body], [errorMsg].
  /// 
  /// response = { 
  /// 
  /// 'statusCode' : 'xxx', 
  /// 
  /// 'body' : 'contenido-del-body-de-la-respuesta', 
  /// 
  /// 'errorMsg' : 'Error-si-algo-falló' 
  /// 
  /// }.
  static Future<Map<String, dynamic>> read( String path, [ Map<String, dynamic>? queryParameters ] ) async{
    try {      
      final url = getUri( path, queryParameters );
      
      // realizacion la peticion
      final resp = await _client.get( url, headers: _getHeaders );
      
      // decodificar la resouesta y retornar la misma
      return _decodeResponse( resp );
    } catch (e) {
      throw ( e.toString() );
    }
  }
  // -----------------------------------------------------
  /// Realizar una petición http.post.
  /// 
  /// [path] - Path de la ruta al cual se le va a realizar la petición http.
  /// 
  /// [body] - Mapa con la informacion a enviar el body de la request.
  /// 
  /// La funcion devuelve un Map<String, dynamic> con las claves [statusCode], [body], [errorMsg].
  /// 
  /// response = { 
  /// 
  /// 'statusCode' : 'xxx', 
  /// 
  /// 'body' : 'contenido-del-body-de-la-respuesta', 
  /// 
  /// 'errorMsg' : 'Error-si-algo-falló' 
  /// 
  /// }.
  static Future<Map<String, dynamic>> post( String path, Map<String, dynamic> body ) async{
    try {
      final url = getUri( path );
      final resp = await _client.post( 
        url, 
        headers: _getHeaders,
        body: jsonEncode( body )
      );

      return _decodeResponse( resp );
    } catch (e) {
      // print( e );
      throw ( e.toString() );
    }
  }
  // -----------------------------------------------------
  /// Realizar una petición http.put.
  /// 
  /// [path] - Path de la ruta al cual se le va a realizar la petición http.
  /// 
  /// [body] - Mapa con la informacion a enviar el body de la request.
  /// 
  /// La funcion devuelve un Map<String, dynamic> con las claves [statusCode], [body], [errorMsg].
  /// 
  /// response = { 
  /// 
  /// 'statusCode' : 'xxx', 
  /// 
  /// 'body' : 'contenido-del-body-de-la-respuesta', 
  /// 
  /// 'errorMsg' : 'Error-si-algo-falló' 
  /// 
  /// }.
  static Future<Map<String, dynamic>> put( String path, Map<String, dynamic> body ) async{
    try {
      final url = getUri( path );
      
      final resp = await _client.put( 
        url, 
        headers: _getHeaders,
        body: jsonEncode( body ));

      return _decodeResponse( resp );
    } catch (e) {
      // print( e );
      throw ( e.toString() );
    }
  }
  // -----------------------------------------------------
  /// Busca cualquier mensaje de error dentro de la response y 
  /// devuelve el mismo decodificado como un String.
  static String?  getErrorString ( Map<String, dynamic> resp ){
    final List<dynamic>? errors = resp['errors'];

    String? ans;
    String errorList = '';

    if ( errors != null ) {
      for (var element in errors) { 
        errorList += element['msg'] + '; ';
      }
      ans = errorList;
      
    }else {
      ans = resp['msg'];
    }

    return ans;
  }
  // -----------------------------------------------------
  static Map<String, dynamic> _decodeResponse( Response resp ){
    final response = <String, dynamic>{};
    final decodedBody = jsonDecode( resp.body );

    response['statusCode'] = resp.statusCode;
    response['body'] = decodedBody;
    response['errorMsg'] = getErrorString( decodedBody );
    
    return response;
  }
  // -----------------------------------------------------
  static Map<String, String> get _getHeaders => { 
    'Content-Type': 'application/json; charset=UTF-8'
  };
  // -----------------------------------------------------
  static Uri getUri(  String path, [ Map<String, dynamic>? queryParameters ] ){
    return Uri.https( base, path, queryParameters );
  }
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~