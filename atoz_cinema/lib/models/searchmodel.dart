class SearchModel {
  String? title;
  String? rating;
  String? release;

  SearchModel(String s, int i, double d,
      {this.title, this.rating, this.release});

  SearchModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rating = json['rating'];
    release = json['release'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['release'] = this.release;
    return data;
  }
}
