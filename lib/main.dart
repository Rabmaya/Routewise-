import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routewise',
      theme: ThemeData(
        scaffoldBackgroundColor:const  Color(0xFF070C16),
      ),
      //home: const MyHomePage(title: ' Routewise Login'),
      // page2(),//
      home: AnimatedSplashScreen(),
    );
  }
}
 class AnimatedSplashScreen  extends StatelessWidget {
  const AnimatedSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:    Center(

        child:  TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.5, end: 5),
          duration:  Duration(seconds: 6),
          curve: Curves.easeInSine,
          onEnd: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'Routewise Login',)),
            );
          },
          builder: (context, scaleValue, child) {
            return Transform.scale(
              scale: scaleValue,
              child: child,
            );
          },
          child: Container(
            width:100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: /*Icon(
              Icons.eco_outlined,
              size: 50,
              color: Colors.black,
            ),*/Image.asset(
              'assets/images/output_image.png',
              width: 50,
              height: 50,

            ),

          ),
        ),
      ),
    );


  }

 }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


bool hidepassword =true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor:const Color(0xFF070C16),

        centerTitle:true,
        title:RichText(
          text:const TextSpan(
            children:[
              TextSpan(
            text:'Route',
            style:TextStyle(fontSize:30,color:Color(0xFFFFC400)),
              ),
              TextSpan(
                text:'Wise',
                style:TextStyle(fontSize:30,color:Colors.white),
              ),
            ],
        ),
        ),

      ),
      body: Center(
        child: Column(

          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            //const SizedBox(height:130),
            const Text('Welcome! Please Sign In ',
              style:TextStyle(fontSize:25,color:Color(0xFFAEB9CE)),
            ),
            const SizedBox(height:40),
              TextField(
                style: TextStyle(
                  color: Colors.white,fontSize: 18,
                ),
                decoration: InputDecoration(
                    hintText: 'Email or Phone',
                    hintStyle: const TextStyle(color: Color(0xFFAEB9CE),
                        fontSize: 15
                    ),
                    filled: true,
                    fillColor:  const Color(0xFF151A24),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color:Color(0xFF303747),
                      ),
                    )
              ),
            ),
            const SizedBox(height:20),
            TextField(
              style: TextStyle(
                color: Colors.white,fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE),fontSize: 18
                  ),
                  filled: true,
                  fillColor:  const Color(0xFF151A24),
                  suffixIcon: IconButton(icon: Icon(
                    hidepassword
                        ?Icons.visibility_off
                        :Icons.visibility,
                  ),
                      onPressed:()
                      {
                        setState(() {
                          hidepassword=!hidepassword;
                        });
                      }
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color:Color(0xFF303747),
                    ),
                  )
              ),
            ),


      const SizedBox(height: 20),
      SizedBox(
          width: double.infinity,
          height:60,
          child:ElevatedButton(onPressed:(){
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const page1()
              ),
            );
          },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6264F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: const Text('Log in',
                style: TextStyle(fontSize: 20,
                  color: Colors.white,
                ),
              ))
      ),
      const SizedBox(width: 20,),
      const Text('or',
        style:TextStyle(fontSize:20,color:Color(0xFFAEB9CE)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /*const SizedBox(width: 20,),*/
          SizedBox(
            width: 100,
            height:50,

            child: OutlinedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const page2()),
              );
            },
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFF151A24),
                side: const BorderSide(
                    color:Color(0xFF303747)
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                ),
              ),
              child: const Text(
                'sign up',style: TextStyle(fontSize:15,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF6264F2)
              ),
              ),

            ),
          ),

        ],

      )
      ],
    ),

      ),


    );
  }
}
