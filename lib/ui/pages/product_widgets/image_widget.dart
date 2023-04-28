import 'package:cached_network_image/cached_network_image.dart';
import 'package:compras/ui/dialogs/custom_dialogs.dart';
import 'package:flutter/material.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    this.imageUrl,
    this.width, 
    this.height,
    this.margin,
    this.decoration,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: decoration ?? _buildDecoration(),
      margin: margin ?? const EdgeInsets.symmetric( horizontal: 5, vertical: 10 ),

      child: imageUrl == null 
        ? Image.asset( 
            'assets/placeholder.png',
            width: width,
            height: height,)
        
        : CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl!,
            placeholder: (_, url) => Image.asset( 'assets/jar-loading.gif' ),
            errorWidget: (context, url, error) {
              Future.delayed( Duration.zero, ()=>  
                CustomDialogs.dialogError(content: Text( error.toString())) );

              return SizedBox.expand(
                child: Image.asset( 
                  'assets/placeholder.png',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,),
              );
            }
          )
    );
  }
  // -----------------------------------------------------
  BoxDecoration _buildDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular( 10 ),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset( 1, 1 ),
        blurRadius: 2
      )
    ]
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
