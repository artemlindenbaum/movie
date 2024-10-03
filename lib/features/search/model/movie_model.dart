
class Movie {
  final String? title;
  final String? poster;
  final String? description;
  final int? year;
  final double? rating;

  Movie({
    this.title,
    this.poster,
    this.description,
    this.year,
    this.rating,
  });


  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['name'] as String?,
      poster: json['poster']?['previewUrl'] as String?,
      description: json['shortDescription'] as String?,
      year: json['year'] as int?,
      rating: double.tryParse(json['rating']?['kp'].toString() ?? ''),
    );
  }

static List<Movie> listFromJson(Map<String, dynamic> json) => 
    (json['docs'] as List<dynamic>).map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();

}