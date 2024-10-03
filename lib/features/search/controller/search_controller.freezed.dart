// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchScreenState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  SearchState get searchState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchScreenStateCopyWith<SearchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenStateCopyWith<$Res> {
  factory $SearchScreenStateCopyWith(
          SearchScreenState value, $Res Function(SearchScreenState) then) =
      _$SearchScreenStateCopyWithImpl<$Res, SearchScreenState>;
  @useResult
  $Res call({List<Movie> movies, SearchState searchState});
}

/// @nodoc
class _$SearchScreenStateCopyWithImpl<$Res, $Val extends SearchScreenState>
    implements $SearchScreenStateCopyWith<$Res> {
  _$SearchScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? searchState = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      searchState: null == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as SearchState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchScreenStateImplCopyWith<$Res>
    implements $SearchScreenStateCopyWith<$Res> {
  factory _$$SearchScreenStateImplCopyWith(_$SearchScreenStateImpl value,
          $Res Function(_$SearchScreenStateImpl) then) =
      __$$SearchScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Movie> movies, SearchState searchState});
}

/// @nodoc
class __$$SearchScreenStateImplCopyWithImpl<$Res>
    extends _$SearchScreenStateCopyWithImpl<$Res, _$SearchScreenStateImpl>
    implements _$$SearchScreenStateImplCopyWith<$Res> {
  __$$SearchScreenStateImplCopyWithImpl(_$SearchScreenStateImpl _value,
      $Res Function(_$SearchScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? searchState = null,
  }) {
    return _then(_$SearchScreenStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      searchState: null == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as SearchState,
    ));
  }
}

/// @nodoc

class _$SearchScreenStateImpl implements _SearchScreenState {
  const _$SearchScreenStateImpl(
      {required final List<Movie> movies, required this.searchState})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final SearchState searchState;

  @override
  String toString() {
    return 'SearchScreenState(movies: $movies, searchState: $searchState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchScreenStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.searchState, searchState) ||
                other.searchState == searchState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movies), searchState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchScreenStateImplCopyWith<_$SearchScreenStateImpl> get copyWith =>
      __$$SearchScreenStateImplCopyWithImpl<_$SearchScreenStateImpl>(
          this, _$identity);
}

abstract class _SearchScreenState implements SearchScreenState {
  const factory _SearchScreenState(
      {required final List<Movie> movies,
      required final SearchState searchState}) = _$SearchScreenStateImpl;

  @override
  List<Movie> get movies;
  @override
  SearchState get searchState;
  @override
  @JsonKey(ignore: true)
  _$$SearchScreenStateImplCopyWith<_$SearchScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
