import 'package:flutter/material.dart';
import 'package:health_monitoring1/Home_Page.dart';
import 'package:health_monitoring1/Register_Page.dart';
class Home5 extends StatefulWidget {
  const Home5({Key? key}) : super(key: key);
  @override
  State<Home5> createState() => _Home5State();
}

class _Home5State extends State<Home5> {
  var email = TextEditingController();
  var password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 400),
              decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assets/images/health1.jpg"),
                   fit: BoxFit.cover
                 ),
                 color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(90),
                      topRight: Radius.circular(90))
              ),
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),
                 bottomRight: Radius.circular(90))
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 150,right: 25, left: 25),
              child: Column(

                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                    ),
                    validator: (value) => value!.isEmpty
                    ? "Required" : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height:20,),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'passoword',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                        )
                    ),
                    validator: (value) => value!.length <= 8
                    ? "at least  8 character" : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                       ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> Home3()));
                      }, child: Text("SignUp",style: TextStyle(color: Colors.lime),),),
                      SizedBox(width: 155,),
                      ElevatedButton(onPressed: () {
                        _formkey.currentState!.validate();
                        if (_formkey.currentState!.validate()) {
                          print("validated your email and password");
                        }
                        else {
                          print("not valid");
                        }
                       Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> Home4()));
                        }, child: Text("SignUp",style: TextStyle(color: Colors.lime),),),

                    ],
                  )
                ]
              )
            ),

          ],
        ),
      ),
    );
  }
}
