import 'package:adv_exam/screen/home/model/multimovie_model.dart';
import 'package:adv_exam/utils/api_helper.dart';
import 'package:adv_exam/utils/share_helper.dart';
import 'package:flutter/material.dart';


import '../model/home_model.dart';


class HomeProvider with ChangeNotifier{
  multiMovieModel? model;
  movieModel? movie;
  ApiHelper helper = ApiHelper();
  String searchValue = "pari";
  List<String> bookMark= [];
  List<String> nameList = [];
  List<String> imageList = [];
  ShareHelper shareHelper = ShareHelper();

  Future<void> setBookMark(String name1, String pImg) async {

    List<String> name = await shareHelper.getNameList();
    List<String> img = await shareHelper.getImageList();

    name.add(name1);
    img.add(pImg);

    shareHelper.setNameList(name);
    shareHelper.setImageList(img);

    notifyListeners();
  }

  Future<void> getBookMark() async {
    nameList = (await shareHelper.getNameList());
    imageList = (await shareHelper.getImageList());
    notifyListeners();

  }
  Future<void> removeBookMark(String name1, String pImg) async {

    List<String> name = await shareHelper.getNameList();
    List<String> img = await shareHelper.getImageList();

    name.remove(name1);
    img.remove(pImg);

    shareHelper.setNameList(name);
    shareHelper.setImageList(img);

    getBookMark();

    notifyListeners();
  }

  Future<void> movieCall() async {
    movieModel? h1 = await helper.APICall();
    movie = h1;
    notifyListeners();
  }

  Future<void> multiMovie() async {
    multiMovieModel? n1 = await helper.movieApiCall(searchValue);
    model =n1;
    notifyListeners();

  }

  void searchMovie(String search) {
    searchValue = search;
    notifyListeners();
  }
}
