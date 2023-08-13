import 'package:movie__app/models/genre.dart';
import 'package:movie__app/models/production_company.dart';
import 'package:movie__app/models/spoken_langauge.dart';

class MovieDetailsModel {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCountries>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  dynamic? voteAverage;
  int? voteCount;

  MovieDetailsModel(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    belongsToCollection = json["belongs_to_collection"];
    budget = json["budget"];
    genres = json["genres"] == null
        ? null
        : (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
    homepage = json["homepage"];
    id = json["id"];
    imdbId = json["imdb_id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    //popularity = json["popularity"];
    posterPath = json["poster_path"];
    //productionCompanies = (json["production_companies"] == null ? null : (json["production_companies"] as List).map((e) => productionCompanies?.fromJson(e)).toList())?.cast<ProductionCountries>();
    // productionCountries = json["production_countries"] == null ? null : (json["production_countries"] as List).map((e) => ProductionCountries.fromJson(e)).toList();
    releaseDate = json["release_date"];
    revenue = json["revenue"];
    runtime = json["runtime"];
    spokenLanguages = json["spoken_languages"] == null
        ? null
        : (json["spoken_languages"] as List)
            .map((e) => SpokenLanguages.fromJson(e))
            .toList();
    status = json["status"];
    tagline = json["tagline"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["adult"] = adult;
    _data["backdrop_path"] = backdropPath;
    _data["belongs_to_collection"] = belongsToCollection;
    _data["budget"] = budget;
    if (genres != null) {
      _data["genres"] = genres?.map((e) => e.toJson()).toList();
    }
    _data["homepage"] = homepage;
    _data["id"] = id;
    _data["imdb_id"] = imdbId;
    _data["original_language"] = originalLanguage;
    _data["original_title"] = originalTitle;
    _data["overview"] = overview;
    _data["popularity"] = popularity;
    _data["poster_path"] = posterPath;
    if (productionCompanies != null) {
      _data["production_companies"] =
          productionCompanies?.map((e) => e.toJson()).toList();
    }
    if (productionCountries != null) {
      _data["production_countries"] =
          productionCountries?.map((e) => e.toJson()).toList();
    }
    _data["release_date"] = releaseDate;
    _data["revenue"] = revenue;
    _data["runtime"] = runtime;
    if (spokenLanguages != null) {
      _data["spoken_languages"] =
          spokenLanguages?.map((e) => e.toJson()).toList();
    }
    _data["status"] = status;
    _data["tagline"] = tagline;
    _data["title"] = title;
    _data["video"] = video;
    _data["vote_average"] = voteAverage;
    _data["vote_count"] = voteCount;
    return _data;
  }
}
