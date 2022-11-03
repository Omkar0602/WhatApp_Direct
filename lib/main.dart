
// ignore_for_file: unused_field, unused_local_variable, unused_import, unnecessary_import

import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wa_flutter/appOpenAdManager.dart';
import 'package:wa_flutter/splashScreen.dart';

AppOpenAd? openAd;

Future<void> loadadd()async{
  await AppOpenAd.load(adUnitId: "ca-app-pub-9358781011444692/8542748859",
   request: const AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad){
      openAd =ad;
      openAd!.show();
    }, onAdFailedToLoad: (err){
      print(err);
    }), orientation: AppOpenAd.orientationPortrait);
}


void main() async{
WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
//await loadadd();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    home:AnimatedSplashScreen(backgroundColor: Colors.black, splash: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_xy6jshlz.json"),splashIconSize: 200, nextScreen:const SplashScreen(),duration: 8000,)
  ));
}

class MyClass extends StatefulWidget {
  const MyClass({Key? key}) : super(key: key);

  @override
  State<MyClass> createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {

  Future<void>? _launched;
  var number="";
  var text ="";
  var code='+91';
   Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
     final Uri toLaunch =
        Uri(scheme: 'https', host: 'api.whatsapp.com', path: 'send/?918010802911&text=hii');
      return Scaffold(
        backgroundColor: Colors.white,
        
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/back.jpg"),
              fit: BoxFit.cover)
            ),
          padding:const  EdgeInsets.only(left: 40,right: 40),
            
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                              BoxShadow(  blurRadius: 16,spreadRadius: 16,color: Colors.black.withOpacity(0.3))
                      ],
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 16,
                      sigmaY: 16
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        
                         color: Colors.white.withOpacity(0.2),
                         borderRadius: BorderRadius.circular(16),
                         border: Border.all(width: 0.5,color: Colors.white)
                      ),
                      height: 400,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Text("WhatsApp Direct",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          CountryCodePicker(
                            textStyle: TextStyle(color: Colors.white),
                            onChanged: (code1){
                                code=code1.toString();
                            },
                            initialSelection: 'IN',
                            favorite: const[
                              '+91','IN'
                            ],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          TextField(
                            onChanged:(value){number=value;},
                            style: TextStyle(color: Colors.white),

                            keyboardType: TextInputType.number,
                            decoration:  InputDecoration(
                              prefixIcon: Icon(Icons.phone_android,color: Colors.white,),
                              hintText: "Ph.Number",
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.orange)
                              )
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextField(onChanged:(value){text=value;},
                          
                          style: TextStyle(color: Colors.white),
                            decoration:  InputDecoration(
                              prefixIcon: Icon(Icons.abc_outlined,color: Colors.white,),
                              hintText: "Message",
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.orange)
                              )
                            ),
                            ),
                             SizedBox(height: 20,),
                           ConstrainedBox(
                            constraints: BoxConstraints(),
                             child: InkWell(onTap: () async{
                              code = code.replaceAll("+", "");
                              String url='https://api.whatsapp.com/send/?phone=$code$number&text=$text';
                              
                                                     setState(() {
                             
                              _launched = _launchInWebViewOrVC(Uri.parse(url));
                             });
                             },
                             child: Container(
                                       decoration: BoxDecoration(boxShadow: [
                              BoxShadow(  blurRadius: 16,spreadRadius: 10,color: Colors.black.withOpacity(0.3))
                      ],),
                               child: Container(
                                height: 40,
                                width:100,
                                          padding: EdgeInsets.only(left: 20,right: 20),
                                                   decoration: BoxDecoration(
                                                     
                                                      color: Colors.white.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(16),
                                                      border: Border.all(width: 0.5,color: Colors.white)
                                                   ),
                                child: Center(child: Text("SEND",style: TextStyle(color: Colors.white),)),
                               ),
                             ),
                             
                             ),
                           ),
                           SizedBox(height: 20,),
                           Text("App by omkar khandebharad",style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 10),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}