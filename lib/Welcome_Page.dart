import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_monitoring1/Register_Page.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: AssetImage("assets/images/heart.gif"),
              fit: BoxFit.contain
          )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 90,),
              child: Text.rich(TextSpan(
                  text: "𝓗",
                  style: TextStyle(fontSize: 60,
                      color: Colors.blue),
                  children: [
                    TextSpan(
                        text: "ealth",
                        style: TextStyle(fontSize: 20,
                            color: Colors.blueAccent)
                    ),
                    TextSpan(
                        text: "𝓬",
                        style: TextStyle(fontSize: 90,
                            color: Colors.blueAccent)
                    ),
                    TextSpan(
                        text: "are",
                        style: TextStyle(fontSize: 30,
                            color: Colors.blueAccent)
                    ),


                  ]
              )),


            ),
            Container(
                padding: EdgeInsets.only(top: 500,left: 90),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Home3()));
                }, child: Text("Get Started >>>"),
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.red),
                      elevation: MaterialStateProperty.all(7.0),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}

