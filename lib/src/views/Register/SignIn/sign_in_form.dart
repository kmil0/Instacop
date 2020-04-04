import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/views/Register/SignIn/sign_in_controller.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/input_text.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool _isAdmin = false;
  SignInController signInController = new SignInController();
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //TODO: Username
        StreamBuilder(
          stream: signInController.emailStream,
          builder: (context, snapshot) => InputText(
            title: 'Email',
            errorText: snapshot.hasError ? snapshot.error : '',
            onValueChange: (value) {
              _email = value;
            },
          ),
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Password
        StreamBuilder(
          stream: signInController.passwordStream,
          builder: (context, snapshot) => InputText(
            title: 'Password',
            isPassword: true,
            errorText: snapshot.hasError ? snapshot.error : '',
            onValueChange: (value) {
              _password = value;
            },
          ),
        ),
        //TODO: Button Sign In
        SizedBox(
          height: ConstScreen.setSizeHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //TODO: Admin
            Expanded(
              child: MaterialButton(
                height: ConstScreen.setSizeHeight(90),
                color: _isAdmin ? kColorBlack : kColorWhite,
                child: Text(
                  'MANAGER',
                  style: TextStyle(
                      color: _isAdmin ? kColorWhite : kColorBlack,
                      fontSize: FontSize.s30),
                ),
                onPressed: () {
                  setState(() {
                    _isAdmin = true;
                  });
                },
              ),
            ),
            //TODO: Customer
            Expanded(
              child: MaterialButton(
                height: ConstScreen.setSizeHeight(90),
                color: _isAdmin ? kColorWhite : kColorBlack,
                child: Text(
                  'CUSTOMER',
                  style: TextStyle(
                      color: _isAdmin ? kColorBlack : kColorWhite,
                      fontSize: FontSize.s30),
                ),
                onPressed: () {
                  setState(() {
                    _isAdmin = false;
                  });
                },
              ),
            ),
          ],
        ),

        SizedBox(
          height: ConstScreen.setSizeHeight(25),
        ),
        CusRaisedButton(
          backgroundColor: kColorBlack,
          title: 'SIGN IN',
          onPress: () {
            signInController.onSubmitSignIn(
                email: _email, password: _password, isAdmin: _isAdmin);
//            if (_isAdmin) {
//              Navigator.pushNamed(context, 'admin_home_screen');
//            } else {
//              Navigator.pushNamed(context, 'customer_home_screen');
//            }
          },
        )
      ],
    );
  }
}