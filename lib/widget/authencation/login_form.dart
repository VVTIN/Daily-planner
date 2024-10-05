import 'package:flutter/material.dart';

import 'package:flutter_application_1/config/colors.dart';
import 'package:flutter_application_1/homePage.dart';

import 'package:flutter_application_1/widget/authencation/divider.dart';
import 'package:flutter_application_1/widget/authencation/social_button.dart';
import 'package:get/get.dart';

import '../../config/sizes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FocusNode _focusNode = FocusNode();

  bool isObscure = true;
  bool isChecked = false;

  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TSizes.buffer,
      child: ListView(
        children: [
          SizedBox(height: TSizes.spacing * 2),

          //email
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              hintText: 'Tên đăng nhập',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItem),

          //password
          TextFormField(
            focusNode: _focusNode,
            obscureText: isObscure,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password),
              suffixIcon: _focusNode.hasFocus
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : null,
              hintText: 'Mật khẩu',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),

          // feature button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? true;
                      });
                    },
                    activeColor: TColors.black,
                  ),
                  const Text('Lưu đăng nhập')
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Quên mật khẩu',
                  style: TextStyle(color: TColors.black),
                ),
              )
            ],
          ),

          //button login
          SizedBox(
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(HomePage()),
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.black,
              ),
              child: Text(
                'Đăng nhập',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: TColors.white),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItem),

          //Divider
          const DividerOr(),
          SizedBox(height: TSizes.spaceBtwItem),

          //button social
          const SocialButton(),
        ],
      ),
    );
  }
}
