import 'package:flutter/material.dart';
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
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image container with background and animated light image
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
              // Padding for content below the image section
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
                          border: Border.all(color: primaryColor),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.10),
                              blurRadius: 20.0,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'user name',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Divider(),
                            TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'password',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondPage()),
                          );
                        },
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
                        children: const [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            'Developed by Shathwa Alaswad',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
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
      ),
    );
  }
}
git push -u origin main
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
          'Welcome to the second page!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
