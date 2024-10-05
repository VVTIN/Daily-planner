import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/config/sizes.dart';

import '../../config/colors.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  FocusNode focusNode = FocusNode();
  FocusNode _focusNode = FocusNode();
  bool isVisible = true;
  bool isVisible_off = true;

  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
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
          Row(
            children: [
              //Surname
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Họ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwItem),

              //name
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_pin_rounded),
                    hintText: 'Tên',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItem),

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
            obscureText: isVisible,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: 'Mật khẩu',
              prefixIcon: Icon(Icons.password),
              suffixIcon: focusNode.hasFocus
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItem),

          //RePassword
          TextFormField(
            obscureText: isVisible_off,
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: 'Nhập lại mật khẩu',
              prefixIcon: Icon(Icons.password),
              suffixIcon: _focusNode.hasFocus
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible_off = !isVisible_off;
                        });
                      },
                      icon: Icon(
                        isVisible_off ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItem),

          //signup button
          SizedBox(
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.black,
              ),
              child: Text(
                'Đăng ký',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: TColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
