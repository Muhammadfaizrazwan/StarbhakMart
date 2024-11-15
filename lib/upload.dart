import 'package:flutter/material.dart';
import 'package:starbhakmart/add.dart';
import 'package:starbhakmart/home.dart';

void main() {
  runApp(const Upload());
}

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Map<String, dynamic>> products = [
    {
      'image': 'image/burger.jpg', // replace with your image asset path
      'name': 'Burger King Medium',
      'price': 50000,
    },
    {
      'image': 'image/burger.jpg', // replace with your image asset path
      'name': 'Teh Botol',
      'price': 4000,
    },
    {
      'image': 'image/minuman.jpg', // replace with your image asset path
      'name': 'Burger King Small',
      'price': 35000,
    },
  ];

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Add user action here
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Add()),
                );
              },
              child: const Text('Add Data +'),
          ),
            
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      products[index]['image'],
                      width: 50,
                      height: 50,
                    ),
                    title: Text(products[index]['name']),
                    subtitle: Text(
                      'Rp.${products[index]['price'].toStringAsFixed(0)},00',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteProduct(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
