import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2020130016/cartitem.dart';
import 'package:uts_2020130016/cartprovider.dart';
import 'package:uts_2020130016/cartscreen.dart';
import 'package:uts_2020130016/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen(this.product, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _quantityController =
      TextEditingController(text: '1');

  void _addToCart(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final product = widget.product;
    final productQuantity = int.tryParse(_quantityController.text) ?? 1;
    final cartItem = CartItem(
      imagePath: product.imagePath,
      productName: product.name,
      productPrice: product.price,
      productQuantity: productQuantity,
    );
    cartProvider.addToCart(cartItem);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final quarterScreenHeight = screenHeight / 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 233, 87, 147),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth,
            height: quarterScreenHeight,
            color: Colors.transparent,
            child: Image.asset(
              widget.product.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Rp ${widget.product.price.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.product.description,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: screenWidth,
            height: screenHeight / 10,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 2.0, color: Colors.black)),
              color: Color.fromARGB(255, 233, 87, 147),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (screenWidth - 60) / 2,
                  color: Colors.transparent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                int currentValue =
                                    int.tryParse(_quantityController.text) ?? 1;
                                if (currentValue > 1) {
                                  _quantityController.text =
                                      (currentValue - 1).toString();
                                }
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Color.fromARGB(255, 218, 12, 129),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                controller: _quantityController,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                int currentValue =
                                    int.tryParse(_quantityController.text) ?? 1;
                                _quantityController.text =
                                    (currentValue + 1).toString();
                              },
                              child: const Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 218, 12, 129),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 2 - 30,
                  color: Colors.transparent,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size(double.infinity, double.infinity),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 218, 12, 129),
                      ),
                      onPressed: () {
                        _addToCart(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(
                              imagePath: widget.product.imagePath,
                              productName: widget.product.name,
                              productPrice: widget.product.price,
                              productQuantity:
                                  int.tryParse(_quantityController.text) ?? 1,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
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
