import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/enum/pos_text_formfield_validation_rule.dart';
import 'package:pos/helper/pos_text_formfield.dart';
import 'package:pos/helper/social_button.dart';
import 'package:pos/helper/style.dart';
import 'package:pos/screens/ForgetPassword_screen.dart';
import 'package:pos/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasssword = true;
  bool onChange = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>(); // check validate form
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode()); // ot mean focus on formfield te 
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              SizedBox(height: 56),
              Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  color: StyleColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipum",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        print("Login in Facebook ");
                      },
                      label: 'Facebook',
                      icon: "assets/images/facebook_icon.png",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        print("Login in Google ");
                      },
                      label: 'Google',
                      icon: "assets/images/google_icon.png",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: HexColor('#E0E5EC'), endIndent: 8),
                  ),
                  Text(
                    "Or",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Divider(color: HexColor('#E0E5EC'), indent: 8)),
                ],
              ),
              SizedBox(height: 24),
              // textfield email
              PosTextFormfield(
                placeholder: 'Email',
                rule: PosTextFormfieldValidationRule.email,
                onChanged: (p0) {
                  setState(() {
                    
                  });
                },
                validator: (p0)  {
                  if(p0 == null || p0.isEmpty){
                    return 'Email is required';
                  }
                  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if( !emailRegex.hasMatch(p0)){
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
                
              SizedBox(height: 24),
              // text password
              PosTextFormfield(
                placeholder: 'Password',
                isObsecure: isPasssword,
                rule: PosTextFormfieldValidationRule.password,
                onChanged: (p0) {
                  setState(() {
                    
                  });
                },
                validator: (p0) {
                  RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                  if( p0 == null || p0.length < 8 ){
                    return 'Password must be at least 8 charater';
                  }
                  if(!passwordRegex.hasMatch(p0)){
                    return 'Password not match ';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    isPasssword = !isPasssword;
                    setState(() {});
                  },
                  icon: Icon(
                    isPasssword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  ), // use cupertinoIcon
                  // icon: Icon(isPasssword ? Icons.visibility_off_outlined : Icons.visibility), // use Icons
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> ForgetpasswordScreen())
                    );
                  },
                  child: 
                    Text('Forget Password ?',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                  ),
                
                ),
                
                
              ),
                
              SizedBox(height: 32),
              // login button
              TextButton(
                onPressed: (_formkey.currentState?.validate() ?? false) // check validate button color
                          ? () {

                              Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => const SignupScreen())
                              );
                          } : null,
                
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(30),
                  shadowColor: WidgetStatePropertyAll(
                    StyleColor.primary.withValues(alpha: 0.25),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith(
                    (states)=> states.contains( WidgetState.disabled) ? StyleColor.disable : StyleColor.primary,
                  ),

                  padding: WidgetStatePropertyAll(EdgeInsets.all(18)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(14),
                    ),
                  ),
                ),
                child: Text(
                  "Log In",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " Sign Up",
                  
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: StyleColor.primary,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: true,
                            //   builder: (context) => AlertDialog(
                            //     contentPadding: EdgeInsets.all(20),
                            //     title: 
                            //       Text(
                            //         "Sign Up Success",
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(fontWeight: FontWeight.w600),
                                  
                            //       ),
                                
                            //     actions: [
                            //       LottieBuilder.asset('assets/lottie/animate.json'),
                            //       TextButton(onPressed: () {
                            //         Navigator.pop(context);
                            //       },
                                  
                            //       child: Text("Cancel")),
                                  
                            //     ],
                                
                            //   ),
                              
                            // );
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                          },
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
