import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';
import 'package:legalkan/ui/widgets/custom_dropdown_button.dart';
import 'package:legalkan/ui/widgets/custom_textfield.dart';

import '../../utils/file_helper.dart';

class CreateDocumentPage extends StatefulWidget {
  static const route = "/create-document";

  const CreateDocumentPage({Key? key}) : super(key: key);

  @override
  State<CreateDocumentPage> createState() => _CreateDocumentPageState();
}

class _CreateDocumentPageState extends State<CreateDocumentPage> {

  String? selectedAction;
  String documentName = "";
  bool isLoadingFile = false;
  PlatformFile? selectedFile;
  final aksi = ["Request", "Upload"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Request Dokumen", style: appbarTitleStyle,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultMarginSize),
        child: Column(
          children: [
            CustomDropdownButton(
              items: aksi,
              hint: "Pilih Aksi",
              selectedValue: selectedAction,
              onChanged: (value) {
                setState(() {
                  selectedAction = value;
                });
              },
              isCardMode: true,
            ),
            const SizedBox(height: bigMarginSize,),
            CustomTextField(
              hint: 'Nama Dokumen',
              onChanged: (value) {
                documentName = value;
              },
              isCardMode: true,
            ),
            const SizedBox(height: bigMarginSize,),
            Container(
              decoration: whiteCardDecoration,
              padding: const EdgeInsets.all(defaultMarginSize),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jika ada template tertentu silahkan diunggah disini, template wajib berekstensikan PDF", style: myTextTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),),
                  const SizedBox(height: mediumMarginSize,),
                  Row(
                    children: [
                      Image.asset('assets/images/pdf.png', width: 45,),
                      const SizedBox(width: mediumMarginSize,),
                      Expanded(
                        child: CustomButton(
                          showLoading: isLoadingFile,
                          loadingBarSize: 15,
                          text: 'Pilih Dokumen',
                          onPressed: () {
                            pickFile();
                          },
                          width: null,
                          textStyle: myTextTheme.labelLarge?.copyWith(color: Colors.white),
                          height: 35,
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          padding: const EdgeInsets.symmetric(horizontal: mediumMarginSize),
                        ),
                      )
                    ],
                  ),
                  if(selectedFile != null) const SizedBox(height: mediumMarginSize,),
                  if(selectedFile != null) Text(selectedFile!.name.toString())
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: whiteCardDecoration.copyWith(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: semiBigMarginSize),
        child: CustomButton(
          text: 'Tambahkan',
          onPressed: () {},
        ),
      ),
    );
  }

  void pickFile() async {
    setState(() {
      isLoadingFile = true;
    });
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if(result != null) {
      setState(() {
        final size = result.files.first.size;
        debugPrint("FILE SIZE : $size");
        if(size > MAX_FILE_SIZE) { //10mb
          showSnackBar("ukuran file maksimal 10 mb");
        } else {
          selectedFile = result.files.first;
        }
        isLoadingFile = false;
      });
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

}
