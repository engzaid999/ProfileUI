import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:profileui/profiles/profile2/user2.dart';
import 'provider2.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {

  //Call Profile2Provider by Profile class for access to getProfile() method
  Profile profile = Profile2Provider.getProfile();

  @override
  Widget build(BuildContext context) {
    //Using Theme for select one font type for all project
    return Theme(
      data: ThemeData(
        fontFamily: 'Comfortaa',
      ),
      child: Stack(
        children: <Widget>[
          //This profile image
          Image.asset(
            'assets/profiles/jason.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(FontAwesomeIcons.bars),
                onPressed: () {},
              ),
            ),
            body: Stack(
              children: <Widget>[
                _profileTitle(context),
                _bodyContant(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle _contactBarNumber =
  TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle _contactBarText = TextStyle(
      fontFamily: 'Roboto', fontWeight: FontWeight.w300, fontSize: 12);

  Widget _profileTitle(BuildContext context) {
    return Positioned(
      top: 20,
      left: 0,
      right: 0,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
              Center(
                //Personal image
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: ExactAssetImage('assets/sheard/zaid.jpg'),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              profile.user.name,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1.4),
            ),
          ),
          Text(
            profile.user.address,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyContant(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _counters(context),
            _drovider(context),
            _about(context),
            _friends(context),
            _contacts(context),
          ],
        ),
      ),
    );
  }

  Widget _drovider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 1,
        color: Colors.grey.shade200,
      ),
    );
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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

  Widget _about(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top:30),
          child: Text(
            'ABOUT ME',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            profile.user.about,
            style: TextStyle(
                fontSize: 12,
                letterSpacing: 1.1,
                height: 1.2,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }

  Widget _friends(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
      child: Text(
        'FRIENDS ( ${profile.friends.toString()} )',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

 Widget _contacts(BuildContext context) {
    return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 30),
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
        )
    );
 }
}
