import 'package:flutter/material.dart';
import 'package:tst_app2/ui/area_list.dart';
import 'package:tst_app2/ui/sync_page.dart';
import 'package:tst_app2/ui/widgets/login_text_form_field.dart';
import 'package:tst_app2/ui/widgets/search_text_form_field_widget.dart';
import 'package:tst_app2/ui/widgets/textFormField_custom_order_input.dart';
import 'package:tst_app2/utils/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cidController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  String email = '';
  String deviceId = '';
  String deviceBrand = '';
  String deviceModel = '';
  String appVersion = '';
  bool obcure = true;
  bool isloading = false;
  String version = "v1.0-20231219-1";

 // UserLoginData? userLoginData;

  @override
  void initState() {
    super.initState();

   // retrieveUserData();
    // cId.text = 'smart';
    // userId.text = 'it18';
    // userPass.text = '1234';
  }

  //===========This Function for Device information==============//
  // Future<void> assignDeviceId() async {
  //   deviceId = (await UserServices().getAndroidDeviceId());
  //   assignDeviceId();
  //   if (rememberMe) {
  //     retrieveUserData();
  //   }
  //   setState(() {});
  // }

  // Future<void> retrieveUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   setState(() {
  //     cId.text = prefs.getString('cid') ?? "";
  //     userId.text = prefs.getString('user_id') ?? "";
  //     userPass.text = prefs.getString('user_pass') ?? "";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: mainColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login",style: TextStyle(color: white,fontSize: 40),)
                      // Image.asset(
                      //   'assets/images/Transcom.png',
                      //   width: MediaQuery.of(context).size.width / 1.6,
                      //   height: MediaQuery.of(context).size.height / 9,
                      // ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height / 3.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)
                          )
                          ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Transcom.png',
                                width: MediaQuery.of(context).size.width / 1.8,
                                height:
                                    MediaQuery.of(context).size.height / 11),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 30,
                            //     right: 30,
                            //   ),
                            //   child: DefaultTextFormField(
                            //     text: "CID / Company ID",
                            //     imageUrl: 'assets/icons/house-building.svg',
                            //     isvisibleicon: false,
                            //     controller: cId,
                            //     inputType: TextInputType.text,
                            //     emptyMessage: 'Please enter your CID',
                            //     errorMessage: 'Please enter a valid CID',
                            //     reglarExpression: r'^(?:[+0]9)?[0-9]{10,12}$',
                            //     obscure: false,
                            //     obsState: () {},
                            //   ),
                            // ),
                             Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 15,
                              ),
                              child: LoginTextFOrmFiledWidget(hintText: "CID", borderColor: mainColor, controller:userController , fillColor: mainShadeColorNow, onChanged: (value) {  }, )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 15,
                              ),
                              child: LoginTextFOrmFiledWidget(hintText: "UserID", borderColor: mainColor, controller:userController , fillColor: mainShadeColorNow, onChanged: (value) {  }, )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 15,
                              ),
                              child: LoginTextFOrmFiledWidget(hintText: "Password", borderColor: mainColor, controller:userController , fillColor: mainShadeColorNow, onChanged: (value) {  }, )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 35, right: 35),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       InkWell(
                      //         child: Text(
                      //           'Forget Password ?',
                      //           style: TextStyle(
                      //               color: MyColors().mainColor,
                      //               fontSize: 13,
                      //               fontWeight: FontWeight.w500),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 25,
                      ),

                      //Login Button
                      InkWell(
                        onTap: () async {
                            Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => Syncpage()
                                     )));
                        
                          // if (_formKey.currentState!.validate()) {
                          //   Boxes.getUserData().clear();

                          //   userLoginData = await UserRepositories().loginRepo(
                          //       'smart',
                          //       userId.text.toString(),
                          //       userPass.text.toString(),
                          //       deviceId.toString(),
                          //       deviceBrand,
                          //       deviceModel,
                          //       appVersion);

                          //   if (userLoginData!.message == "Success") {
                          //     Boxes.getUserData()
                          //         .put('userInfo', userLoginData!.retStr);
                          //     print(userLoginData!.retStr.userName);

                          //     UserServices().syncApisfromLogin(
                          //         'smart',
                          //         userId.text.toString(),
                          //         userPass.text.toString());
                          //     userLoginData!.retStr.isLoggedIn = rememberMe;
                          //     userLoginData!.retStr.userPass =
                          //         userPass.text.toString();

                          //     // Boxes.getVisitPlan()
                          //     //     .put('userVisit', userVisitPlan.retStr);
                          //     setState(() {});
                          //     if (!mounted) return;

                          //     if (Boxes.getItem().isEmpty ||
                          //         Boxes.getStock().isEmpty) {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => SyncDataTabPage(),
                          //         ),
                          //       );
                          //     } else {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => HomePage(
                          //             callBack2: () {},
                          //             prevIndex: 0,
                          //           ),
                          //         ),
                          //       );
                          //     }
                          //     // }
                          //   } else {}
                          // }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 0,
                              ),
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height /15,
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                              color:mainColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: white,fontWeight: FontWeight.bold),
                              // style: GoogleFonts.inter(
                              //   color: Colors.white,
                              //   fontWeight: FontWeight.w500,
                              //   fontSize: 15,
                              // ),
                            ),
                          ),
                        ),
                      ),

                      //Remember Me
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: rememberMe,
                                onChanged: (value) async {
                                  // SharedPreferences prefs =
                                  //     await SharedPreferences.getInstance();
                                  // if (rememberMe == value) {
                                  //   prefs.setString('cid', cId.text.toString());
                                  //   prefs.setString(
                                  //       'user_id', userId.text.toString());
                                  //   prefs.setString(
                                  //       'user_pass', userPass.text.toString());
                                  // }
                                  // setState(() {
                                  //   rememberMe = value ?? false;
                                  // });
                                },
                              ),
                            ),
                            const SizedBox(
                              // width: myDefaultPadding,
                            ),
                            Text(
                              '  Keep me logged in ',
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Footer Section at the End of UI
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   color: Colors.white,
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 8.0, horizontal: 16.0),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             version,
                      //             style: TextStyle(
                      //                 color: lightGrayColor,
                      //                 fontSize: 11),
                      //           )
                      //         ],
                      //       ),
                      //       const SizedBox(
                      //         height: 5,
                      //       ),
                      //       // const Row(
                      //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       //   children: [
                      //       //     Text(
                      //       //       'TRANSCOM CONSUMER PRODUCTS LTD.',
                      //       //       style: TextStyle(
                      //       //         fontSize: 12,
                      //       //         fontWeight: FontWeight.w700,
                      //       //         height: 1.8333333333,
                      //       //         letterSpacing: -0.4099999964,
                      //       //         color: Color(0xff1259ad),
                      //       //       ),
                      //       //     ),
                      //       //     SizedBox(width: 20), // Space between the words
                      //       //     Text(
                      //       //       'PEPSICO',
                      //       //       style: TextStyle(
                      //       //         fontSize: 12,
                      //       //         fontWeight: FontWeight.w700,
                      //       //         height: 1.8333333333,
                      //       //         letterSpacing: -0.4099999964,
                      //       //         color: Color(0xff1259ad),
                      //       //       ),
                      //       //     ),
                      //       //   ],
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                    ],
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
