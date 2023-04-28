part of 'product_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
const String defaultCat = 'Todos';
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@immutable
class ProductState {
  final List<Product> items;
  final bool loading;
  final int  skip;
  final int  total;
  final String category;
  final String search;

  // -----------------------------------------------------
  const ProductState({ 
    this.items    = const [],  
    this.loading  = false,  
    this.skip     = 0,  
    this.total    = 0,
    this.category = defaultCat,
    this.search   = '', 
  } );
  
  // -----------------------------------------------------
  ProductState copyWith({
    List<Product>? items, 
    int?    skip, 
    int?    total, 
    bool?   productState, 
    bool?   loading ,
    String? category,
    String? search,
  }) => ProductState( 
      items:    items    ?? this.items, 
      skip:     skip     ?? this.skip,
      total:    total    ?? this.total,
      loading:  loading  ?? this.loading,
      category: category ?? this.category,
      search:   search   ?? this.search );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ProductStateError extends ProductState {
  final String error;

  const ProductStateError( this.error );
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
