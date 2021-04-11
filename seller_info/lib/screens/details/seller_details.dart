import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:seller_info/screens/details/seller_payment.dart';
import 'package:seller_info/screens/dashboard/dashboard.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/slide_10.png"), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: DetailForm(),
          ),
        ));
  }
}

class DetailFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  final type = SelectFieldBloc(
    items: ['Farmer', 'Vegetable Seller', 'Regional Retailer'],
  );

  // ignore: close_sinks
  final category = SelectFieldBloc(
    items: ['Regular Seller', 'First Time Seller'],
  );

  DetailFormBloc() {
    addFieldBlocs(
      fieldBlocs: [type, category],
    );
  }

  @override
  void onSubmitting() async {
    // print(email.value);
    // print(password.value);

    await Future<void>.delayed(Duration(seconds: 1));
  }
}

class DetailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailFormBloc(),
      child: Builder(
        builder: (context) {
          // ignore: close_sinks
          final detailformBloc = context.bloc<DetailFormBloc>();

          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: FormBlocListener<DetailFormBloc, String, String>(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 180.0, 20.0, 60.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Text(
                                "Specific Details",
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Choose the correct option",
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   width: 0,
                          //   color: Color(0xFF0A9B31),
                          // ),
                          color: Colors.white.withOpacity(0.96),
                        ),
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    40.0, 40.0, 30.0, 0.0),
                                child: Column(
                                  children: [
                                    DropdownFieldBlocBuilder<String>(
                                      selectFieldBloc: detailformBloc.type,
                                      decoration: InputDecoration(
                                        labelText: 'Type',
                                        hintText: 'Select seller type',
                                        prefixIcon: SizedBox(),
                                      ),
                                      itemBuilder: (context, item) => item,
                                    ),
                                    DropdownFieldBlocBuilder<String>(
                                      selectFieldBloc: detailformBloc.category,
                                      decoration: InputDecoration(
                                        labelText: 'Category',
                                        hintText: 'Select seller category',
                                        prefixIcon: SizedBox(),
                                      ),
                                      itemBuilder: (context, item) => item,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: FloatingActionButton(
                                              heroTag: "btn1",
                                              child: FaIcon(
                                                  FontAwesomeIcons.arrowLeft),
                                              autofocus: true,
                                              backgroundColor: Colors.white,
                                              foregroundColor:
                                                  Color(0xFF0A9B31),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          PaymentScreen()),
                                                );
                                              }),
                                        ),
                                        Container(
                                          child: FloatingActionButton(
                                            heroTag: 'btn2',
                                            child: FaIcon(
                                                FontAwesomeIcons.arrowRight),
                                            autofocus: true,
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xFF0A9B31),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) => CustomDialog(
                                                      title: 'Success !',
                                                      content:
                                                          'Congratulations, you have successfully created your profile',
                                                      positiveBtnText:
                                                          'Go To Profile',
                                                      negativeBtnText: 'Back',
                                                      positiveBtnPressed: null),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, content, positiveBtnText, negativeBtnText;
  final GestureTapCallback positiveBtnPressed;

  CustomDialog({
    @required this.title,
    @required this.content,
    @required this.positiveBtnText,
    @required this.negativeBtnText,
    @required this.positiveBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/slide_12.png"), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _buildDialogContent(context),
          ),
        ));
  }

  Widget _buildDialogContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 120.0, 18.0, 20.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                // Bottom rectangular box
                margin: EdgeInsets.only(
                    top: 45), // to push the box half way below circle
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.only(
                    top: 60, left: 20, right: 20), // spacing inside the box
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      content,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ButtonBar(
                      buttonMinWidth: 100,
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            negativeBtnText,
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18.0,
                              color: Color(0xFF0A9B31),
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text(
                            positiveBtnText,
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18.0,
                              color: Color(0xFF0A9B31),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => DashboardScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                // Top Circle with icon
                maxRadius: 50.0,
                child: FaIcon(
                  FontAwesomeIcons.check,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(38.0, 40.0, 38.0, 0.0),
          child: Text(
            "Thank you for using our product, we are glad to have you onboard",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 22.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 27.0,
          width: 120.0,
          child: Divider(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
