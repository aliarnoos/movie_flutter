class MovieModel {
  final String title;
  final String imageUrl;
  final String releaseDate;
  final String overview;
  final int budget;
  final int revenue;
  final List<String> spokenLanguages;

  MovieModel({
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.overview,
    required this.budget,
    required this.revenue,
    required this.spokenLanguages,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] as String,
      imageUrl:
          'https://image.tmdb.org/t/p/w500' + (json['poster_path'] as String),
      releaseDate: json['release_date'] as String,
      overview: json['overview'] as String,
      budget: (json['budget'] as num).toInt(),
      revenue: (json['revenue'] as num).toInt(),
      spokenLanguages: (json['spoken_languages'] as List)
          .map((lang) => lang['english_name'] as String)
          .toList(),
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
          spokenLanguages.map((lang) => {'english_name': lang}).toList(),
    };
  }
}
