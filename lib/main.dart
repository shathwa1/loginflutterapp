import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const primaryColor = Color.fromRGBO(120, 45, 255, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _usernameError;
  String? _passwordError;
  String? _emailError;


  void _validateUsername(String value) {
    if (value.isEmpty) {
      setState(() {
        _usernameError = 'User name cannot be empty';
      });
    } else if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value)) {
      setState(() {
        _usernameError = 'User name must contain letters and spaces only';
      });
    } else if (value.split(' ').length < 3) {  //
      setState(() {
        _usernameError = 'Please enter full name (First Name, Father Name, Grandfather Name)';
      });
    } else {
      setState(() {
        _usernameError = null; //
      });
    }
  }

  //
  void _validatePassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _passwordError = 'Password cannot be empty';
      });
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      setState(() {
        _passwordError = 'Password must be exactly 10 digits';
      });
    } else {
      setState(() {
        _passwordError = null; //
      });
    }
  }

  //
  void _validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailError = 'Email cannot be empty';
      });
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      setState(() {
        _emailError = 'Enter a valid email';
      });
    } else {
      setState(() {
        _emailError = null; // الإدخال صحيح
      });
    }
  }

  //
  void _login() {
    //
    _validateUsername(_usernameController.text);
    _validatePassword(_passwordController.text);
    _validateEmail(_emailController.text);

    if (_usernameError == null && _passwordError == null && _emailError == null) {
      //
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    } else {
      //
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors before proceeding.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 2100),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1800),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyApp.primaryColor),
                        boxShadow: [
                          BoxShadow(
                            color: MyApp.primaryColor.withOpacity(0.10),
                            blurRadius: 20.0,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'User Name',
                              hintStyle: const TextStyle(color: Colors.white),
                              errorText: _usernameError,
                            ),
                            style: const TextStyle(fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\u0600-\u06FF\s]')) //
                            ],
                            onChanged: _validateUsername,
                          ),
                          const Divider(),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.white),
                              errorText: _passwordError,
                            ),
                            style: const TextStyle(fontSize: 20),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: _validatePassword,
                          ),
                          const Divider(),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: Colors.white),
                              errorText: _emailError,
                            ),
                            style: const TextStyle(fontSize: 20),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: _validateEmail,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInUp(
                    duration: const Duration(milliseconds: 2000),
                    child: GestureDetector(
                      onTap: _login,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.green,
                              Colors.green.withOpacity(0.3),
                            ],
                          ),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  FadeInUp(
                    duration: const Duration(milliseconds: 2200),
                    child: Column(
                      children: [
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.black, //
                            fontSize: 16, //
                            fontWeight: FontWeight.bold, //
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Develped by shathwa alaswad',
                          style: TextStyle(
                            color: Colors.orange, //
                            fontSize: 15, //
                            fontWeight: FontWeight.bold, //
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome shathwa',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
