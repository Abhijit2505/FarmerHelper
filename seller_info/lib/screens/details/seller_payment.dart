import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:seller_info/screens/details/seller_address.dart';
import 'package:seller_info/screens/details/seller_details.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/slide_9.png"), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PaymentForm(),
          ),
        ));
  }
}

class PaymentFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  final name = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  // ignore: close_sinks
  final cardnumber = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  // ignore: close_sinks
  final cvv = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  // ignore: close_sinks
  final validfrom = InputFieldBloc<DateTime, Object>(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  // ignore: close_sinks
  final validupto = InputFieldBloc<DateTime, Object>(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  PaymentFormBloc() {
    addFieldBlocs(
      fieldBlocs: [name, cardnumber, cvv, validfrom, validupto],
    );
  }

  @override
  void onSubmitting() async {
    // print(email.value);
    // print(password.value);

    await Future<void>.delayed(Duration(seconds: 1));
  }
}

class PaymentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentFormBloc(),
      child: Builder(
        builder: (context) {
          // ignore: close_sinks
          final paymentformBloc = context.bloc<PaymentFormBloc>();

          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: FormBlocListener<PaymentFormBloc, String, String>(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Text(
                                "Payment Details",
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
                                "Enter payment details",
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
                                      textFieldBloc: paymentformBloc.name,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: 'Name on the Card',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.user,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: paymentformBloc.cardnumber,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Card Number',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.creditCard,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: paymentformBloc.cvv,
                                      keyboardType: TextInputType.number,
                                      suffixButton: SuffixButton.obscureText,
                                      decoration: InputDecoration(
                                        labelText: 'CVV',
                                        prefixIcon: FaIcon(
                                          FontAwesomeIcons.key,
                                          color: Color(0xFF0A9B31),
                                        ),
                                      ),
                                    ),
                                    DateTimeFieldBlocBuilder(
                                      dateTimeFieldBloc:
                                          paymentformBloc.validfrom,
                                      format: DateFormat('dd-mm-yyyy'),
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      decoration: InputDecoration(
                                        labelText: 'ValidFrom',
                                        prefixIcon: FaIcon(
                                            FontAwesomeIcons.calendarAlt,
                                            color: Color(0xFF0A9B31)),
                                        helperText: 'Date',
                                      ),
                                    ),
                                    DateTimeFieldBlocBuilder(
                                      dateTimeFieldBloc:
                                          paymentformBloc.validupto,
                                      format: DateFormat('dd-mm-yyyy'),
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      decoration: InputDecoration(
                                        labelText: 'ValidUpto',
                                        prefixIcon: FaIcon(
                                            FontAwesomeIcons.calendarCheck,
                                            color: Color(0xFF0A9B31)),
                                        helperText: 'Date',
                                      ),
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
                                              foregroundColor: Colors.green,
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          AddressScreen()),
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
                                              foregroundColor: Colors.green,
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          DetailScreen()),
                                                );
                                              }),
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
