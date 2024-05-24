import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_item.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuoteProvider>(context, listen: false).fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Фоновое изображение
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img1.akspic.ru/previews/3/2/6/5/3/135623/135623-temnota-elektrik-nochnoe_nebo-astronomicheskij_obekt-sinij-360x640.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Полупрозрачный черный слой для затемнения фона
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // PageView для цитат
          quoteProvider.quotes.isEmpty
              ? Center(child: CircularProgressIndicator())
              : PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: quoteProvider.quotes.length,
            itemBuilder: (ctx, i) => QuoteItem(quoteProvider.quotes[i]),
            onPageChanged: (index) {
              if (index == quoteProvider.quotes.length - 1) {
                quoteProvider.fetchQuotes();
              }
            },
          ),
        ],
      ),
    );
  }
}
