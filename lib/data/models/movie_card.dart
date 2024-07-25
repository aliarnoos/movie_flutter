class MovieCardModel {
  final String title;
  final String imageUrl;
  final String releaseDate;

  MovieCardModel({
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
  });

  factory MovieCardModel.fromJson(Map<String, dynamic> json) {
    return MovieCardModel(
      title: json['title'] as String,
      imageUrl:
          'https://image.tmdb.org/t/p/w500' + (json['poster_path'] as String),
      releaseDate: json['release_date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'poster_path':
          imageUrl.replaceFirst('https://image.tmdb.org/t/p/w500', ''),
      'release_date': releaseDate,
    };
  }
}
