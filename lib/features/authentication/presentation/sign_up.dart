import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';



import 'package:google_fonts/google_fonts.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:routing/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;


    TextEditingController nameEditingController = TextEditingController();
    TextEditingController familyNameEditingController = TextEditingController();
    TextEditingController userNameEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: GoogleFonts.heebo(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(

          padding: EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: MediaQuery.of(context).viewInsets.bottom),

          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
               

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(194/deviceHeight),bottom: 4),
                  child: Text(
                    "Given Name",
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),

               

                TextField(
                  controller: nameEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(133, 144, 162, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(20/deviceHeight),bottom: 4),
                  child: Text(
                    "Family Name",
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
                
                TextField(
                  controller: familyNameEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(133, 144, 162, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

               
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(20/deviceHeight),bottom: 4),
                  child: Text(
                    "UserName",
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
               
                TextField(
                  controller: userNameEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(133, 144, 162, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(20/deviceHeight),bottom: 4),
                  child: Text(
                    "Password",
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
                
                TextField(
                  controller: passwordEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(133, 144, 162, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(23/deviceHeight),),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () async{

                          String name = nameEditingController.text.toString().trim();
                          String familyName = familyNameEditingController.text.toString().trim();
                          String userName = userNameEditingController.text.toString().trim();
                          String password = passwordEditingController.text.toString().trim();

                          if(name.isNotEmpty && familyName.isNotEmpty && userName.isNotEmpty && password.isNotEmpty){
                            print("name : $name \nfamilyName : $familyName \nuserName : $userName \npassword : $password");

                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString(Constants.KEY_USERNAME, userName);
                            prefs.setString(Constants.KEY_PASSWORD, password);
                            
                            AutoRouter.of(context).push(const SignInRoute());
                          }
                          else{
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Please fill all the fields !")));
                          }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(65, 82, 180, 1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Sign Up"),
                    ),
                  ),
                ),
               
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
