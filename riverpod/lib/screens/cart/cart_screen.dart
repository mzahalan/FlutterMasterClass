import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_notifier.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;


  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final cartTotal = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                return Dismissible(
                  key: ValueKey(product.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    ref.read(cartNotifierProvider.notifier).removeProduct(product);
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(children: [
                      Image.asset(product.image, height: 60, width: 60,),
                      const SizedBox(width: 10),
                      Text('${product.title}...'),
                      Expanded(child: const SizedBox()),
                      Text('\$${product.price}'),
                    ],),
                  
                  ),
                );
              }).toList(), // output cart products here
            ),

            // output totals here
            Text('Total: \$${cartTotal.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}