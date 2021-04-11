import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:seller_info/screens/login.dart';

class RegisterScreen extends StatelessWidget {
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
            body: RegisterForm(),
          ),
        ));
  }
}

class RegisterFormBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

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
  // final password2 = TextFieldBloc(
  //   validators: [
  //     FieldBlocValidators.required,
  //     FieldBlocValidators.confirmPassword(LoginFormBloc),
  //   ],
  // );

  RegisterFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        name,
        email,
        password,
      ],
    );
  }

  @override
  void onSubmitting() async {
    print(name.value);
    print(email.value);
    print(password.value);

    await Future<void>.delayed(Duration(seconds: 1));
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(
        builder: (context) {
          final loginFormBloc = context.bloc<RegisterFormBloc>();

          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: FormBlocListener<RegisterFormBloc, String, String>(
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
                              "Please Regsiter Here",
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
                              textFieldBloc: loginFormBloc.name,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(
                                  Icons.people,
                                  color: Color(0xFF0A9B31),
                                ),
                              ),
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
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(90, 0, 30, 0),
                                  child: ButtonTheme(
                                    minWidth: 165.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      color: Color(0xFF0A9B31),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => LoginScreen()),
                                        );
                                      },
                                      child: Text('Submit',
                                          style: TextStyle(
                                              fontFamily: "OpenSans",
                                              color: Colors.white,
                                              fontSize: 20.0)),
                                    ),
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
