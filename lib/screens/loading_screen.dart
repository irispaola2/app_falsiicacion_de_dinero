
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Falsificacions'),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 2, 2, 2),
        ),
      ),
    );
  }
}