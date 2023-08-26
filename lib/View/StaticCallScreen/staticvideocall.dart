import 'package:agora_uikit/agora_uikit.dart';
import 'package:agoravideocall/Utils/appcontant.dart';
import 'package:flutter/material.dart';


class StaticVideoCall extends StatefulWidget {
  const StaticVideoCall({super.key});

  @override
  State<StaticVideoCall> createState() => _StaticVideoCallState();
}

class _StaticVideoCallState extends State<StaticVideoCall> {
// Instantiate the client
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: AppConstant.appID,
      // tempToken: "0067657de882808424184039d221276aa7aIABG0z39huLk81/oXKTWbtHXU9Rtb7bf6q/DU04w6ZzfLQx+f9gQ+wmRIgCRvxFT0dvqZAQAAQBhmOlkAgBhmOlkAwBhmOlkBABhmOlk",
      channelName: "fd335db0",
    ),
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

// Build your layout
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: client),
              AgoraVideoButtons(client: client),
            ],
          ),
        ),
      ),
    );
  }
}
