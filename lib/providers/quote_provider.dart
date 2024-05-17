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
        final quotes = data.map((json) => Quote.fromJson(json)).toList();

        for (var quote in quotes) {
          quote = await _translateQuote(quote, 'ru');
          _quotes.add(quote);
        }
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

  Future<Quote> _translateQuote(Quote quote, String targetLang) async {
    final apiKey = 'f183c6e0dcmsh2d5227974ee7827p1f5693jsnc9fe1f63dde7';
    final url = Uri.parse('https://microsoft-translator-text.p.rapidapi.com/translate?api-version=3.0&to=$targetLang');

    final headers = {
      'content-type': 'application/json',
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'microsoft-translator-text.p.rapidapi.com',
    };

    final body = json.encode([
      {'Text': quote.quote}
    ]);

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final translatedText = json.decode(response.body)[0]['translations'][0]['text'];
      return Quote(
        id: quote.id,
        quote: translatedText,
        author: quote.author,
      );
    } else {
      throw Exception('Failed to translate quote');
    }
  }
}
