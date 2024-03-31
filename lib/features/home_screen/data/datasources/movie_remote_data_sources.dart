import 'dart:convert';
import 'dart:io';
import 'package:movie_app_clean_bloc/core/constants/constants.dart';
import '../models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract interface class MovieRemoteDataSource {
  Future<List<MovieModel>> getTredingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MoviesRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getTredingMovies() async {
    try {
      print('--------------Entered-------------------');
      var response = await http.get(Uri.parse(
          '${Constants.apiDomain}/trending/all/day?api_key=${Constants.apiKey}'));
      var data = jsonDecode(response.body)['results'] as List;
      print(data);
      List<MovieModel> moviesList =
          data.map((data) => MovieModel.fromJson(data)).toList();
      print('--------------$moviesList--------------');
      return moviesList;
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Couldn\'t find the post');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      var response = await http.get(Uri.parse(
          '${Constants.apiDomain}/movie/popular?api_key=${Constants.apiKey}'));
      var data = jsonDecode(response.body)['results'] as List;
      List<MovieModel> popularMovies =
          data.map((movie) => MovieModel.fromJson(movie)).toList();
      return popularMovies;
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Couldn\'t find the post');
    } on FormatException {
      throw Exception('Bad response format');
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      var response = await http.get(Uri.parse(
          '${Constants.apiDomain}/movie/now_playing?page=1&api_key=${Constants.apiKey}'));
      {
        var data = jsonDecode(response.body)['results'] as List;
        List<MovieModel> nowPlaying =
            data.map((movie) => MovieModel.fromJson(movie)).toList();
        return nowPlaying;
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Couldn\'t find the post');
    } on FormatException {
      throw Exception('Bad response format');
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      var response = await http.get(Uri.parse(
          '${Constants.apiDomain}/movie/top_rated?api_key=${Constants.apiKey}'));
      var data = jsonDecode(response.body)['results'] as List;
      List<MovieModel> topRatedMovies =
          data.map((movie) => MovieModel.fromJson(movie)).toList();
      return topRatedMovies;
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Couldn\'t find the post');
    } on FormatException {
      throw Exception('Bad response format');
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      var response = await http.get(Uri.parse(
          '${Constants.apiDomain}/movie/upcoming?api_key=${Constants.apiKey}'));
      var data = jsonDecode(response.body)['results'] as List;
      List<MovieModel> upcoming =
          data.map((movie) => MovieModel.fromJson(movie)).toList();
      return upcoming;
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Couldn\'t find the post');
    } on FormatException {
      throw Exception('Bad response format');
    }
  }
}
