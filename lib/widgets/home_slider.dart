import 'package:flutter/material.dart';
import 'package:igdb_app/bloc/get_slider_bloc.dart';
import 'package:igdb_app/elements/error_element.dart';
import 'package:igdb_app/elements/loader_element.dart';
import 'package:igdb_app/models/game/game.dart';
import 'package:igdb_app/models/game/game_response.dart';
import 'package:page_indicator/page_indicator.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);

  @override
  void initState() {
    getSliderBloc..getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getSliderBloc.subject.stream,
      builder: (context, AsyncSnapshot<GameResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildHomeSliderWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildScreenLoadingWidget(0);
        }
      },
    );
  }

  Widget _buildHomeSliderWidget(GameResponse data) {
    List<GameModel> games = data.games;
    return Container(
      height: 220.0,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        indicatorSpace: 11.0,
        padding: EdgeInsets.all(5.0),
        indicatorColor: Colors.grey.withOpacity(0.3),
        indicatorSelectorColor: Colors.yellow[700],
        shape: IndicatorShape.circle(
          size: 7.0,
        ),
        pageView: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: games.take(5).length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: games[index].id,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.igdb.com/igdb/image/upload/t_screenshot_huge/${games[index].screenshots[0].imageId}.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                    bottom: 30.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      width: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            games[index].name,
                            style: TextStyle(
                              height: 1.5,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        length: games.take(5).length,
      ),
    );
  }
}
