import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/screens/bottom_nav.dart';
import 'package:flutter_game_shop/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChange = false;
  bool isShow = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _repeatPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarSection(context),
              MainSection(),
              BottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Column BottomSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            fixedSize: const Size(300, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate() && isChange) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BottomNavWidget(),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text('Warning!'),
                    content: const Text('Complete inputs'),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Return'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text('Sign Up'),
        ),
        const SizedBox(height: 10),
        Text(
          'Already  have account !',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: const Text(
            'Sign in From Here',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Column MainSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text(
          'Create Account',
          style: TextStyle(
            color: primaryColor,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 17.5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.grey.shade900,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              suffixIcon: const Icon(Icons.person),
              suffixIconColor: Colors.grey.shade900,
              // labelText: 'Label Text',
              hintText: 'User name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Username can not be empty !!!';
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 17.5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.grey.shade900,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              suffixIcon: const Icon(Icons.email_outlined),
              suffixIconColor: Colors.grey.shade900,
              // labelText: 'Label Text',
              hintText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email can not be empty !!!';
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isShow,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 17.5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.grey.shade900,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (isShow == false) {
                      isShow = true;
                    } else {
                      isShow = false;
                    }
                  });
                },
                icon: isShow
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              suffixIconColor: Colors.grey.shade900,
              prefixIcon: const Icon(Icons.lock_outlined),
              prefixIconColor: Colors.grey.shade900,
              hintText: 'Password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password can not be empty!!!';
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: _repeatPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isShow,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 17.5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.grey.shade900,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (isShow == false) {
                      isShow = true;
                    } else {
                      isShow = false;
                    }
                  });
                },
                icon: isShow
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              suffixIconColor: Colors.grey.shade900,
              prefixIcon: const Icon(Icons.lock_outlined),
              prefixIconColor: Colors.grey.shade900,
              hintText: 'Repeat Password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Repeat Password can not be empty!!!';
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: primaryColor,
                value: isChange,
                onChanged: (state) {
                  setState(() {
                    isChange = state!;
                  });
                },
              ),
              const Text('agree to the'),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor,
                ),
                onPressed: () {},
                child: Text(
                  'Terms and condition',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ClipPath appBarSection(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: 180,
        width: double.infinity,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
