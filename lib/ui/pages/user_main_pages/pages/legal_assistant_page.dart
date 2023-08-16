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
  final chats = [];
  bool isDefault = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Lawyer Assistant", style: appbarTitleStyle,),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              if(!isDefault)
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 80, top: defaultMarginSize),
                    reverse: true,
                    children: [
                      ...chats.reversed.map((e) => e).toList()
                    ],
                  ),
                ),
              if(isDefault)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ChatRecommendation(onCLick: (message ) {
                    setState(() {
                      isDefault = false;
                      chats.add(BubbleChatWidget(message: message, isMe: true));
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        chats.add(BubbleChatWidget(message: "Syarat hukum untuk bisnis dapat bervariasi tergantung pada yurisdiksi (wilayah hukum) tempat bisnis tersebut beroperasi dan jenis bisnisnya. Berikut adalah beberapa syarat umum yang sering kali diperlukan untuk memulai bisnis secara legal:", isMe: false));
                      });
                    },);
                  },),
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
                            isDefault = false;
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

class ChatRecommendation extends StatelessWidget {

  final Function(String) onCLick;

  const ChatRecommendation({required this.onCLick, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: bigMarginSize,),
            Image.asset("assets/images/chat_ai.png", width: 160,),
            const SizedBox(height: defaultMarginSize,),
            Text("Konsultasi apa aja tentang\nlegalitas bisnismu", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 16), textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            chat(
              message:  "Bantu saya dengan menjelaskan apa saja syarat legal bisnis",
              onPressed: (message) => onCLick(message),
            ),
            const SizedBox(height: defaultMarginSize,),
            chat(
              message: "Tolong jelaskan bedanya dokumen legal untuk UMKM dan UKM",
              onPressed: (message) => onCLick(message),
            ),
            const SizedBox(height: defaultMarginSize,),
            chat(
              message: "Apa saja persyaratan untuk melegalkan produk",
              onPressed: (message) => onCLick(message),
            )
          ],
        ),
      ),
    );
  }

  Widget chat({required String message, required Function(String) onPressed}) {
    return InkWell(
      onTap: () {
        onPressed(message);
      },
      child: Container(
        padding: EdgeInsets.all(mediumMarginSize),
        width: double.infinity,
        decoration: whiteCardDecoration.copyWith(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: backgroundColor2,
        ),
        child: Text(message, style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),),
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

