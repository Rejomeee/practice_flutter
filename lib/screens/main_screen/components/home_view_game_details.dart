import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:igdb_app/models/game/game.dart';
import 'package:igdb_app/widgets/chip_badge_widget.dart';

class HomeViewGameDetailsScreen extends StatefulWidget {
  final GameModel game;

  const HomeViewGameDetailsScreen({Key key, this.game}) : super(key: key);

  @override
  _HomeViewGameDetailsScreenState createState() =>
      _HomeViewGameDetailsScreenState(game);
}

class _HomeViewGameDetailsScreenState extends State<HomeViewGameDetailsScreen> {
  final GameModel game;
  _HomeViewGameDetailsScreenState(this.game);

  @override
  Widget build(BuildContext context) {
    List _genreList = <Widget>[];
    List _gameModeList = <Widget>[];

    for (var i = 0; i < game.genres.length; i++) {
      _genreList.add(ChipBadgeWidget(
        someText: game.genres[i].name,
      ));
    }

    for (var i = 0; i < game.modes.length; i++) {
      if (game.modes[i].slug == 'single-player')
        _gameModeList.add(
          ChipBadgeWidget(
            icon: Icons.person_outline,
          ),
        );
      else if (game.modes[i].slug == 'multiplayer')
        _gameModeList.add(
          ChipBadgeWidget(
            icon: Icons.people_outline,
          ),
        );
      else if (game.modes[i].slug == 'co-operative')
        _gameModeList.add(
          ChipBadgeWidget(
            icon: Icons.group_work,
          ),
        );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color(0xFF212121)),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.igdb.com/igdb/image/upload/t_screenshot_huge/${game.screenshots[0].imageId}.jpg",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        stops: [0.0, 0.9],
                        colors: [
                          Color(0xFF20232A).withOpacity(1.0),
                          Color(0xFF212121).withOpacity(0.0)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              EvaIcons.arrowIosBackOutline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                          height: 60,
                          // decoration: BoxDecoration(color: Colors.blue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '2016',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RatingBar(
                                          itemSize: 13.0,
                                          initialRating: game.rating / 20,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 1.5),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                          ignoreGestures: true,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          '${game.rating_count} Votes'
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      (game.rating / 20)
                                          .toString()
                                          .substring(0, 4)
                                          .replaceFirst('.', ','),
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              game.name,
                              style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                        if (_gameModeList.length != 0)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 14.0,
                                  right: 10.0,
                                ),
                                child: Text(
                                  'Modes:',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Wrap(
                                  spacing: 5.0,
                                  children: _gameModeList,
                                ),
                              )
                            ],
                          ),
                        if (_genreList.length != 0)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 14.0,
                                  right: 10.0,
                                ),
                                child: Text(
                                  'Genres:',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Wrap(
                                  spacing: 5.0,
                                  children: _genreList,
                                ),
                              )
                            ],
                          ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Summary'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.3),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            game.summary.toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
