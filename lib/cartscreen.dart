import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2020130016/cartitem.dart';
import 'package:uts_2020130016/cartprovider.dart';
import 'package:uts_2020130016/homescreen.dart';

class CartScreen extends StatefulWidget {
  final String imagePath;
  final String productName;
  final double productPrice;
  final int productQuantity;

  const CartScreen({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String calculateTotalPrice(List<CartItem> cartItems) {
    double total = 0;
    for (var cartItem in cartItems) {
      total += cartItem.productPrice * cartItem.productQuantity;
    }
    return total.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: false);

    void onPressedRemoveItem(CartItem cartItem) {
      setState(() {
        cartProvider.removeFromCart(cartItem);
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 233, 87, 147),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Cart',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey,
          ),
          Expanded(
            child: cartProvider.cartItems.isEmpty
                ? const Center(
                    child: Text(
                      '- Cart Empty -',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 50, 50, 50),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      var cartItem = cartProvider.cartItems[index];
                      return ListTile(
                        leading: Image.asset(cartItem.imagePath),
                        title: Text(cartItem.productName),
                        subtitle: Text(
                          'Rp ${cartItem.productPrice.toStringAsFixed(0)} x ${cartItem.productQuantity}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Rp ${(cartItem.productPrice * cartItem.productQuantity).toStringAsFixed(0)}',
                            ),
                            const SizedBox(width: 10.0),
                            IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Color.fromARGB(255, 218, 12, 129),
                              ),
                              onPressed: () {
                                onPressedRemoveItem(cartItem);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Colors.black),
              ),
              color: Color.fromARGB(255, 233, 87, 147),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  color: Colors.transparent,
                  child: Text(
                    'Total: Rp ${calculateTotalPrice(cartProvider.cartItems)}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 12, 129),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item(s) has been checked out'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Provider.of<CartProvider>(context, listen: false)
                            .clearCart();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
