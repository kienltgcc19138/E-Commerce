import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_ecommerce/constant/asset_images.dart';
import 'package:youtube_ecommerce/constant/routes.dart';
import 'package:youtube_ecommerce/screens/auth_ui/login/login.dart';
import 'package:youtube_ecommerce/screens/auth_ui/sign_up/sign_up.dart';
import 'package:youtube_ecommerce/widgets/primary_button/primary_button.dart';
import 'package:youtube_ecommerce/widgets/top_titles/top_titles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  subtitle: 'Buy Any Items From Using App', title: 'Welcome'),
              Center(
                child: Image.asset(
                  AssetsImages.instance.welcomeImage,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.facebook,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      AssetsImages.instance.googleLogo,
                      scale: 17.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              PrimaryButton(
                title: 'Login', 
                onPressed: () {
                  Routes.instance.push(widget: const Login(), context: context);
                }
              ),
              const SizedBox(
                height: 18.0,
              ),
              PrimaryButton(title: 'Sign Up', onPressed: () {
                Routes.instance.push(widget: const SignUp(), context: context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
