import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:igdb_app/bloc/get_games_bloc.dart';
import 'package:igdb_app/elements/loader_element.dart';
import 'package:igdb_app/models/game/game.dart';
import 'package:igdb_app/models/game/game_response.dart';
import 'package:igdb_app/elements/error_element.dart';
import 'package:igdb_app/screens/main_screen/components/home_view_game_details.dart';

class HomePopularList extends StatefulWidget {
  @override
  _HomePopularListState createState() => _HomePopularListState();
}

class _HomePopularListState extends State<HomePopularList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGamesBloc..getGames();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getGamesBloc.subject.stream,
      builder: (context, AsyncSnapshot<GameResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildHomePopularGamesWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildScreenLoadingWidget(0);
        }
      },
    );
  }

  Widget _buildHomePopularGamesWidget(GameResponse data) {
    List<GameModel> games = data.games;
    if (games.length == 0)
      return buildErrorWidget('No Popular Games Found');
    else
      return AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: games.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print(games[index].screenshots[0].imageId);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeViewGameDetailsScreen(
                            game: games[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 3 / 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://images.igdb.com/igdb/image/upload/t_cover_big/${games[index].cover.imageId}.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              if (games[index].rating > 92.5)
                                Positioned(
                                  top: 7,
                                  left: 7,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        'Top'.toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  ),
                                )
                            ],
                          ),
                          SizedBox(
                            height: 9.0,
                          ),
                          Text(
                            '${games[index].name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            children: [
                              Text(
                                (games[index].rating / 20)
                                    .toString()
                                    .substring(0, 3),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RatingBar(
                                itemSize: 13.0,
                                initialRating: games[index].rating / 20,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.5),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                                ignoreGestures: true,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
