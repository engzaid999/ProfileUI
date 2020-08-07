import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileui/profiles/profile5/user5.dart';

class Profile5 extends StatefulWidget {
  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5>
    with SingleTickerProviderStateMixin {
  Profile _profile = Profile5Provider.getProfile();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _bodyPart1(context),
          SizedBox(
            height: 10,
          ),
          Flexible(child: _tabBarPart2(context)),
        ],
      ),
    );
  }

  Widget _bodyPart1(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/sheard/zaid.jpg'),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            _profile.user5.name,
            style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _profile.user5.address,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
              child: Text(
                '    FOLLOW    ',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              color: Colors.deepOrange[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget _tabBarPart2(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey[200]),
                  bottom: BorderSide(color: Colors.grey[200]))),
          child: TabBar(
              labelColor: Colors.black54,
              unselectedLabelColor: Colors.grey[400],
              indicatorColor: Colors.black54,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 32),
              indicatorWeight: 3,
              controller: _tabController,
              tabs: <Widget>[
                Tab(text: 'PHOTOS'),
                Tab(text: 'VIDEOS'),
                Tab(text: 'POSTS'),
                Tab(text: 'FRIENDS'),
              ]),
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _photos(context),
              _videos(context),
              _posts(context),
              _friends(context)
            ],
          ),
        ),
      ],
    );
  }

  _photos(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: Profile5Provider.photos().map((photo) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(photo), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            );
          }).toList()),
    );
  }

  _videos(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: Profile5Provider.photos().map((photo) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(photo), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          );
        }).toList(),
      ),
    );
  }

  _posts(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: List.generate(15, (index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/sheard/daniel.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          );
        }),
      ),
    );
  }

  _friends(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: List.generate(15, (index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/sheard/daniel.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          );
        }),
      ),
    );
  }
}
