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
      appBar: AppBar(
        title: Text('Цитаты'),
      ),
      body: quoteProvider.quotes.isEmpty
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
    );
  }
}
