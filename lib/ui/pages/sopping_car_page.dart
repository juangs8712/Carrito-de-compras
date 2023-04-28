import 'package:compras/ui/pages/shopping_car_widgets/shopping_car_footer.dart';
import 'package:flutter/material.dart';

import 'package:compras/ui/pages/shopping_car_widgets/shopping_car_header.dart';

import 'package:compras/ui/pages/shopping_car_widgets/shopping_list_widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingCarPage extends StatelessWidget {
  const ShoppingCarPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: const [
            // encabezado de la vista
            ShoppingCarHeader(),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric( horizontal: 20, vertical: 5),
                child: ShoppingListWidget(),
              )),
            
            ShoppingCarFooter()
          ],
        ),
      ),
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~