class Model {
  String title;
  String image;
  String imdbLink;
  String rating;
  Map<String, String> cast;
  List<String> genres;
  String director;
  String release;
  List<Map<String, String>> reviews;
  String description;

  Model({
    required this.title,
    required this.image,
    required this.imdbLink,
    required this.rating,
    required this.cast,
    required this.genres,
    required this.director,
    required this.release,
    required this.reviews,
    required this.description,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['Title'],
      image: json['Image'],
      imdbLink: json['IMDb_link'],
      rating: json['Rating'],
      cast: Map<String, String>.from(json['Cast']),
      genres: List<String>.from(json['Genres']),
      director: json['Director'],
      release: json['Release'],
      reviews: List<Map<String, String>>.from(json['Reviews']),
      description: json['Description'],
    );
  }
}
