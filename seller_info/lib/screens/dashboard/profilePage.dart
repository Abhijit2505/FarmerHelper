import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seller_info/screens/dashboard/dashboard.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/slide_14.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ProfilePage(),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool onWillPop() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );
      return false;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 70, 15, 20),
      child: WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 45),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xFF0A9B31),
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.only(
                          top: 60,
                          left: 20,
                          right: 20), // spacing inside the box
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Abhijit Tripathy',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'abhijittripathy99@gmail.com',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18.0,
                              color: Color(0xFF0A9B31),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                            height: 25.0,
                            width: 300.0,
                            child: Divider(
                              color: Color(0xFF0A9B31),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      '10',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 30.0,
                                        color: Color(0xFF0A9B31),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Products',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 17.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      '4.9',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 30.0,
                                        color: Color(0xFF0A9B31),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Rating',
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 17.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xFF0A9B31),
                      maxRadius: 47.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 45.0,
                        child: Image(
                          image: AssetImage('assets/slide_13.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
                  width: 600.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFF0A9B31),
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your Details',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0A9B31),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15.0,
                        width: 350.0,
                        child: Divider(
                          color: Color(0xFF0A9B31),
                        ),
                      ),
                      Text(
                        'Jail Colony, District Jail, Keonjhargarh, Odisha, India',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15.0,
                        width: 350.0,
                        child: Divider(
                          color: Color(0xFF0A9B31),
                        ),
                      ),
                      Text(
                        'Regional Retailer',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15.0,
                        width: 350.0,
                        child: Divider(
                          color: Color(0xFF0A9B31),
                        ),
                      ),
                      Text(
                        'Regular Seller',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
                  width: 600.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFF0A9B31),
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      Card(
                          child: ListTile(
                              title: Text(
                        'Utility Options',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A9B31),
                        ),
                        textAlign: TextAlign.center,
                      ))),
                      Card(
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.cog,
                            color: Color(0xFF0A9B31),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Color(0xFF0A9B31),
                          ),
                          title: Text(
                            'App Settings',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.database,
                            color: Color(0xFF0A9B31),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Color(0xFF0A9B31),
                          ),
                          title: Text(
                            'Your Data',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.bell,
                            color: Color(0xFF0A9B31),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Color(0xFF0A9B31),
                          ),
                          title: Text(
                            'Notifications',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.headset,
                            color: Color(0xFF0A9B31),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Color(0xFF0A9B31),
                          ),
                          title: Text(
                            'Help & Support',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.signOutAlt,
                            color: Color(0xFF0A9B31),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Color(0xFF0A9B31),
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
