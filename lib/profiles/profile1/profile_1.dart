import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileui/profiles/profile1/user.dart';
import 'provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile = Profile1Provider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          fontFamily: 'Comfortaa',
        ),
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/profiles/mark.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.50,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'PROFILE',
                  style: TextStyle(letterSpacing: 1.1),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(FontAwesomeIcons.bars),
                  onPressed: () {
                    // empty
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.cog),
                    onPressed: () {
                      //empty
                    },
                  )
                ],
              ),
              body: Container(
                  child: Stack(
                children: <Widget>[
                  CustomPaint(
                    painter: PorofilePainter(),
                    child: Container(),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.38,
                    top: MediaQuery.of(context).size.height * 0.22,
                    child: CircleAvatar(
                      minRadius: 45,
                      backgroundImage:
                          ExactAssetImage('assets/sheard/daniel.jpg'),
                    ),
                  ),
                  _bodyText(context),
                  _bottomBar(context),
                ],
              )),
            ),
          ],
        ));
  }

  TextStyle _buttomBarText = TextStyle(
      fontFamily: 'Roboto', fontWeight: FontWeight.w300, fontSize: 10);

  TextStyle _buttomBarNumber =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  Widget _bottomBar(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 25,
      right: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'FOLLOWERS',
                style: _buttomBarText,
              ),
              SizedBox(height: 5),
              Text(
                profile.followers.toString(),
                style: _buttomBarNumber,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text('FOLLOWING', style: _buttomBarText),
              SizedBox(height: 5),
              Text(
                profile.following.toString(),
                style: _buttomBarNumber,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text('FRIENDS', style: _buttomBarText),
              SizedBox(height: 5),
              Text(
                profile.friends.toString(),
                style: _buttomBarNumber,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodyText(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.37,
      bottom: 0,
      right: 25,
      left: 25,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                profile.user.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: Colors.grey,
                ),
                Text(
                  profile.user.address,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, bottom: 8),
              child: Text(
                'ABOUT ME ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                profile.user.about,
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.1,
                    height: 1.2,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PorofilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    paint.color = Colors.white;

    path.lineTo(0, size.height * 0.22);
    path.lineTo(size.width / 2, size.height / 2 * 0.70);
    path.lineTo(size.width, size.height * 0.22);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.35);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
