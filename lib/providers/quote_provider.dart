import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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
      final url = 'https://dummyjson.com/quotes?page=$_page&limit=10';
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['quotes'];
        final quotes = data.map((json) => Quote.fromJson(json)).toList();

        List<Future<Quote>> translatedQuotesFutures = quotes.map((quote) => _translateQuote(quote, 'ru')).toList();

        List<Quote> translatedQuotes = await Future.wait(translatedQuotesFutures);

        _quotes.addAll(translatedQuotes);
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
    final url = 'https://microsoft-translator-text.p.rapidapi.com/translate?api-version=3.0&to=$targetLang';

    final headers = {
      'content-type': 'application/json',
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'microsoft-translator-text.p.rapidapi.com',
    };

    final body = jsonEncode([
      {'Text': quote.quote}
    ]);

    try {
      final response = await Dio().post(url, options: Options(headers: headers), data: body);

      if (response.statusCode == 200) {
        final translatedText = response.data[0]['translations'][0]['text'];
        return Quote(
          id: quote.id,
          quote: translatedText,
          author: quote.author,
        );
      } else {
        throw Exception('Failed to translate quote');
      }
    } catch (error) {
      print('Error translating quote: $error');
      return quote;  // Возвращаем исходную цитату в случае ошибки
    }
  }
}
