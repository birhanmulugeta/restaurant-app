import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isVisible = false;
  get ctx => null;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    //TODO: Return the actual login page here...
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/food1.jpg"),
                  radius: MediaQuery.of(context).size.height*0.15,
                ),

              ),
              Container(
                height: deviceHeight * 0.65,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: Color(0xFFF5F5F5),
                child: LayoutBuilder(builder: (ctx , constraints){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome!",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                      SizedBox(height: constraints.maxHeight * 0.01,),
                      Text("please enter the detail below to continue"),
                      SizedBox(height: constraints.maxHeight * 0.08,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "test@gmail.com"
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight* 0.02,
                      ),
                      Container(
                        height: constraints.maxHeight *0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState((){
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isVisible
                                          ?Icons.visibility
                                          :Icons.visibility_off,
                                      color: Colors.grey,),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Password"
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){}, child: Text("Forgot password?",
                            style: TextStyle( color: Colors.red),),
                          )
                        ],

                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        margin: EdgeInsets.only(
                            top: constraints.maxHeight * 0.05
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text("Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 22),),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.amberAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      RichText(text: TextSpan(
                          text: " Don't have an Account!",
                          style: TextStyle(
                            color: Colors.black,fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                                text: "Register",style: TextStyle(color: Colors.green,fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){}
                            )
                          ]
                      ))
                    ],
                  );

                },),


              )]
        ),
      ),



    );
  }
}
