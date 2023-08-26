import 'package:agoravideocall/View/JoinMeeting/joinMeetingVideoCallScreen.dart';
import 'package:agoravideocall/View/NewMeeting/new_meeting_video_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class JoinMeeting extends StatefulWidget {
  const JoinMeeting({super.key});

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
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
              // enabled: false,
              controller: controller,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: "Enter meeting ID"
              ),
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Get.to(()=> JoinMeetingVideoCallScreen(meetingID: controller.text.trim(),));
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
                child: Text("Join meeting "),
              ),
            ),
          )
        ],
      ),
    );
  }
}
