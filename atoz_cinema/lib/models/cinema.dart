class Model {
  String? title;
  String? imageUrl;
  String? imdbLink;
  String? rating;
  String? description;
  String? director;
  String? release;
  List<String>? genres;
  List<Cast>? cast;
  List<Reviews>? reviews;

  Model(
      {this.title,
      this.imageUrl,
      this.imdbLink,
      this.rating,
      this.description,
      this.director,
      this.release,
      this.genres,
      this.cast,
      this.reviews});

  Model.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['image_url'];
    imdbLink = json['imdb_link'];
    rating = json['rating'];
    description = json['description'];
    director = json['director'];
    release = json['release'];
    genres = json['genres'].cast<String>();
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(new Cast.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['imdb_link'] = this.imdbLink;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['director'] = this.director;
    data['release'] = this.release;
    data['genres'] = this.genres;
    if (this.cast != null) {
      data['cast'] = this.cast!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  String? name;
  String? imageUrl;

  Cast({this.name, this.imageUrl});

  Cast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Reviews {
  String? name;
  String? review;
  String? rating;

  Reviews({this.name, this.review, this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    review = json['review'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['review'] = this.review;
    data['rating'] = this.rating;
    return data;
  }
}
