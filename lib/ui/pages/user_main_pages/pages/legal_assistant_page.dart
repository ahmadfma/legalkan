import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';

import '../../../widgets/custom_textfield.dart';

class LegalAssistantPage extends StatefulWidget {
  const LegalAssistantPage({super.key});

  @override
  State<LegalAssistantPage> createState() => _LegalAssistantPageState();
}

class _LegalAssistantPageState extends State<LegalAssistantPage> {

  final controller = TextEditingController(text: "");
  final chats = [
    BubbleChatWidget(message: 'Selamat pagi pak ahmad, terima kasih sudah menerima permintaan saya untuk konsultasi', isMe: true),
    BubbleChatWidget(message: 'saya ingin bertanya apa saja yang diperlukan untuk mengurus surat izin usaha ?', isMe: true),
    BubbleChatWidget(message: 'Pagi pak giga, terima kasih sudah memakai jasa konsultasi saya', isMe: false),
    BubbleChatWidget(message: '5 menit lagi saya akan menelfon anda untuk menjelaskan lebih detail', isMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Robot Assistant", style: appbarTitleStyle,),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 80, top: defaultMarginSize),
                  reverse: true,
                  children: [
                    ...chats.reversed.map((e) => e).toList()
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.all(defaultMarginSize),
                  padding: EdgeInsets.symmetric(horizontal: mediumMarginSize),
                  decoration: whiteCardDecoration.copyWith(borderRadius: BorderRadius.all(Radius.circular(100))),
                  width: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          onChanged: (value) {},
                          textEditingController: controller,
                          hint: 'Pesan...',
                          boxDecoration: BoxDecoration(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            chats.add(BubbleChatWidget(message: controller.text, isMe: true));
                            controller.text = "";
                          });
                        },
                        child: Icon(Icons.send, color: blue,),
                      )
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
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, bottom: mediumMarginSize),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        constraints: BoxConstraints(maxWidth: size.width * 0.8),
        child: Text(
          message,
          style: myTextTheme.bodyLarge?.copyWith(color: isMe ? Colors.white : Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}

