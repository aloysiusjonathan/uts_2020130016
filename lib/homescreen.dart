import 'package:flutter/material.dart';
import 'package:uts_2020130016/cartscreen.dart';
import 'package:uts_2020130016/loginscreen.dart';
import 'package:uts_2020130016/product.dart';
import 'package:uts_2020130016/productscreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product('BAILU ACRYLIC KEYCHAIN', 'assets/images/produk0.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Bailu

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('DANHENG ACRYLIC KEYCHAIN', 'assets/images/produk1.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Dan Heng

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('JING YUAN ACRYLIC KEYCHAIN', 'assets/images/produk2.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Jing Yuan

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('HERTA ACRYLIC KEYCHAIN', 'assets/images/produk3.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Herta

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('SEELE ACRYLIC KEYCHAIN', 'assets/images/produk4.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Seele

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('KAFKA ACRYLIC KEYCHAIN', 'assets/images/produk5.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Kafka

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('HIMEKO ACRYLIC KEYCHAIN', 'assets/images/produk6.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Himeko

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('BRONYA ACRYLIC KEYCHAIN', 'assets/images/produk7.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Bronya

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('CAELUS ACRYLIC KEYCHAIN', 'assets/images/produk8.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Caelus

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
    Product('SILVER WOLF ACRYLIC KEYCHAIN', 'assets/images/produk9.jpg', 20000.0,
        '''Condition: New
Minimum Order: 1 piece
Display: Honkai Star Rail Keychain
Keychain Honkai Star Rail Silver Wolf

White Sided
Size: Approx. 6cm
Material: Acrylic
Double Acrylic'''),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 233, 87, 147),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 12, 129),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text(
                'Our Products',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 20, bottom: 20),
            child: Text(
              'Our Products',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(20.0),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              children: List.generate(products.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(products[index]),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Image.asset(
                        products[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(
                imagePath: 'path/to/image.jpg',
                productName: 'Nama Produk',
                productPrice: 100.0,
                productQuantity: 1,
              ),
            ),
          );
        },
        tooltip: 'Shopping Cart',
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 233, 87, 147),
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.white,
    );
  }
}
