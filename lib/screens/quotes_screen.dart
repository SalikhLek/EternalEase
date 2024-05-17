import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_item.dart';

class QuotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Цитаты'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            quoteProvider.fetchQuotes();
          }
          return true;
        },
        child: quoteProvider.quotes.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: quoteProvider.quotes.length,
          itemBuilder: (ctx, i) => QuoteItem(quoteProvider.quotes[i]),
        ),
      ),
    );
  }
}
