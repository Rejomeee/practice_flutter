import 'package:auto_route/auto_route.dart';
import 'package:igdb_app/models/game/game.dart';
import 'package:igdb_app/models/game/game_response.dart';
import 'package:igdb_app/repository/repository.dart';
import 'package:igdb_app/screens/main_screen/components/home_view_game_details.dart';
import 'package:igdb_app/services/router/router.gr.dart';
// import 'package:igdb_app/services/router/router.gr.dart';
import 'package:rxdart/rxdart.dart';

class GetGamesBloc {
  final GameRepository _repository = GameRepository();
  final BehaviorSubject<GameResponse> _subject =
      BehaviorSubject<GameResponse>();

  getGames() async {
    GameResponse response = await _repository.getGames();
    _subject.sink.add(response);
  }

  void clickedGame(GameModel gameModel) {
    // Router.navigatorKey.currentState.pushNamed('/view-details',
    //     arguments: HomeViewGameDetailsScreenArguments(
    //       game: gameModel,
    //     ));
    ExtendedNavigator.root.push(
      '/home-view-game-details-screen',
      arguments: HomeViewGameDetailsScreenArguments(game: gameModel),
    );
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GameResponse> get subject => _subject;
}

final getGamesBloc = GetGamesBloc();
