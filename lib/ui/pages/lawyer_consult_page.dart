import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_assistant_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_consultant_page.dart';
import 'package:legalkan/ui/widgets/custom_textfield.dart';

class LawyerConsultPage extends StatefulWidget {
  static const route = "/lawyer-consult-page";

  final Lawyer lawyer;

  const LawyerConsultPage({required this.lawyer, super.key});

  @override
  State<LawyerConsultPage> createState() => _LawyerConsultPageState();
}

class _LawyerConsultPageState extends State<LawyerConsultPage> {

  final controller = TextEditingController(text: "");
  final chats = [
    BubbleChatWidget(message: 'Selamat pagi pak ahmad, terima kasih sudah menerima permintaan saya untuk konsultasi', isMe: true),
    BubbleChatWidget(message: 'saya ingin bertanya apa saja yang diperlukan untuk mengurus surat izin usaha ?', isMe: true),
    BubbleChatWidget(message: 'Pagi pak giga, terima kasih sudah memakai jasa konsultasi saya', isMe: false),
    BubbleChatWidget(message: '5 menit lagi saya akan menelfon anda untuk menjelaskan lebih detail', isMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            //APPBAR
            Container(
              padding: EdgeInsets.symmetric(horizontal: smallMarginSize, vertical: mediumMarginSize),
              decoration: whiteCardDecoration.copyWith(borderRadius: BorderRadius.zero),
              child: Row(
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: mediumMarginSize,),
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Image.network(widget.lawyer.photoUrl, height: 40, width: 40, fit: BoxFit.cover,),
                        ),
                        const SizedBox(width: mediumMarginSize,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.lawyer.name, style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 2,),
                            Text(widget.lawyer.jobTitle, style: myTextTheme.bodyMedium?.copyWith(fontSize: 12, color: Colors.grey),)
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.call, size: 22,),
                  ),
                  const SizedBox(width: smallMarginSize,),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.more_vert_rounded, size: 22,),
                  )
                ],
              ),
            ),

            //CONTENT
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
