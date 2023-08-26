import 'package:agoravideocall/View/NewMeeting/new_meeting_video_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:clipboard/clipboard.dart';
import 'package:get/route_manager.dart';
class CreateNewMeeting extends StatefulWidget {
  const CreateNewMeeting({super.key});

  @override
  State<CreateNewMeeting> createState() => _CreateNewMeetingState();
}

class _CreateNewMeetingState extends State<CreateNewMeeting> {
  var uuid = const Uuid();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controller.text = uuid.v1().toString().substring(0,8);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              enabled: false,
              controller: controller,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "your personal meeting ID"
              ),
            ),
          ),
          
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Text("copy meeting id"),
              GestureDetector(
                  onTap: (){
                    FlutterClipboard.copy(controller.text.trim()).then(( value ){
                      Get.snackbar("Successfully", "Copy text");
                    });
                  },
                  child: Icon(Icons.copy_all)),
            ]),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Get.to(()=> NewMeetingCallScreen(meetingID: controller.text.trim(),));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent
              ),
              child: Center(
                child: Text("Create a meeting"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
