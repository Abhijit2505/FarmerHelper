import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:seller_info/screens/login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 270.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontFamily: 'OpenSans', fontSize: 16.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'OpenSans',
      ),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white30,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Welcome Dear Farmer",
          body:
              "The farmer is the only man in our economy who buys everything at retail, sells everything at wholesale, and pays the freight both ways.",
          image: _buildImage('slide_1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "A Platform For Farmers",
          body: "Sell your product with your own profits",
          image: _buildImage('slide_2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fruits, Veggies & What Not !!",
          body:
              "Sell your farming products to the entire city and reach a bettwwr group of customers",
          image: _buildImage('slide_3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Mobility At Your Hands",
          body:
              "Either sell in your shop, or in your home or deliver it directly to the customer",
          image: _buildImage('slide_4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get The Best Price",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click below & get started ", style: bodyStyle),
            ],
          ),
          image: _buildImage('slide_5'),
          footer: ButtonTheme(
            minWidth: 140.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                _onIntroEnd(context);
              },
              child: const Text(
                'Lets Start',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    color: Colors.white),
              ),
              color: Color(0xFF0A9B31),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip',
          style:
              TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(14.0, 14.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.green,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
