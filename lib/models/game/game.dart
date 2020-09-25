import 'game_models/cover.dart';
import 'game_models/genre.dart';
import 'game_models/keywords.dart';
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
  final List<KeywordsModel> keywords;
  final List<GenreModel> genres;
  final List<PlayerPerspectiveModel> perspectives;
  final double popularity;
  final List<ScreenshotModel> screenshots;
  final String summary;
  final List<VideoModel> videos;
  final double rating;
  final int ratingCount;
  final String name;
  final String storyline;

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
    this.ratingCount,
    this.keywords,
    this.storyline,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;

    if (cover != null) {
      data['cover'] = cover.toJson();
    }

    data['createdAt'] = createdAt;
    data['firstRelease'] = firstRelease;

    if (modes != null) {
      data['game_modes'] = modes.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres.map((v) => v.toJson()).toList();
    }
    if (perspectives != null) {
      data['perspectives'] = perspectives.map((v) => v.toJson()).toList();
    }

    data['popularity'] = popularity;

    if (screenshots != null) {
      data['screenshots'] = screenshots.map((v) => v.toJson()).toList();
    }

    data['summary'] = summary;
    if (videos != null) {
      data['videos'] = videos.map((v) => v.toJson()).toList();
    }
    data['rating'] = rating;
    data['name'] = name;
    data['rating_count'] = ratingCount;
    data['keywords'] = keywords;
    data['storyline'] = storyline;
    return data;
  }

  GameModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        cover =
            json["cover"] == null ? null : CoverModel.fromJson(json["cover"]),
        createdAt = json["created_at"],
        firstRelease = json['first_release_date'],
        keywords = json["keywords"] == null
            ? null
            : (json["keywords"] as List)
                .map((i) => KeywordsModel.fromjson(i))
                .toList(),
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
        ratingCount = json["rating_count"],
        name = json['name'],
        storyline = json['storyline'];
}
