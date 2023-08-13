import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';

class ChooseFileInput extends StatefulWidget {

  final String title;
  final Function(PlatformFile? selectedFile) onSelectedFile;

  const ChooseFileInput({
    Key? key,
    required this.onSelectedFile,
    required this.title
  }) : super(key: key);

  @override
  State<ChooseFileInput> createState() => _ChooseFileInputState();
}

class _ChooseFileInputState extends State<ChooseFileInput> {

  PlatformFile? selectedFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: mediumMarginSize, vertical: defaultMarginSize),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 1, color: greyStroke)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/pdf.png', height: 40),
              const SizedBox(width: mediumMarginSize,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: myTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0),),
                  const SizedBox(height: verySmallMarginSize,),
                  InkWell(
                    onTap: () {
                      pickFile();
                    },
                    child: Text("Pilih File", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: blue),),
                  )
                ],
              )
            ],
          ),
          if(selectedFile != null) const SizedBox(height: mediumMarginSize,),
          if(selectedFile != null) Text(selectedFile!.name)
        ],
      ),
    );
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf']
    );
    debugPrint("PICK FILE RESULT : $result");
    if(result != null) {
      setState(() {
        selectedFile = result.files.first;
        widget.onSelectedFile(selectedFile);
      });
    }
  }

}
