import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie__app/models/movie_details.dart';

class MovieListApi {
  MovieDetailsModel? movieDetailsModel;
  Future<List<MovieDetailsModel>> getmovieslist() async {
    List<MovieDetailsModel> movieslist = [];
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=2cea540516c34e08acc709a3a955342b');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    data["results"].forEach(
        (element) => movieslist.add(MovieDetailsModel.fromJson(element)));
    return movieslist;
  }
}
