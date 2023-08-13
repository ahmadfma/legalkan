import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';
import 'package:legalkan/ui/widgets/custom_textfield.dart';

class DialogUpdateActivityStatus extends StatefulWidget {
  const DialogUpdateActivityStatus({Key? key}) : super(key: key);

  @override
  State<DialogUpdateActivityStatus> createState() => _DialogUpdateActivityStatusState();
}

class _DialogUpdateActivityStatusState extends State<DialogUpdateActivityStatus> {

  String? inputKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Update Status", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),),
        const SizedBox(height: bigMarginSize,),
        Text.rich(
          style: myTextTheme.bodyMedium?.copyWith(height: 1.5),
          TextSpan(
            children: [
              const TextSpan(text: "Silahkan Ketik "),
              TextSpan(text: "FAILED ", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: primaryColor)),
              const TextSpan(text: ' jika pendaftaran ditolak atau '),
              TextSpan(text: "SUCCESS ", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: green)),
              const TextSpan(text: 'jika pendaftaran diterima'),
            ]
          )
        ),
        const SizedBox(height: bigMarginSize,),
        CustomTextField(
          hint: 'Kata Kunci',
          padding: const EdgeInsets.symmetric(horizontal: mediumMarginSize),
          onChanged: (value) {
            setState(() {
              inputKey = value;
            });
          },
        ),
        const SizedBox(height: bigMarginSize,),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                height: 40,
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: lightBlue3
                ),
                textStyle: myTextTheme.bodyMedium?.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
                text: 'Batal',
                onPressed: () {
                  Navigator.pop(context);
                  },
              ),
            ),
            const SizedBox(width: mediumMarginSize,),
            Expanded(
              child: CustomButton(
                height: 40,
                textStyle: myTextTheme.bodyMedium?.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
                text: 'konfirmasi',
                onPressed: () {
                  Navigator.pop(context, inputKey);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
