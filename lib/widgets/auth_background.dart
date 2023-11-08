import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {


final Widget child;

  const AuthBackground({
    Key? key, 
    required this.child
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 19, 20, 20),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [

          _PurpleBox(),

          HeaderIcon(),

          this.child,
        ],

      ),
    );
  }
}

class HeaderIcon extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only( top: 30 ),
        child: Icon( Icons.person_2_outlined, color: Color.fromARGB(255, 255, 252, 255), size: 100 ),
        ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height *0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 5, left: 30 ),
          Positioned(child: _Bubble(), top: 60, left: 60 ),
          Positioned(child: _Bubble(), top: 100, left: 80 ),
          Positioned(child: _Bubble(), top: 140, left: 140 ),
          Positioned(child: _Bubble(), top: 160, left: 160 ),
          Positioned(child: _Bubble(), top: 160, left: 200 ),
          Positioned(child: _Bubble(), top: 160, left: 250 ),
          Positioned(child: _Bubble(), top: 160, left: 280 ),
          Positioned(child: _Bubble(), top: 160, left: 320 ),
          Positioned(child: _Bubble(), top: 160, left: 360 ),
          Positioned(child: _Bubble(), top: 160, left: 400 ),
          Positioned(child: _Bubble(), top: 160, left: 440 ),
          Positioned(child: _Bubble(), top: 160, left: 480 ),
          Positioned(child: _Bubble(), top: 160, left: 520 ),
          Positioned(child: _Bubble(), top: 160, left: 560 ),
          Positioned(child: _Bubble(), top: 160, left: 610 ),
          Positioned(child: _Bubble(), top: 160, left: 650 ),
          Positioned(child: _Bubble(), top: 160, left: 690 ),
          Positioned(child: _Bubble(), top: 160, left: 740 ),
          Positioned(child: _Bubble(), top: 160, left: 780 ),
          Positioned(child: _Bubble(), top: 160, left: 810 ),
          Positioned(child: _Bubble(), top: 160, left: 450 ),
          Positioned(child: _Bubble(), top: 200, left: 500 ),
          Positioned(child: _Bubble(), bottom: 140, right: 10 ),
          Positioned(child: _Bubble(), bottom: 80, right: 30 ),
          Positioned(child: _Bubble(), bottom: 20, right: 80 ),
        ],
      ),    
    );
}

//------------------------------------------------------------------------------
  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient (
      colors: [
        Color.fromARGB(255, 0, 0, 0),
        Color.fromRGBO(204, 17, 17, 1)
      ] )
  );
}
//--------------------------------------------------------------------------------

class _Bubble extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(250, 250, 250, 0.05)
      
      )
    );
  }
}