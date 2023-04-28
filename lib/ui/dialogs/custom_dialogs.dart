import 'package:compras/services/navigation_service.dart';
import 'package:flutter/material.dart';


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  /// Implementa diálogos básicos como SimpleDialog, AlertDialog y ShowSnackBar.
class CustomDialogs{

// -----------------------------------------------------
  /// Muestra un dialogo de tipo AlertDialog.
  static Future<void> dialogBuilder({
    required Widget content,
    Widget? title,
    List<Widget>? actions,
    bool barrierDismissible = true,
    EdgeInsetsGeometry? contentPadding
  }) {

    final context = NavigationService.navigatorKey.currentContext!;

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog( 
          title: title,
          content: content,
          actions: actions,
          contentPadding: contentPadding,
          titleTextStyle: const TextStyle( 
              color: Colors.black, 
              fontSize: 16,
              fontWeight: FontWeight.bold ),
          contentTextStyle: const TextStyle( 
              color: Colors.black, 
              fontSize: 14 ),
        );
      },
    );
  }
  // -----------------------------------------------------
  /// Muestra un diálogo de error.
  static Future<void> dialogError({
    required Widget content,
    bool barrierDismissible = false,
    EdgeInsetsGeometry? contentPadding
  }) {

    final context = NavigationService.navigatorKey.currentContext!;

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog( 
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon( Icons.error_outline, color: Colors.red,),
                  SizedBox( width: 10,),
                  Text( 'Error!' )
                ],
              ),
              const Divider()
            ],
          ),
          content: SizedBox(
            width: 450,
            child: content),
          actions: [
            TextButton(
              onPressed: ()=>NavigationService.pop(), 
              child: const Padding(
                padding:  EdgeInsets.symmetric( vertical: 5, horizontal: 5 ),
                child: Text('Aceptar'),
              ))
          ],
          contentPadding: contentPadding,
          titleTextStyle: const TextStyle( 
            color: Colors.black, 
            fontSize: 16,
            fontWeight: FontWeight.bold ),
          contentTextStyle: const TextStyle( 
            color: Colors.black, 
            fontSize: 14 ),
        );
      },
    );
  }
  // -----------------------------------------------------
    /// Lanza un cuadro de dialogo que muestra un
    /// listado de opciones a seleccionar.
  static Future<String?> simpleDialogBuilder({ 
    required Map<String, String> optionList ,
    Widget? title,
  })async {
    
    final context = NavigationService.navigatorKey.currentContext!;

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {

        return SimpleDialog(
          title: title,
          children: optionList.keys.map(( key ) 
            => SimpleDialogOption(
              onPressed: () => Navigator.pop( context, optionList[ key ]),
              child: Text( key, style: const TextStyle(
                color: Colors.black )))
          ).toList(),
        );
      }
    );
  }

  // -----------------------------------------------------
  static Future<void> customSnackbar( {
    required Widget content,
    SnackBarAction? action
  } ) async{

    final context = NavigationService.navigatorKey.currentContext!;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content, 
      duration: const Duration(milliseconds: 4000 ),
      action: action ));
  }
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~