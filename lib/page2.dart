
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'page1.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  bool hidepassword = true;
  bool hidepassword1 = true;
  bool isLoading = false;

  final TextEditingController fullNameController =
  TextEditingController();

  final TextEditingController emailOrPhoneController =
  TextEditingController();

  final TextEditingController countryController =
  TextEditingController();

  final TextEditingController divisionController =
  TextEditingController();

  final TextEditingController districtController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailOrPhoneController.dispose();
    countryController.dispose();
    divisionController.dispose();
    districtController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }


  Future<void> signUp() async {
    String fullName = fullNameController.text.trim();
    String email = emailOrPhoneController.text.trim();
    String country = countryController.text.trim();
    String division = divisionController.text.trim();
    String district = districtController.text.trim();

    String password = passwordController.text;
    String confirmPassword =
        confirmPasswordController.text;


    if (fullName.isEmpty ||
        email.isEmpty ||
        country.isEmpty ||
        division.isEmpty ||
        district.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all the fields'),
        ),
      );
      return;
    }


    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return;
    }


    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password must be at least 6 characters',
          ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {

      UserCredential userCredential =
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      await userCredential.user?.updateDisplayName(fullName);


      if (!mounted) return;


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Account created successfully!',
          ),
        ),
      );


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const page1(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = 'This email is already registered.';
          break;

        case 'invalid-email':
          message = 'Please enter a valid email address.';
          break;

        case 'weak-password':
          message = 'Please choose a stronger password.';
          break;

        case 'network-request-failed':
          message = 'Check your internet connection.';
          break;

        case 'too-many-requests':
          message = 'Too many attempts. Try again later.';
          break;

        case 'operation-not-allowed':
          message =
          'Email/Password authentication is not enabled.';
          break;

        default:
          message = e.message ??
              'Signup failed. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong. Please try again.',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070C16),

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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const SizedBox(height: 10),


            const Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF6264F2),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: fullNameController,
              textCapitalization:
              TextCapitalization.words,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                hintText: 'Full Name:',
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
              ),
            ),

            const SizedBox(height: 10),


            TextField(
              controller: emailOrPhoneController,
              keyboardType: TextInputType.emailAddress,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                hintText: 'Email:',
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
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: countryController,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                hintText: 'Country:',
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
              ),
            ),

            const SizedBox(height: 10),


            TextField(
              controller: divisionController,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                hintText: 'Division:',
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
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: districtController,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                hintText: 'District:',
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
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: passwordController,
              obscureText: hidepassword1,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                hintText: 'Password:',
                hintStyle: const TextStyle(
                  color: Color(0xFFAEB9CE),
                  fontSize: 15,
                ),
                filled: true,
                fillColor: const Color(0xFF151A24),

                suffixIcon: IconButton(
                  icon: Icon(
                    hidepassword1
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: const Color(0xFFAEB9CE),
                  ),

                  onPressed: () {
                    setState(() {
                      hidepassword1 = !hidepassword1;
                    });
                  },
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Color(0xFF303747),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: confirmPasswordController,
              obscureText: hidepassword,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),

              decoration: InputDecoration(
                hintText: 'Confirm Password:',
                hintStyle: const TextStyle(
                  color: Color(0xFFAEB9CE),
                  fontSize: 15,
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
              ),
            ),

            const SizedBox(height: 25),
            SizedBox(
              width: 150,
              height: 60,

              child: ElevatedButton(
                onPressed: isLoading ? null : signUp,

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6264F2),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),

                child: isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
