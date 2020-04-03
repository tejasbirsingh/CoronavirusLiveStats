import 'dart:async';
import 'package:simple_animations/simple_animations.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

@override
void initState(){
  super.initState();
  startTime();
  controller = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);
  animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  controller.forward();
}
  startTime() async {
    var _duration = new Duration(milliseconds: 1500);
    return new Timer(_duration, navigationPage);


  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body:Stack(
       children: <Widget>[
         Container(
           decoration: BoxDecoration(
             gradient: LinearGradient(

               colors:
                 [
                   Colors.green.shade300.withOpacity(0.6),
                   Colors.blue.shade600.withOpacity(0.5),
                   Colors.blue.shade700.withOpacity(0.7)
                 ]
             )
           ),
           child: Center(
             child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
               FadeTransition(

                  opacity:animation,

                    child:Text('Covid-19',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 40.0
                 ),),),
                 SizedBox(height: 20.0,),
                 Container(
                   width: 200.0,
                   height: 200.0,
                   child: FlareActor(
                     'images/newLoad.flr',
                         animation:'roll'
                   ),
                 )
               ],
             ),
           ),
         ),
       ],
     ),
    );
  }
}
