import 'dart:convert';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:agoravideocall/Utils/appcontant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewMeetingCallScreen extends StatefulWidget {
  String? meetingID;
  NewMeetingCallScreen({required this.meetingID,super.key});
  @override
  State<NewMeetingCallScreen> createState() => _NewMeetingCallScreenState();
}

class _NewMeetingCallScreenState extends State<NewMeetingCallScreen> {
  String token = '';
  bool loading = true ;
  late final AgoraClient client;
  Future<void> getToken()async{
    String url = "${AppConstant.appUrl}${widget.meetingID}";
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> map = jsonDecode(response.body);
    token = await map['rtcToken'];
  }

  Future<void> videoCall()async{
    client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: AppConstant.appID,
          tempToken: token,
          channelName: widget.meetingID.toString(),
        ),enabledPermission: [Permission.camera,Permission.audio,Permission.microphone]);

  }
  @override
  void initState() {
    super.initState();
    getToken().then((value){
      setState(() {
        loading =false;
        videoCall();
        initAgora();
      });
    });

  }

  void initAgora() async {
    if(loading == false){
      await client.initialize();
    }
  }

// Build your layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loading == true? const Center(child: CircularProgressIndicator(),):Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}
