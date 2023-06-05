class Movie {
  String title;
  String posterPath;
  String backdropPath;

  Movie(this.title, this.posterPath, this.backdropPath);

  factory Movie.fromJson(Map<String, dynamic> jsonMapObject) => Movie(
        jsonMapObject['title'],
        'https://image.tmdb.org/t/p/original${jsonMapObject['poster_path']}',
    'https://image.tmdb.org/t/p/original${jsonMapObject['backdrop_path']}',
      );
}
