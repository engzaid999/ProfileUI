import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileui/profiles/profile4/ptovider4.dart';
import 'package:profileui/profiles/profile4/user4.dart';

class Profile4 extends StatefulWidget {
  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  Profile _profile = Profile4Provider.getProfile();

  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _visible = true;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/profiles/old man.jpg',
          fit: BoxFit.cover,
//          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,



            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _visible ? 1 : 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: _profileContante(context),
              ),
            ),



          ),
        )
      ],
    );
  }

  Widget _profileContante(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sheard/zaid.jpg'),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                RaisedButton(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Text(
                    'ADD FRIEND',
                    style: TextStyle(fontSize: 12),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black38, width: 1.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  elevation: 0,
                  color: Colors.black38,
                  child: Text(
                    'FOLLOW',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _profile.user4.name,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _profile.user4.address,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _profile.user4.about,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          _divider(context),
          Expanded(child: _counters(context)),
        ],
      ),
    );
  }

// Addition Widget
  TextStyle _contactBarNumber = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );

  TextStyle _contactBarText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );

  Widget _divider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: 1,
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'FOLLOWERS',
                style: _contactBarText,
              ),
              SizedBox(height: 5),
              Text(
                _profile.followers.toString(),
                style: _contactBarNumber,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FOLLOWING',
                style: _contactBarText,
              ),
              SizedBox(height: 5),
              Text(
                _profile.following.toString(),
                style: _contactBarNumber,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FRIENDS',
                style: _contactBarText,
              ),
              SizedBox(height: 5),
              Text(
                _profile.friends.toString(),
                style: _contactBarNumber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
