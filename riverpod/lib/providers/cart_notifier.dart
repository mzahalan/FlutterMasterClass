
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // Initial Value
  @override
  Set<Product> build() {
    return const {
    };
  }

  //Methods to update Values
  void addProduct(Product product) {
    if(!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if(state.contains(product)) {
      state = {...state}..remove(product);
    }
  }
}

@riverpod
int cartTotal(ref) {
  final cart = ref.watch(cartNotifierProvider);
  return cart.fold(0, (total, product) => total + product.price);
}

