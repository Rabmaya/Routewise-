import 'package:flutter/material.dart';
import 'page1.dart';
void main() {
  runApp(const page2());
}

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  bool hidepassword = true;
  bool hidepassword1 = true;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController divisionController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                style: TextStyle(fontSize: 30, color: Color(0xFFFFC400)),
              ),
              TextSpan(
                text: 'Wise',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ),


      ),
      body: SingleChildScrollView(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Sign Up ',
              style: TextStyle(fontSize: 25, color: Color(0xFF6264F2), fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: fullNameController,
              style: const TextStyle(
                color: Colors.white, fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Full Name:',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE), fontSize: 15
                  ),
                  filled: true,
                  fillColor: const Color(0xFF151A24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailOrPhoneController,
              style: const TextStyle(
                color: Colors.white, fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Email or Phone:',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE), fontSize: 15
                  ),
                  filled: true,
                  fillColor: const Color(0xFF151A24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: countryController,
              style: const TextStyle(
                color: Colors.white, fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Country:',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE), fontSize: 15
                  ),
                  filled: true,
                  fillColor: const Color(0xFF151A24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: divisionController,
              style: const TextStyle(
                color: Colors.white, fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Division:',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE), fontSize: 15
                  ),
                  filled: true,
                  fillColor: const Color(0xFF151A24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: districtController,
              style: const TextStyle(
                color: Colors.white, fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'District:',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE), fontSize: 15
                  ),
                  filled: true,
                  fillColor: const Color(0xFF151A24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: hidepassword1,
              style: const TextStyle(
                color: Colors.white, fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Password:',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE), fontSize: 15
                  ),
                  filled: true,
                  fillColor: const Color(0xFF151A24),
                  suffixIcon: IconButton(icon: Icon(
                    hidepassword1
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                      onPressed: ()
                      {
                        setState(() {
                          hidepassword1 = !hidepassword1;
                        });
                      }
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: confirmPasswordController,
              obscureText: hidepassword,
              style: const TextStyle(
                color: Colors.white, fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Confirm Password:',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE), fontSize: 15
                  ),
                  filled: true,
                  fillColor: const Color(0xFF151A24),
                  suffixIcon: IconButton(icon: Icon(
                    hidepassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                      onPressed: ()
                      {
                        setState(() {
                          hidepassword = !hidepassword;
                        });
                      }
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color(0xFF303747),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
                width: 150,
                height: 60,
                child: ElevatedButton(onPressed: (){
                  // Example: access entered values via the controllers, e.g.
                  // fullNameController.text, emailOrPhoneController.text, etc.
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const page1()
                    ),
                  );
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6264F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: const Text('Sign in',
                      style: TextStyle(fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                )
            ),
          ],


        ),
      ),

    );

  }
}