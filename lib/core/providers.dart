import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/features/search/data/search_repository.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) => SearchRepository());