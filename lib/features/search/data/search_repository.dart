
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:movie/features/search/model/movie_model.dart';
import 'package:http/http.dart';

class SearchRepository  {

  static const String _baseURL = 'https://api.kinopoisk.dev';
  static const String _token = '9J7JWGK-S9VMSPS-KREZVBC-8CBK5VK';


  Future<List<Movie>?> fetchMovies(String querry) async {

    try {
      final response = await get(
        Uri.parse('$_baseURL/v1.4/movie/search?query=$querry'),
        headers: {'X-API-KEY': _token, 'Content-Type': 'application/json'}
      );
        log('request url: $_baseURL/v1.4/movie/search?query=$querry | headers: ${jsonEncode({
          'X-API-KEY': _token,
          'Content-Type': 'application/json'
        })}');
      
      if (response.statusCode == HttpStatus.ok) {
        log(response.body);  
        return Movie.listFromJson(jsonDecode(response.body));
      } else {
        log('Request failed with status: ${response.statusCode}.');
        log('Error message: ${response.body}.');
        return [];
      }
    } catch (e) {
        log('Request failed with error: $e.');
        return null;
    }
  }
}