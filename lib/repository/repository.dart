import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:igdb_app/models/game/game_response.dart';
import 'package:igdb_app/repository/api_provider.dart';

class GameRepository {
  static String mainUrl = 'https://api-v3.igdb.com';
  var gameListUrl = '$mainUrl/games';
  final String apiKey = '44f5e5ac43c20229a5e3df514d0a752c';
  final ApiProvider _apiProvider = ApiProvider();

  Future<GameResponse> getGames() async {
    var response = await http.post(gameListUrl,
        headers: {"Accept": "application/json,", "user-key": "$apiKey"},
        body:
            "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,release_dates, genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*,platforms.platform_logo.*, player_perspectives.*,popularity,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,time_to_beat,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*;where cover.image_id != null & genres != null & created_at > 1261664000 & platforms = 48 & rating > 90; limit 100; sort popularity desc;");
    print("response.statusCode getGames");
    print("${response.statusCode}");
    // print("${response.body}");

    return GameResponse.fromJson(jsonDecode(response.body));
  }

  Future<GameResponse> getSlider() async {
    // var response = await _apiProvider.makeRequest(
    //     jsonData:
    //         "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,release_dates, genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*,platforms.platform_logo.*, player_perspectives.*,popularity,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,time_to_beat,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*;where cover.image_id != null & screenshots != null & created_at > 1252214987 & platforms = 48; limit 100; sort created_at asc;",
    //     urlPath: gameListUrl,
    //     method: 'POST');
    var response = await http.post(gameListUrl,
        headers: {"Accept": "application/json,", "user-key": "$apiKey"},
        body:
            "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,release_dates, genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*,platforms.platform_logo.*, player_perspectives.*,popularity,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,time_to_beat,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*;where cover.image_id != null & screenshots != null & created_at > 1252214987 & platforms = 48; limit 100; sort created_at asc;");
    print("response.statusCode getSlider");
    // print("${response.statusCode}");
    // print(response.data.toString());
    return GameResponse.fromJson(jsonDecode(response.body));
  }
}
