import 'package:app_falsiicacion_de_dinero/models/falsificacion.dart';
import 'package:flutter/material.dart';

class FalsificacionFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Falsificacion falsificacion; 

  FalsificacionFormProvider( this.falsificacion); 

  bool isValidForm(){

    print (falsificacion.name); 
    return formKey.currentState?.validate()?? false; 
  }
}