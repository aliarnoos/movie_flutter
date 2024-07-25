class MovieModel {
  final String title;
  final String imageUrl;
  final String releaseDate;
  final String? overview;
  final int? budget;
  final int? revenue;
  final List<String>? spokenLanguages;

  MovieModel({
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    this.overview,
    this.budget,
    this.revenue,
    this.spokenLanguages,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] as String,
      imageUrl:
          'https://image.tmdb.org/t/p/w500${json['poster_path'] as String}',
      releaseDate: json['release_date'] as String,
      overview: json['overview'] as String?,
      budget: json['budget'] != null ? (json['budget'] as num).toInt() : null,
      revenue:
          json['revenue'] != null ? (json['revenue'] as num).toInt() : null,
      spokenLanguages: json['spoken_languages'] != null
          ? (json['spoken_languages'] as List)
              .map((lang) => lang['english_name'] as String)
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'poster_path':
          imageUrl.replaceFirst('https://image.tmdb.org/t/p/w500', ''),
      'release_date': releaseDate,
      'overview': overview,
      'budget': budget,
      'revenue': revenue,
      'spoken_languages':
          spokenLanguages?.map((lang) => {'english_name': lang}).toList(),
    };
  }
}
