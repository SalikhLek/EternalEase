import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteItem extends StatelessWidget {
  final Quote quote;
  final List<String> _imageUrls = [
    'https://images.unsplash.com/photo-1541698444083-023c97d3f4b6',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
  ];

  QuoteItem(this.quote);

  @override
  Widget build(BuildContext context) {
    final imageUrl = _imageUrls[quote.id % _imageUrls.length];

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    quote.quote,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '- ${quote.author}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
