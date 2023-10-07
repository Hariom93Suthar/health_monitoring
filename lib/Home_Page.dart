import 'package:flutter/material.dart';
import 'package:health_monitoring1/Update_Data.dart';
import 'package:provider/provider.dart';

class Home4 extends StatefulWidget {
  const Home4({Key? key}) : super(key: key);

  @override
  State<Home4> createState() => _Home4State();
}
 Future<void>_refresh(){
  return Future.delayed(Duration(seconds: 2));
 }

class _Home4State extends State<Home4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lime,

          leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),
          title: Text("health monitoring")
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ChangeNotifierProvider<Updated_app>(
          create: (context) => Updated_app(),
          child: Consumer<Updated_app>(
            builder: (context, provider, child){
              return SingleChildScrollView(
                child: Column(
                    children: [
                      Text("𝓐𝓵𝓵 𝓓𝓪𝓽𝓪 : ",style: TextStyle(fontSize: 40,color: Colors.red),),
                      SizedBox(height: 15,),
                      Container(height: 350,width: 345,
                        color: Colors.grey,
                        child: Text("Data: ${provider.data1.toString()}"),
                      ),
                      Text("𝓢𝓾𝓫 𝓓𝓪𝓽𝓪 : ",style: TextStyle(fontSize: 40,color: Colors.red),),
                      SizedBox(height: 15,),
                      Container(height: 350,width: 345,
                        color: Colors.grey,
                        child: Text("Id :${provider.data2.toString()}\n"
                            "Name :${provider.data3.toString()}\n"
                            "Field1 :${provider.data4.toString()}\n"
                            "Field2:${provider.data5.toString()}\n"
                            "Last Entry :${provider.data6.toString()}"),
                      ),

                      SizedBox(height: 40,),
                      ElevatedButton(onPressed: (){
                        provider.update();
                      },
                          child: Center(child: Text("Fetch Data")),
                          style: ButtonStyle(
                          elevation: MaterialStateProperty.all(6.0),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              )      )
                    ],
                  ),
              );
            },
          ),
        ),
      ),
    );
  }
}
