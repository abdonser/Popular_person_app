import 'dart:convert';

PopularList popularListFromJson(String str) => PopularList.fromJson(json.decode(str));

String popularListToJson(PopularList data) => json.encode(data.toJson());

class PopularList {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  PopularList({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularList.fromJson(Map<String, dynamic> json) => PopularList(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  bool adult;
  int gender;
  int id;
  List<KnownFor> knownFor;
  KnownForDepartment knownForDepartment;
  String name;
  double popularity;
  String profilePath;

  Result({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownFor: List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromJson(x))),
    knownForDepartment: knownForDepartmentValues.map[json["known_for_department"]]!,
    name: json["name"],
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
    "known_for_department": knownForDepartmentValues.reverse[knownForDepartment],
    "name": name,
    "popularity": popularity,
    "profile_path": profilePath,
  };
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  MediaType mediaType;
  OriginalLanguage originalLanguage;
  String? originalTitle;
  String overview;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double voteAverage;
  int voteCount;
  DateTime? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;

  KnownFor({
    this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    this.originalTitle,
    required this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    required this.voteAverage,
    required this.voteCount,
    this.firstAirDate,
    this.name,
    this.originCountry,
    this.originalName,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    mediaType: mediaTypeValues.map[json["media_type"]]!,
    originalLanguage: originalLanguageValues.map[json["original_language"]]!,
    originalTitle: json["original_title"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    name: json["name"],
    originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
    originalName: json["original_name"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "media_type": mediaTypeValues.reverse[mediaType],
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "name": name,
    "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
    "original_name": originalName,
  };
}

enum MediaType {
  MOVIE,
  TV
}

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV
});

enum OriginalLanguage {
  EN,
  ES,
  IT,
  KO,
  TL
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "it": OriginalLanguage.IT,
  "ko": OriginalLanguage.KO,
  "tl": OriginalLanguage.TL
});

enum KnownForDepartment {
  ACTING,
  DIRECTING
}

final knownForDepartmentValues = EnumValues({
  "Acting": KnownForDepartment.ACTING,
  "Directing": KnownForDepartment.DIRECTING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
