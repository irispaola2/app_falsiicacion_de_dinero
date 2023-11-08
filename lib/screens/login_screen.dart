import 'package:app_falsiicacion_de_dinero/providers/login_from_provider.dart';
import 'package:app_falsiicacion_de_dinero/ui/input_decorations.dart';
import 'package:app_falsiicacion_de_dinero/widgets/widgets.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
 
class LoginScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column (
            children: [


              SizedBox( height: 250 ),

              CardContainer(
                child: Column(
                  children: [

                    SizedBox( height: 10),
                    Text('LOGIN', style: Theme.of(context).textTheme.headlineMedium ),
                    SizedBox( height: 30 ),

                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm(),
                    )

                  ],
                )
              ),

              SizedBox(height: 50),
              Text('Crear Cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
            ],
        ),
      ) 
      )
    );
  }
} 

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,

        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'xxxxx@xxxx.com',
                labelText: 'Correo Electronico', 
                prefixIcon: Icons.lock_clock_outlined
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                ? null
                : 'Dato Ingresado no es un correo Electronico';
              },
            ),
            SizedBox( height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '********',
                labelText: 'Contraseña', 
                prefixIcon: Icons.lock_open_outlined
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value){
                
                return ( value != null && value.length >=8)
                ? null
                : 'La contraseña debe de contener 8 caracteres';
              },
            ),
            SizedBox( height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color.fromARGB(255, 255, 29, 29),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading
                  ?'Espere'
                  :'Ingresar',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                )
               ),
              onPressed: loginForm.isLoading ? null : () async {

                FocusScope.of(context).unfocus();

                if( !loginForm.isValidFom()) return;

                loginForm.isLoading = true;
                await Future.delayed(Duration(seconds: 2));
                loginForm.isLoading = false;
                
                Navigator.pushReplacementNamed(context, 'home'); 
              }
            )

            ],
            ),
        ),
    );
  }
}