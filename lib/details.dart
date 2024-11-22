import 'package:flutter/material.dart';
import 'data/Database.dart';
import 'model/product.dart';

class DetailsPage extends StatelessWidget {
  final int productId;

  const DetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // Fetch the product based on the id
    final item = Database.products.firstWhere((item) => item.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.deepPurple,
        elevation: 0, // Removed shadow for a cleaner look
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with rounded corners and shadow effect
              SizedBox(
                height: 320,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Material(
                    elevation: 6, // Shadow effect to give depth
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Product Name with a custom font style and color
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 1.2, // Slight letter spacing for elegance
                ),
              ),
              const SizedBox(height: 8),

              // Product Price with a color gradient effect
              Container(

                child: Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Section for the Description Title
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              // Product Description with better readability
              Text(
                item.description,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Decorative Horizontal Line to separate sections
              const Divider(
                color: Colors.grey,
                thickness: 1.2,
              ),
              const SizedBox(height: 20),

              // Custom Footer Text with a slight opacity for the design
              Center(
                child: Text(
                  'Thank you for exploring our product!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
