class Book {
  String? title;
  int? firstPublishYear;
  late bool isRead;
  int? coverId;
  List<String>? authorNames;
  Book({this.title, this.firstPublishYear, this.isRead = false});

  void fromJson(Map<String, dynamic> json) {
    title = json['title'];
    firstPublishYear = json['first_publish_year'];
    isRead = false;
  }

  Book.fromSearchJson(Map<String, dynamic> json) {
    fromJson(json);
    coverId = json['cover_i'];
    if (json['author_name'] != null) {
      authorNames = json['author_name'].cast<String>();
    }
  }

  Book.fromHomeJson(Map<String, dynamic> json) {
    fromJson(json);
    coverId = json['cover_id'];
    if (json['author_names'] != null) {
      authorNames = json['author_names'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['first_publish_year'] = firstPublishYear;
    return data;
  }

  String get authors {
    if (authorNames == null) {
      return '--';
    }
    if (authorNames!.length < 3) {
      return authorNames!.join(', ');
    }
    return '${authorNames![0]}, ${authorNames![1]}...';
  }
}
