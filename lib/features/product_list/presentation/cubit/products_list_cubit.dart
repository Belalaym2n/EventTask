import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/ProductModel.dart';
import '../../domain/use_cases/product_list_use_case.dart';

part 'products_list_state.dart';

@injectable
class ProductsListCubit extends Cubit<ProductsListState> {
  ProductListUseCase productsListUseCase;

  ProductsListCubit(this.productsListUseCase) :
        super(ProductsListInitial());

  static ProductsListCubit get(context) => BlocProvider.of(context);

  void getProducts() async {
    print("belal loading ");
    emit(ProductsLoadingState());
    print("belal loading 323");

    var result = await productsListUseCase.call();
    result.fold((l) {
      print("belal fa ${l.message} ");

      emit(ProductsFailureState(

         failures: l ));
    }, (r) {
      print("belal succ ");

      emit(ProductsSuccessState(

          productsList: r));
    });
  }
}
