import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seller_info/screens/dashboard/profilePage.dart';
import 'package:seller_info/screens/dashboard/contactus.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardPage(),
        '/profile': (context) => ProfileScreen(),
        // '/education': (context) => EducationPage(),
        // '/workexperience': (context) => WorkExpPage(),
        // '/skills': (context) => Skills(),
        // '/project': (context) => project(),
      },
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/slide_8.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Dashboard",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0A9B31),
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.cog,
                color: Color(0xFF0A9B31),
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.shareAlt,
                color: Color(0xFF0A9B31),
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: GridView.count(crossAxisCount: 2, children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.seedling,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Add Product",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22.0,
                            color: Color(0xFF0A9B31),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.rupeeSign,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "Previous Sales",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22.0,
                            color: Color(0xFF0A9B31),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.chartPie,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "Your Stats",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22.0,
                            color: Color(0xFF0A9B31),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.star,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "Reviews",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22.0,
                            color: Color(0xFF0A9B31),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.user,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        FlatButton(
                          child: Text(
                            "Profile",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 22.0,
                              color: Color(0xFF0A9B31),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        FlatButton(
                          child: Text(
                            "Contact Us",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 22.0,
                              color: Color(0xFF0A9B31),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => ContactScreen()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.gifts,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "Gifts /Coupons",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22.0,
                            color: Color(0xFF0A9B31),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: Card(
                  color: Colors.white.withOpacity(0.94),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.fileAlt,
                          size: 55,
                          color: Color(0xFF0A9B31),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "Terms",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22.0,
                            color: Color(0xFF0A9B31),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
