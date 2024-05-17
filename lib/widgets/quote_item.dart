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

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: '$imageUrl&${quote.id}',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quote.quote,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- ${quote.author}',
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
