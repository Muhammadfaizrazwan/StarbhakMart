import 'package:flutter/material.dart';
import 'package:starbhakmart/cart.dart';
import 'package:starbhakmart/upload.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(), 
      theme: ThemeData(
        primarySwatch: Colors.blue,
       
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {}, 
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          
          const Padding (
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryItem(
                  icon: Icons.fastfood,
                  label: 'All',
                  color: Colors.blue,
                ),
                CategoryItem(
                  icon: Icons.lunch_dining,
                  label: 'Makanan',
                  color: Colors.white,
                ),
                CategoryItem(
                  icon: Icons.local_drink,
                  label: 'Minuman',
                  color: Colors.white,
                ),
              ],
            ),
          ),
          
          
Expanded(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: const [
        ProductCard(
          image: 'image/burger.jpg', 
          name: 'Burger King Medium',
          price: 'Rp. 50.000,00',
        ),
        ProductCard(
          image: 'image/burger.jpg',
          name: 'Burger King Medium',
          price: 'Rp. 50.000,00',
        ),
        ProductCard(
          image: 'image/burger.jpg',
          name: 'Burger King Medium',
          price: 'Rp. 50.000,00',
        ),
        ProductCard(
          image: 'image/minuman.jpg',
          name: 'Teh Botol',
          price: 'Rp. 4.000,00',
        ),
        ProductCard(
          image: 'image/minuman.jpg',
          name: 'Teh Botol',
          price: 'Rp. 4.000,00',
        ),
        ProductCard(
          image: 'image/minuman.jpg',
          name: 'Teh Botol',
          price: 'Rp. 4.000,00',
        ),
        ProductCard(
          image: 'image/minuman.jpg',
          name: 'Teh Botol',
          price: 'Rp. 4.000,00',
        ),
        ProductCard(
          image: 'image/minuman.jpg',
          name: 'Teh Botol',
          price: 'Rp. 4.000,00',
        ),
        
      ],
    ),
  ),
),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Orders',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
          }
          if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Upload()));
          }
        }
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, size: 30, color: color == Colors.blue ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(image), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.green),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
