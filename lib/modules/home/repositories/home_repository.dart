// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/pokemons_model.dart';

class HomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  Future<PokemonsModel> getData() async {
    try {
      var response = await _dio.get(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      return PokemonsModel.fromJson(json.decode(response.data));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
