import 'package:cafe/home.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
void initState(){
  home();
  super.initState();

}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(188, 182, 36, 111),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Music Cafe',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 70,right: 70,),
                
                child: Image.asset('Assets/flash.png'),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Enjoy Unlimited Music',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30, color: Colors.white),
              )
            ],
          ),
        )));
  }
  Future<void>home()async{
    await Future.delayed(const Duration(seconds: 4),);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Home()));

  }
}
