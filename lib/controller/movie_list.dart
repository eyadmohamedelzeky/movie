import 'package:get/get.dart';
import 'package:movie__app/models/movie_details.dart';
import 'package:movie__app/services/movie_list_api.dart';

class MovieList extends GetxController {
  List<MovieDetailsModel>? moviesList;
  MovieListApi apiService = MovieListApi();
  Future<void> loadData() async {
    moviesList = await apiService.getmovieslist();
    update();
  }
  @override
  void onInit() {
loadData();
super.onInit();
  }
  @override
  void onClose() {
loadData();
    super.onClose();
  }
}
