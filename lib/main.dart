import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import 'page1.dart';
import 'page2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routewise',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF070C16),
      ),


      home: const AnimatedSplashScreen(),
    );
  }
}

class AnimatedSplashScreen extends StatelessWidget {
  const AnimatedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0.5,
            end: 5,
          ),

          duration: const Duration(seconds: 6),
          curve: Curves.easeInSine,

          onEnd: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                const MyHomePage(title: 'Routewise Login'),
              ),
            );
          },

          builder: (context, scaleValue, child) {
            return Transform.scale(
              scale: scaleValue,
              child: child,
            );
          },

          child: Container(
            width: 100,
            height: 100,

            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),

            child: Image.asset(
              'assets/images/output_image.png',
              width: 50,
              height: 50,
            ),

            /*
            Previous icon code:

            child: const Icon(
              Icons.eco_outlined,
              size: 50,
              color: Colors.black,
            ),
            */
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  bool hidepassword = true;

  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text;


    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your email and password',
          ),
        ),
      );

      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const page1(),
        ),
      );

    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'user-not-found':
          message = 'No account found with this email.';
          break;

        case 'wrong-password':
        case 'invalid-credential':
          message = 'Incorrect email or password.';
          break;

        case 'invalid-email':
          message = 'Please enter a valid email address.';
          break;

        case 'user-disabled':
          message = 'This account has been disabled.';
          break;

        case 'too-many-requests':
          message =
          'Too many attempts. Please try again later.';
          break;

        case 'network-request-failed':
          message =
          'Please check your internet connection.';
          break;

        case 'operation-not-allowed':
          message =
          'Email and password login is not enabled in Firebase.';
          break;

        default:
          message = e.message ?? 'Login failed.';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 4),
        ),
      );

    } catch (e) {
      debugPrint('Firebase login error: $e');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 6),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: const Color(0xFF070C16),
        centerTitle: true,

        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Route',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFFFFC400),
                ),
              ),

              TextSpan(
                text: 'Wise',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              // WELCOME TEXT
              const Text(
                'Welcome! Please Sign In ',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFAEB9CE),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              TextField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),

                decoration: InputDecoration(
                  hintText: 'Email or Phone',

                  hintStyle: const TextStyle(
                    color: Color(0xFFAEB9CE),
                    fontSize: 15,
                  ),

                  filled: true,
                  fillColor: const Color(0xFF151A24),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF6264F2),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,

                obscureText: hidepassword,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),

                decoration: InputDecoration(
                  hintText: 'Password',

                  hintStyle: const TextStyle(
                    color: Color(0xFFAEB9CE),
                    fontSize: 18,
                  ),

                  filled: true,
                  fillColor: const Color(0xFF151A24),


                  suffixIcon: IconButton(
                    icon: Icon(
                      hidepassword
                          ? Icons.visibility_off
                          : Icons.visibility,

                      color: const Color(0xFFAEB9CE),
                    ),

                    onPressed: () {
                      setState(() {
                        hidepassword = !hidepassword;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF6264F2),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(

                  onPressed: loginUser,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6264F2),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),

                  child: const Text(
                    'Log in',

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'or',

                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFAEB9CE),
                ),
              ),

              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  SizedBox(
                    width: 100,
                    height: 50,

                    child: OutlinedButton(

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const page2(),
                          ),
                        );
                      },

                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFF151A24),

                        side: const BorderSide(
                          color: Color(0xFF303747),
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),

                      child: const Text(
                        'sign up',

                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6264F2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
