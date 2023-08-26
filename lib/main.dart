import 'package:agoravideocall/View/NewMeeting/createnewmeeting.dart';
import 'package:agoravideocall/View/JoinMeeting/joinmeeting.dart';
import 'package:agoravideocall/View/StaticCallScreen/staticvideocall.dart';
// import 'package:agoravideocall/View/NewMeeting/vide_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Call',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Video Call Testing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Get.to(()=> const StaticVideoCall());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin:const  EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent
                ),
                child: const Center(
                  child: Text("join static call "),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(()=> const CreateNewMeeting());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent
                ),
                child:const  Center(
                  child: Text("New Meeting "),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(()=> const JoinMeeting());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent
                ),
                child: const Center(
                  child: Text("Join a meeting "),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
