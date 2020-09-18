import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:igdb_app/models/game/game.dart';
import 'package:igdb_app/screens/main_screen/components/home_bg.dart';

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
    return Scaffold(
      body: HomeBg(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: Container(
                  // decoration: BoxDecoration(color: Colors.amber[300]),
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
                        child: Container(
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
                      ),
                      Positioned(
                        top: 30,
                        left: 25,
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
                      Container(
                        // decoration: BoxDecoration(color: Colors.brown),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            verticalDirection: VerticalDirection.up,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Genre:',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.4),
                                          ),
                                        ),
                                        // ListView.builder(
                                        //   itemCount: game.genres.length,
                                        //   itemBuilder: (context, index) {
                                        //     if (game.genres.length != 0)
                                        //       return _buildBadgeWidget(
                                        //         someText:
                                        //             game.genres[index].name,
                                        //       );
                                        //     else
                                        //       return Text('No genre');
                                        //   },
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Game modes:',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _buildBadgeWidget(
                                      icon: Icons.person_outline,
                                    ),
                                  ),
                                  _buildBadgeWidget(icon: Icons.people_outline),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
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
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  ),
                                  Container(
                                    // decoration:
                                    // BoxDecoration(color: Colors.deepPurple),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                                                  color: Colors.white
                                                      .withOpacity(0.3),
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
                                              .substring(0, 4),
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
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _buildBadgeWidget extends StatelessWidget {
  final IconData icon;
  final String someText;
  const _buildBadgeWidget({
    Key key,
    this.icon,
    this.someText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
          border: Border.all(color: Colors.purpleAccent[100].withOpacity(0.4))),
      child: icon != null
          ? Icon(
              icon,
              color: Colors.purpleAccent[100].withOpacity(0.3),
            )
          : Text(
              someText,
              style:
                  TextStyle(color: Colors.purpleAccent[100].withOpacity(0.3)),
            ),
    );
  }
}
