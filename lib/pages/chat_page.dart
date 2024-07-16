import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/components/my_app_bar.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  final String receiverEmail;
  final String receiverID;

  const ChatPage({
    required this.receiverEmail,
    required this.receiverID,
  });

  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage>{
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  FocusNode myFocusNode = FocusNode();
  final ScrollController controller = ScrollController();

  Widget buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    print("--------------");
    print(data);
    bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data['message'],
            isCurrentUser: isCurrentUser,
          ),
        ],
      ),
    );
  }

  Widget buildMessageList(){
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessage(widget.receiverID, senderID),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text("Error ${snapshot.error}");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading...");
        }
        return ListView(
          controller: controller,
          children: snapshot.data!.docs.map((doc) => buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  void sendMessage() async {
    if(messageController.text.isNotEmpty){
      await chatService.sendMessage(widget.receiverID, messageController.text);
      messageController.clear();
      scrollDown();
    }
  }

  void scrollDown(){
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn
    );
  }

  Widget buildUserInput(){
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: messageController,
              hintText: "Type a message",
              obscureText: false,
              focusNode: myFocusNode,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: Icon(Icons.arrow_upward, color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(
        title: widget.receiverEmail,
        actions: [],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: buildMessageList(),
          ),
          buildUserInput(),
        ],
      ),
    );
  }
}