import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileui/profiles/profile3/user3.dart';
import 'provider3.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile profile = Profile3Provider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/profiles/vino.gif',
          fit: BoxFit.fitHeight,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              _body(context),
              _profImage(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Positioned(
      left: 15,
      right: 15,
      top: MediaQuery.of(context).size.height * 0.09,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: ListView(
            children: <Widget>[
              Text(
                profile.user.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                profile.user.address,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  child: _followButton(context),
                ),
              ),
              _divider(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _counters(context),
              ),
              _divider(context),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'PHOTOS (${profile.photos.toString()})',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                ),
              ),
              _photos(context),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20),
                child: Text('ABOUT ME ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  profile.user.about,
                  style: TextStyle(fontSize: 18, letterSpacing: 0.1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20),
                child: Text('FRIENDS (${profile.friends.toString()}) ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              _contacts(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.09 - 50,
      left: MediaQuery.of(context).size.width / 2 - 50,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
              'assets/sheard/zaid.jpg',
            ),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      child: FlatButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            'FOLLOW',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 1,
        color: Colors.grey.shade300,
      ),
    );
  }

  TextStyle _contactBarNumber = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );

  TextStyle _contactBarText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
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
                profile.followers.toString(),
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
                profile.following.toString(),
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
                profile.friends.toString(),
                style: _contactBarNumber,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _photos(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 125,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(profile.photos, (index) {
            return Container(
              width: 125,
              height: 125,
              margin: EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/sheard/daniel.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _contacts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 15,bottom: 15),
      child: Container(
          width: double.infinity,
          height: 75,
          child:ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(20, (index){
              return Container(
                width: 75,
                margin: EdgeInsets.only(right: 24),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/sheard/daniel.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              );
            }).toList(),
          )
      ),
    );
  }
}
