import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import 'components/background.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const LoginScreenTopImage(),
              Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 8,
                    child: LoginForm(),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}