
import 'package:flutter/material.dart';
import 'page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routewise',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.black
        scaffoldBackgroundColor:const Color(0xFF070C16),
        colorScheme: .fromSeed(seedColor: Colors.white),
      ),
      home: const MyHomePage(title: ' Routewise Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

        backgroundColor:const Color(0xFF070C16),//Theme.of(context).colorScheme.inversePrimary,

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
                style:TextStyle(fontSize:30,color:Color(0xFFE8E8E8)),
              ),
            ],
        ),
        ),

      ),
      body: Center(
        child: Column(

          mainAxisAlignment: .start,
          children: [
            const SizedBox(height:180),
            const Text('Welcome! Please Sign In ',
              style:TextStyle(fontSize:25,color:Color(0xFFAEB9CE)),
            ),
            const SizedBox(height:40),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Email or Phone',
                    hintStyle: const TextStyle(color: Color(0xFFAEB9CE)
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
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Color(0xFFAEB9CE)
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
              child: const Text('Login',
                style: TextStyle(fontSize: 20,
                  color: Colors.white,
                ),
              ))
      ),
      const SizedBox(width: 20,),
      const Text('Or Register with ',
        style:TextStyle(fontSize:20,color:Color(0xFFAEB9CE)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height:60,
            child: OutlinedButton(onPressed: (){},
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
                'G',style: TextStyle(fontSize:30,
                  fontWeight: FontWeight.bold,
                  color:Colors.purple
              ),
              ),

            ),
          ),
          const SizedBox(width: 20,),
          SizedBox(
            width: 60,
            height:60,
            child: OutlinedButton(onPressed: (){},
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
                'F',style: TextStyle(fontSize:30,
                  fontWeight: FontWeight.bold,
                  color:Colors.blueAccent
              ),
              ),

            ),
          ),
        ],
      )
      ],
    ),
     //insert hrere

      ),


    );
  }
}
