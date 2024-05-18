import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'package:cached_network_image/cached_network_image.dart';

class QuoteItem extends StatelessWidget {
  final Quote quote;

  QuoteItem(this.quote);

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://source.unsplash.com/random/800x600?sig=${quote
        .id}'; // Генерация уникального изображения

    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quote.quote,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- ${quote.author}',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
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
