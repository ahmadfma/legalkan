import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';

class LegalAssistantPage extends StatelessWidget {
  const LegalAssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(top: defaultMarginSize, bottom: superBigMarginSize),
                child: Column(
                  children: [
                    BubbleChatWidget(message: 'Halo, ada yang bisa saya bantu ?', isMe: false),
                    BubbleChatWidget(message: 'siapa yang bakal menang di hackathon 2023 ?', isMe: true),
                    BubbleChatWidget(message: 'Tentu saja synergy :)', isMe: false)
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.all(defaultMarginSize),
                  padding: EdgeInsets.symmetric(horizontal: defaultMarginSize, vertical: mediumMarginSize),
                  decoration: whiteCardDecoration.copyWith(borderRadius: BorderRadius.all(Radius.circular(100))),
                  width: 200,
                  child: Row(
                    children: [
                      Expanded(child: Text("Pesan...", style: myTextTheme.bodyMedium?.copyWith(color: Colors.grey[500]),)),
                      Icon(Icons.send, color: blue,)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class BubbleChatWidget extends StatelessWidget {
  final String message;
  final bool isMe;

  BubbleChatWidget({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, bottom: defaultMarginSize),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        constraints: BoxConstraints(maxWidth: size.width * 0.8),
        child: Text(
          message,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

