import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:seller_info/screens/register.dart';
import 'package:seller_info/screens/details/seller_address.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/slide_11.png"), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: LoginForm(),
          ),
        ));
  }
}

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
      ],
    );
  }

  @override
  void onSubmitting() async {
    print(email.value);
    print(password.value);

    await Future<void>.delayed(Duration(seconds: 1));
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final loginFormBloc = context.bloc<LoginFormBloc>();

          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: FormBlocListener<LoginFormBloc, String, String>(
              // onSubmitting: (context, state) {
              //   LoadingDialog.show(context);
              // },
              // onSuccess: (context, state) {
              //   LoadingDialog.hide(context);

              //   Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(builder: (_) => SuccessScreen()));
              // },
              // onFailure: (context, state) {
              //   LoadingDialog.hide(context);

              //   Scaffold.of(context).showSnackBar(
              //       SnackBar(content: Text(state.failureResponse)));
              // },
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                        child: Column(
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF0A9B31),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Please Login to continue",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0A9B31),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: loginFormBloc.email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFF0A9B31),
                                ),
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: loginFormBloc.password,
                              suffixButton: SuffixButton.obscureText,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xFF0A9B31),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "No account ? Register now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16.0,
                                color: Color(0xFF0A9B31),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.0,
                                ),
                                ButtonTheme(
                                  minWidth: 140.0,
                                  height: 50.0,
                                  child: RaisedButton(
                                    color: Color(0xFF0A9B31),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => AddressScreen()),
                                      );
                                    },
                                    child: Text('Submit',
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            color: Colors.white,
                                            fontSize: 18.0)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                ButtonTheme(
                                  minWidth: 155.0,
                                  height: 50.0,
                                  child: RaisedButton(
                                    color: Color(0xFF0A9B31),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => RegisterScreen()),
                                      );
                                    },
                                    child: Text('Register',
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            color: Colors.white,
                                            fontSize: 18.0)),
                                  ),
                                ),
                              ],
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
        },
      ),
    );
  }
}
