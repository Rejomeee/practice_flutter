import 'game_models/cover.dart';
import 'game_models/genre.dart';
import 'game_models/mode.dart';
import 'game_models/player_perspective.dart';
import 'game_models/screenshot.dart';
import 'game_models/video.dart';

class GameModel {
  final int id;
  final CoverModel cover;
  final int createdAt;
  final int firstRelease;
  final List<ModeModel> modes;
  final List<GenreModel> genres;
  final List<PlayerPerspectiveModel> perspectives;
  final double popularity;
  final List<ScreenshotModel> screenshots;
  final String summary;
  final List<VideoModel> videos;
  final double rating;
  final int rating_count;
  final String name;

  GameModel(
    this.id,
    this.cover,
    this.createdAt,
    this.firstRelease,
    this.modes,
    this.genres,
    this.perspectives,
    this.popularity,
    this.screenshots,
    this.summary,
    this.videos,
    this.rating,
    this.name,
    this.rating_count,
  );

  GameModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        cover =
            json["cover"] == null ? null : CoverModel.fromJson(json["cover"]),
        createdAt = json["created_at"],
        firstRelease = json['first_release_date'],
        modes = json["game_modes"] == null
            ? null
            : (json["game_modes"] as List)
                .map((i) => ModeModel.fromjson(i))
                .toList(),
        genres = json["genres"] == null
            ? null
            : (json["genres"] as List)
                .map((i) => GenreModel.fromjson(i))
                .toList(),
        perspectives = json["player_perspectives"] == null
            ? null
            : (json["player_perspectives"] as List)
                .map((i) => PlayerPerspectiveModel.fromjson(i))
                .toList(),
        popularity = json["popularity"],
        screenshots = (json["screenshots"] as List)
            .map((i) => ScreenshotModel.fromjson(i))
            .toList(),
        summary = json["summary"],
        videos = json["videos"] == null
            ? null
            : (json["videos"] as List)
                .map((i) => VideoModel.fromJson(i))
                .toList(),
        rating = json["rating"],
        rating_count = json["rating_count"],
        name = json['name'];
}
