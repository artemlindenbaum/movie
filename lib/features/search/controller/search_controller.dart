import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie/core/enum.dart';
import 'package:movie/core/providers.dart';
import 'package:movie/features/search/model/movie_model.dart';

part 'search_controller.freezed.dart';

final searchScreenProvider = StateNotifierProvider<SearchNotifier, SearchScreenState>((ref) => SearchNotifier(ref));

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState({
    required List<Movie> movies,
    required SearchState searchState,
    // required bool toShort
  }) = _SearchScreenState;

}

class SearchNotifier extends StateNotifier<SearchScreenState> {
  SearchNotifier(this.ref) : super(const SearchScreenState(
    movies: [],
    searchState: SearchState.initial,
    // toShort: false
  ));

  final StateNotifierProviderRef ref;
  TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  void clearResults () {
    searchController.clear();
    state = state.copyWith(movies: [], searchState: SearchState.initial);
  }

  void search() async {
    if (searchController.text.length < 3) {
      state = state.copyWith(searchState: SearchState.tooShort, movies: []);
      return;
    } 
    
    state = state.copyWith(searchState: SearchState.isSearching);
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      List<Movie>? movies;
      movies = await ref.read(searchRepositoryProvider).fetchMovies(searchController.text);
      
      state = state.copyWith(
        movies: movies ?? [],
        searchState: movies == null
        ? SearchState.error
        : movies.isEmpty
        ? SearchState.nothingFinded 
        : SearchState.searchComplited
      );
    });
  }
}

