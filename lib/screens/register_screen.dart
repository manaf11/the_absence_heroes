import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var registerFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  bool val = false;
  bool isFormChanged = false;
  Map myData = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register Screen"),
        ),
        body: Center(
          child: Form(
            onChanged: () {
              isFormChanged = true;
              setState(() {

              });
            },
            onWillPop: () async{
              var res = await showDialog(context: context, builder: (context) => AlertDialog(
                title: Text(" Are you sure"),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop(true);
                  }, child: Text("YES")),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop(false);
                  }, child: Text("No")),
                ],
              ),);
              return res;
            },
            autovalidateMode: AutovalidateMode.disabled,
            key: registerFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  //this used for email
                  TextFormField(
                    validator: (value) {
                      if(value?.isEmpty == true){
                        return "email is required";
                      }
                      else{
                        if(value?.isEmail() == false){
                          return "please insert a valid email format";
                        }
                      }
                    },

                    onSaved: (newValue) {
                      myData['email'] = newValue;
                    },

                  ),

                  //this used for phone
                  TextFormField(
                    validator: (value) {
                      if(value?.isEmpty == true){
                        return "phone is required";
                      }
                      else{
                        if(value?.isPhone() == false){
                          return "please insert a valid phone number";
                        }
                      }
                    },

                    onSaved: (newValue) {
                      myData['phoneNumber'] = newValue;
                    },

                  ),

                  //this used for full name
                  TextFormField(
                    validator: (value) {
                      if(value?.isEmpty == true){
                        return "fullnAME is required";
                      }

                    },

                    onSaved: (newValue) {
              myData['fullName'] = newValue;
                    },

                  ),

                  //this used for password
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if(value?.isEmpty == true){
                        return "password is required";
                      }
                      else{
                        if(value?.isPasswordHard() == false){
                          return "please insert a strong password";
                        }
                      }
                    },

                    onSaved: (newValue) {
                          myData['password'] = newValue;
                    },

                  ),

                  //this used for confirmed password
                  TextFormField(
                    validator: (value) {
                      if(value != passwordController.text){
                        return "passwords arent matched";
                      }
                    },

                    onSaved: (newValue) {

                    },

                  ),

                  FormField(
                  onSaved: (newValue) {

                  },
                      validator: (value) {
                        if(val == false){
                          return "you have to accept our terms of services";
                        }
                      },
                  builder: (field) => CheckboxListTile(
                  title: Text("Accept all terms of services"),value: val, onChanged: (value) {
                    setState(() {
                      val = !val;
                    });

                  },),),

                  ElevatedButton(
                    onLongPress: null,
                      onPressed: isFormChanged?() {
                    if(registerFormKey.currentState?.validate() == true){
                        registerFormKey.currentState?.save();
                        print(myData);
                    }
                  }:null, child: Text("register"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
