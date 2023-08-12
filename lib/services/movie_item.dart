import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie__app/models/movie_details.dart';
class MovieDetailApi {
  Future<MovieDetailsModel> getMovieDetail({int? MovieID}) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$MovieID?api_key=2cea540516c34e08acc709a3a955342b');
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    var data_item=MovieDetailsModel.fromJson(data);   // to control item in list 
    return data_item;
  }
}
