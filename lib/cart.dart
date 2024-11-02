import 'package:flutter/material.dart';
import 'package:starbhakmart/main.dart';

void main() {
  runApp(const Cart());
}

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cart',
      home: CartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int burgerKingMediumQuantity = 1;
  int teBotolQuantity = 1;
  int burgerKingSmallQuantity = 1;

  Widget _buildSummaryRow(String label, String amount, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
      ],
    );
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
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
        ),
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CartItem(
              imageUrl: 'image/burger.jpg',
              name: 'Burger King Medium',
              price: 50000.00,
              quantity: burgerKingMediumQuantity,
              onQuantityChanged: (value) {
                setState(() {
                  burgerKingMediumQuantity = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            CartItem(
              imageUrl: 'image/minuman.jpg',
              name: 'Teh Botol',
              price: 4000.00,
              quantity: teBotolQuantity,
              onQuantityChanged: (value) {
                setState(() {
                  teBotolQuantity = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            CartItem(
              imageUrl: 'image/burger.jpg',
              name: 'Burger King Small',
              price: 35000.00,
              quantity: burgerKingSmallQuantity,
              onQuantityChanged: (value) {
                setState(() {
                  burgerKingSmallQuantity = value;
                });
              },
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryRow('PPN 11%', 'Rp 10.000,00'),
                  _buildSummaryRow('Total Belanja', 'Rp 94.000,00'),
                  const SizedBox(height: 8),
                  _buildSummaryRow('Total Pembayaran', 'Rp 104.000,00', bold: true),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyApp()),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double price;
  final int quantity;
  final Function(int) onQuantityChanged;

  const CartItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          widget.imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Rp ${widget.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (widget.quantity > 1) {
                  widget.onQuantityChanged(widget.quantity - 1);
                }
              },
              icon: const Icon(Icons.remove),
            ),
            Text(
              '${widget.quantity}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            IconButton(
              onPressed: () {
                widget.onQuantityChanged(widget.quantity + 1);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
