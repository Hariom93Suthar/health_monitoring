import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_monitoring1/Home_Page.dart';
import 'package:health_monitoring1/SignIn_Page.dart';

class Home3 extends StatefulWidget {
  const Home3({Key? key}) : super(key: key);

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  var name = TextEditingController();
  var age = TextEditingController();
  var email = TextEditingController();
  var  password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void iniState(){
    Firebase.initializeApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Form(
            key: _formkey,
            child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top:120,bottom:120),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),bottomRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100))
                    ),
                  ),
                  Container(
                    child:  Text('𝓡𝓮𝓰𝓲𝓼𝓽𝓮𝓻 𝓟𝓪𝓰𝓮',
                      style: TextStyle(color: Colors.green,fontSize: 35),),
                    padding: EdgeInsets.only(left: 80, top: 60),),
                  SingleChildScrollView(
                      child: Container(

                        padding:EdgeInsets.only(top:160,right: 30, left: 30) ,
                        child: Column(
                            children: [
                              TextFormField(
                                    controller: name,
                                  decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'FullName',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )

                                  ),

                                validator: (value) => value!.isEmpty
                                    ? "Required" : null,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              SizedBox(height:20,),
                              TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Email',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )

                                  ),
                                validator: (value) => value!.isEmpty
                                    ? "Required" : null,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              SizedBox(height:20,),
                              TextField(
                                  controller: age,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'DD/MM/YYYY',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )

                                  ),
                                ),
                              SizedBox(height:20,),
                              TextFormField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'password',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)

                                      )
                                  ),
                                validator: (value) => value!.length <= 8
                                    ? "at least  8 character" : null,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  ElevatedButton(onPressed: (){
                                    FirebaseAuth.instance.createUserWithEmailAndPassword
                                      (email: email.text, password: password.text).
                                    then((value) {print("logged in ");}).
                                    onError((error, stackTrace) {print(error);});

                                    if (_formkey.currentState!.validate()) {
                                      print("validated your email and password");
                                    }
                                    else {
                                      print("not valid");
                                    }
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> Home4()));
                                    },
                                      child: Text("register"),
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(6.0),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              )
                                          ),
                                        )
                                    ),
                                    SizedBox(width: 144,),
                                     ElevatedButton(onPressed: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>Home5()));
                                    }, child: Text("Sign in"),
                                         style: ButtonStyle(
                                           elevation: MaterialStateProperty.all(6.0),
                                           shape: MaterialStateProperty.all(
                                               RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20),
                                               )
                                           ),
                                         ))

                                     ],
                                  )
                              ]),
                           )
                       )
                  ]),
          )
            );
    }
}
