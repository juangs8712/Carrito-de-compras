import 'package:bloc/bloc.dart';
import 'package:compras/models/product_model.dart';
import 'package:compras/providers/product_provider.dart';
import 'package:meta/meta.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super( 
      const ProductState( items: [], skip: 0, total: 0, loading: true)) {

    on<ProductErrorEvent>      ( _onProductEventError );
    on<ProductClearErrorEvent> ( _onProductClearErrorEvent );
    on<ProductLoadingEvent>    ( _onProductLoadingEvent );
    on<ProductGetListEvent>    ( _onProductGetListEvent );
    on<ProductGetByCatEvent>   ( _onProductGetByCatEvent );
    on<ProductSearchEvent>     ( _onProductSearchEvent );
    on<ProductForwardEvent>    ( _onProductForwardEvent );
    on<ProductBackwardEvent>   ( _onProductBackwardEvent );
    
    add( ProductGetListEvent() );
  }
  // -----------------------------------------------------
    _onProductEventError( ProductErrorEvent event, Emitter<ProductState> emit){
      emit(ProductStateError( event.error ));
    }
  // -----------------------------------------------------
  _onProductClearErrorEvent( ProductClearErrorEvent event, Emitter<ProductState> emit ){
    emit( const ProductState() );
  }
  // -----------------------------------------------------
  _onProductLoadingEvent( ProductLoadingEvent event, Emitter<ProductState> emit ){
    emit( state.copyWith( loading: event.loading ) );
  }
  // -----------------------------------------------------
  _onProductGetListEvent( ProductGetListEvent event, Emitter<ProductState> emit ) async {
    try {
      // indicar que se esta cargando los productos.
      emit( state.copyWith( loading: true ) );

      final queryParameters = { 
        'skip' : state.skip.toString(),
        'limit': '10' 
      };

      final response = await ProductProvider.readProducts(
        path: '',
        queryParameters: queryParameters );

      // print( response['products'][0].toJson() );

      emit( state.copyWith( 
        items: response['products'], 
        total: response['total'],
        category: defaultCat,
        loading: false ));
    } catch (e) {
      emit( ProductStateError( e.toString() ));
    }
  }
  // -----------------------------------------------------
  _onProductGetByCatEvent( ProductGetByCatEvent event, Emitter<ProductState> emit ) async {
    try {
      if ( event.category == 'Todos' ) {
        add( ProductGetListEvent() );
        return;
      }

      // indicar que se estan cargando los productos.
      final skip = event.category == state.category ? state.skip : 0;

      emit( state.copyWith( loading: true, skip: skip ) );

      final queryParameters = { 
        'skip' : skip.toString(),
        'limit': '10' 
      };

      final response = await ProductProvider.readProducts(
        path: 'category/${event.category.toLowerCase()}',
        queryParameters: queryParameters );

      emit( state.copyWith( 
        items: response['products'], 
        total: response['total'],
        category: event.category,
        loading: false ));
    } catch (e) {
      emit( ProductStateError( e.toString() ));
    }
  }
  // -----------------------------------------------------
  _onProductSearchEvent( ProductSearchEvent event, Emitter<ProductState> emit ) async {
    try {
      if ( event.search.isEmpty ) {
        add( ProductGetListEvent() );
        return;
      }

      // indicar que se estan cargando los productos.
      emit( state.copyWith( loading: true ) );
      final skip = state.search != event.search
        ? 0 : state.skip;

      final queryParameters = { 
        'q': event.search,
        'skip' : skip.toString(),
        'limit': '10'
      };

      final response = await ProductProvider.readProducts(
        path: 'search',
        queryParameters: queryParameters );

      emit( state.copyWith( 
        items: response['products'], 
        total: response['total'],
        skip: skip,
        search: event.search,
        loading: false ));
    } catch (e) {
      emit( ProductStateError( e.toString() ));
    }
  }
  // -----------------------------------------------------
  _onProductForwardEvent( ProductForwardEvent event, Emitter<ProductState> emit ){
    final int skip = state.skip + 10;
    if ( skip > state.total ) return;

    emit( state.copyWith( skip: skip ));
    if ( state.search.isNotEmpty ) {
      add( ProductSearchEvent( state.search ) );
    }else {
      add( ProductGetByCatEvent( state.category ) );
    }
  }
  // -----------------------------------------------------
  _onProductBackwardEvent( ProductBackwardEvent event, Emitter<ProductState> emit ){
    final int skip = state.skip - 10;

    emit( state.copyWith( skip: skip < 0 ? 0 : skip ));
    if ( state.search.isNotEmpty ) {
      add( ProductSearchEvent( state.search ) );
    }else {
      add( ProductGetByCatEvent( state.category ) );
    }
  }
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
