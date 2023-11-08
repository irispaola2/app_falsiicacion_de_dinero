import 'package:flutter/material.dart';


class InputDecorations{

static InputDecoration authInputDecoration({
  required String hintText,
  required String labelText, 
  IconData? prefixIcon
}){
  return InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 36, 204, 190)
                  ),
                ),
                focusedBorder:UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(202, 6, 206, 146),
                    width: 2
                  )
                ),
                hintText: hintText, 
                labelText: labelText,
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 112, 105, 105) 
                ),
                prefixIcon:  prefixIcon != null
                ? Icon(Icons.alternate_email_sharp, color:Color.fromARGB(255, 2, 138, 148))
                : null
              );
}
}