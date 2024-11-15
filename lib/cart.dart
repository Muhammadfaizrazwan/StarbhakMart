import 'package:flutter/material.dart';
import 'package:starbhakmart/home.dart';

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
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int burgerKingMediumQuantity = 1;
  int teBotolQuantity = 1;
  int burgerKingSmallQuantity = 1;

  double burgerKingMediumPrice = 5000;
  double teBotolPrice = 2000;
  double burgerKingSmallPrice = 10000;
  double taxRate = 0.11; // 11%

  // Fungsi untuk menghitung PPN
  double _calculateTax(double subtotal) {
    return subtotal * taxRate;
  }

  // Fungsi untuk menghitung total pembayaran
  double _calculateTotalPayment() {
    double subtotal = (burgerKingMediumQuantity * burgerKingMediumPrice) +
                      (teBotolQuantity * teBotolPrice) +
                      (burgerKingSmallQuantity * burgerKingSmallPrice);
  double tax = _calculateTax(subtotal);
  return subtotal + tax;
}

  void _removeItem(String itemName) {
    setState(() {
      if (itemName == 'Burger King Medium') {
        burgerKingMediumQuantity = 0;
      } else if (itemName == 'Teh Botol') {
        teBotolQuantity = 0;
      } else if (itemName == 'Burger King Small') {
        burgerKingSmallQuantity = 0;
      }
    });
  }

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
    double subtotal = (burgerKingMediumQuantity * burgerKingMediumPrice) +
                      (teBotolQuantity * teBotolPrice) +
                      (burgerKingSmallQuantity * burgerKingSmallPrice);
    double tax = _calculateTax(subtotal);
    double totalPayment = subtotal + tax;

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
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (burgerKingMediumQuantity > 0)
              CartItem(
                imageUrl: 'image/burger.jpg',
                name: 'Burger King Medium',
                price: burgerKingMediumPrice,
                quantity: burgerKingMediumQuantity,
                onQuantityChanged: (value) {
                  setState(() {
                    burgerKingMediumQuantity = value;
                  });
                },
                onDelete: () => _removeItem('Burger King Medium'),
              ),
            const SizedBox(height: 16.0),
            if (teBotolQuantity > 0)
              CartItem(
                imageUrl: 'image/minuman.jpg',
                name: 'Teh Botol',
                price: teBotolPrice,
                quantity: teBotolQuantity,
                onQuantityChanged: (value) {
                  setState(() {
                    teBotolQuantity = value;
                  });
                },
                onDelete: () => _removeItem('Teh Botol'),
              ),
            const SizedBox(height: 16.0),
            if (burgerKingSmallQuantity > 0)
              CartItem(
                imageUrl: 'image/burger.jpg',
                name: 'Burger King Small',
                price: burgerKingSmallPrice,
                quantity: burgerKingSmallQuantity,
                onQuantityChanged: (value) {
                  setState(() {
                    burgerKingSmallQuantity = value;
                  });
                },
                onDelete: () => _removeItem('Burger King Small'),
              ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryRow('PPN 11%', 'Rp ${taxRate.toStringAsFixed(2)}'),
                  _buildSummaryRow('Total Belanja', 'Rp ${subtotal.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  _buildSummaryRow('Total Pembayaran', 'Rp ${totalPayment.toStringAsFixed(2)}', bold: true),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
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
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  @override
  State<CartItem> createState() => _CartItemState();
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
            IconButton(
              onPressed: widget.onDelete,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
