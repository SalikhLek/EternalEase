import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/quote.dart';

class QuoteProvider with ChangeNotifier {
  List<Quote> _quotes = [];
  int _page = 1;
  bool _isFetching = false;

  List<Quote> get quotes => _quotes;

  Future<void> fetchQuotes() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      final url = Uri.parse('https://dummyjson.com/quotes?page=$_page&limit=10');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['quotes'];
        _quotes.addAll(data.map((json) => Quote.fromJson(json)).toList());
        _page++;
        notifyListeners();
      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (error) {
      print('Error fetching quotes: $error');
    } finally {
      _isFetching = false;
    }
  }
}
