import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

class QuoteItem extends StatelessWidget {
  final Quote quote;
  static const List<String> imageUrls = [
    'https://source.unsplash.com/random/800x600?nature',
    'https://source.unsplash.com/random/800x600?forest',
    'https://source.unsplash.com/random/800x600?water',
    'https://source.unsplash.com/random/800x600?mountain',
    'https://source.unsplash.com/random/800x600?sky',
    'https://source.unsplash.com/random/800x600?beach',
    'https://source.unsplash.com/random/800x600?desert',
    'https://source.unsplash.com/random/800x600?space',
    'https://source.unsplash.com/random/800x600?river',
    'https://source.unsplash.com/random/800x600?trees',
  ];

  QuoteItem(this.quote);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final imageUrl = imageUrls[random.nextInt(imageUrls.length)];

    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: '$imageUrl&${quote.id}',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10),
            Text(
              quote.quote,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('- ${quote.author}', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
