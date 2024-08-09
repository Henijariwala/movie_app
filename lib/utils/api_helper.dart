import 'dart:convert';
import 'package:adv_exam/screen/home/model/multimovie_model.dart';
import 'package:http/http.dart' as http;
import 'package:adv_exam/screen/home/model/home_model.dart';

class ApiHelper
{
  Future<movieModel?>? APICall () async {
    String link = "https://www.omdbapi.com/?t=avatar&apikey=469c11bf";

    var res = await http.get(Uri.parse(link));

    if(res.statusCode == 200)
    {
      var json = jsonDecode(res.body);
      movieModel model = movieModel.fromJson(json);
      return model;
    }
    return null;
  }

  Future<multiMovieModel?> movieApiCall(String search) async {
    String apiLink = "https://www.omdbapi.com/?s=$search&apikey=7ef88ba4";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      multiMovieModel h1 = multiMovieModel.fromJson(json);
      return h1;
    }
    return null;
  }
}