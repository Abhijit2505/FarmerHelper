import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:seller_info/screens/details/seller_payment.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/slide_8.png"), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: AddressForm(),
          ),
        ));
  }
}

class AddressFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  final address1 = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  // ignore: close_sinks
  final address2 = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  // ignore: close_sinks
  final city = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  // ignore: close_sinks
  final phone = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  // ignore: close_sinks
  final pincode = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  // ignore: close_sinks
  final altaddress = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  AddressFormBloc() {
    addFieldBlocs(
      fieldBlocs: [address1, address2, city, phone, pincode, altaddress],
    );
  }

  @override
  void onSubmitting() async {
    // print(email.value);
    // print(password.value);

    await Future<void>.delayed(Duration(seconds: 1));
  }
}

class AddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressFormBloc(),
      child: Builder(
        builder: (context) {
          // ignore: close_sinks
          final addressformBloc = context.bloc<AddressFormBloc>();

          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: FormBlocListener<AddressFormBloc, String, String>(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Text(
                                "Seller Details",
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
                                "Please enter your details",
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
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
                          color: Colors.white.withOpacity(0.92),
                        ),
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    40.0, 20.0, 30.0, 0.0),
                                child: Column(
                                  children: [
                                    TextFieldBlocBuilder(
                                      textFieldBloc: addressformBloc.address1,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                        labelText: 'House/flat No',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.home,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: addressformBloc.address2,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        labelText: 'Street/Landmark',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.mapMarked,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: addressformBloc.city,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'City',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: addressformBloc.pincode,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Pincode',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.locationArrow,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: addressformBloc.phone,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        labelText: 'Contact No',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.phone,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: addressformBloc.altaddress,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                        labelText: 'Alternate Address',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.houseUser,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: FloatingActionButton(
                                          child: FaIcon(
                                              FontAwesomeIcons.arrowRight),
                                          autofocus: true,
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.green,
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      PaymentScreen()),
                                            );
                                          }),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
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
