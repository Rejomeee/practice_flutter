import 'package:badges/badges.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:igdb_app/bloc/auth_bloc.dart';
import 'package:igdb_app/bloc/get_user_details.dart';
import 'package:igdb_app/bloc/home_notif_bloc.dart';
import 'package:igdb_app/elements/circular_img_element.dart';
import 'package:igdb_app/elements/custom_dialog.dart';
import 'package:igdb_app/elements/error_element.dart';
import 'package:igdb_app/elements/loader_element.dart';
import 'package:igdb_app/models/app/app_models/user_details.dart';
import 'package:igdb_app/screens/login_screen/components/login_body.dart';
import 'package:igdb_app/screens/login_screen/login_screen.dart';
import 'package:igdb_app/screens/main_screen/components/home_body.dart';
import 'package:igdb_app/screens/wrapper.dart';
import 'package:igdb_app/widgets/home_popular_list.dart';
import 'package:igdb_app/widgets/wiredash.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _wiredashConsole = WiredashConsole();
  PageController _pageController;
  AuthBloc _authBloc;
  HomeNotifBloc _homeNotifBloc;
  GlobalKey bottomNavigationKey = GlobalKey();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _authBloc = AuthBloc();
    _homeNotifBloc = HomeNotifBloc();
    getUserDetailsBloc..getUserDetails();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            StreamBuilder(
              stream: getUserDetailsBloc.userDetails.stream,
              builder: (context, AsyncSnapshot<UserDetails> snapshot) {
                if (snapshot.hasData) {
                  return _buildDrawerHeader(
                      snapshot.data, MediaQuery.of(context).size);
                } else if (snapshot.hasError) {
                  return buildErrorWidget(snapshot.error);
                } else {
                  return buildScreenLoadingWidget(0);
                }
              },
            ),
            GestureDetector(
              onTap: () => _wiredashConsole.build(context),
              child: ListTile(
                title: Text("Send feedback"),
                leading: Icon(
                  Icons.feedback, // add custom icons also
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                          Animation secondaryAnimation) =>
                      CustomDialog(
                    title: "Logging out",
                    description: "Are you sure you want to logout?",
                    confirmBtnTxt: 'Logout',
                    confirmBtnFnc: () {
                      _authBloc..logOut();
                    },
                  ),
                );
                // _authBloc..logOut();
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => WrapperScreen()),
                //     (route) => false);
              },
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(
                  Icons.exit_to_app, // add custom icons also
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text("Home"),
        ),
        elevation: 0.01,
        backgroundColor: Color(0xFF212121),
        leading: IconButton(
          icon: Icon(EvaIcons.menuOutline),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                position: BadgePosition.topRight(top: 0),
                badgeContent: Text(''),
                animationDuration: Duration(milliseconds: 5000),
                animationType: BadgeAnimationType.slide,
                child: Icon(
                  SimpleLineIcons.bell, // add custom icons also
                ),
                showBadge: false,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xFF212121),
                ),
                child: Column(
                  children: <Widget>[
                    HomeBody(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 15.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Text(
                            'Popular games right now'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.3),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 210,
                      child: HomePopularList(),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Text("screen 2"),
            ),
            Container(
              child: Text("screen 3"),
            ),
            Container(
              child: Text("screen 4"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavyBar(
          containerHeight: 56.0,
          backgroundColor: Color(0xFF212121),
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.game_controller,
                  size: 18.0,
                  color: _currentIndex == 0 ? Colors.white : Colors.white,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.magnifier,
                  size: 18.0,
                  color: _currentIndex == 1 ? Colors.white : Colors.white,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Consoles',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.layers,
                  size: 18.0,
                  color: _currentIndex == 2 ? Colors.white : Colors.white,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.user,
                  size: 18.0,
                  color: _currentIndex == 3 ? Colors.white : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawerHeader(UserDetails user, size) {
  return DrawerHeader(
    child: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: Color(0xFF212121)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularImage(
                NetworkImage(
                    'https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg'
                    // '${user.profilePicUrl}',
                    ),
                width: 75,
                height: 75,
              ),
              // CachedNetworkImage(
              //   imageUrl:
              //       'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
              //   imageBuilder: (context, imageProvider) => Container(
              //     width: 75.0,
              //     height: 75.0,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       image: DecorationImage(
              //           image: imageProvider, fit: BoxFit.cover),
              //     ),
              //   ),
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  '${user.userFirstName} ${user.userLastName}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    decoration: BoxDecoration(
      color: Color(0xFF212121),
    ),
  );
}
