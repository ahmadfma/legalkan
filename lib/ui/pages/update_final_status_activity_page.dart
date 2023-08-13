import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/widgets/choose_file_input.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';

class UpdateFinalStatusActivityPage extends StatefulWidget {

  static const route = '/update-final-status';

  const UpdateFinalStatusActivityPage({Key? key}) : super(key: key);

  @override
  State<UpdateFinalStatusActivityPage> createState() => _UpdateFinalStatusActivityPageState();
}

class _UpdateFinalStatusActivityPageState extends State<UpdateFinalStatusActivityPage> {

  PlatformFile? transkripFile;
  PlatformFile? laporanAkhirFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Status", style: appbarTitleStyle,),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultMarginSize),
        child: Column(
          children: [
            const SizedBox(height: smallMarginSize,),
            Text("Jika kegiatan anda telah berakhir, silahkan melengkapi dokumen dibawah ini", style: myTextTheme.displaySmall?.copyWith(fontSize: 14, letterSpacing: 0.2, height: 1.5),),
            const SizedBox(height: superBigMarginSize,),
            ChooseFileInput(
              title: 'Transkrip Nilai',
              onSelectedFile: (selectedFile) {
                if(selectedFile != null) {
                  setState(() {
                    transkripFile = selectedFile;
                  });
                }
              },
            ),
            const SizedBox(height: superBigMarginSize,),
            ChooseFileInput(
              title: 'Laporan Akhir',
              onSelectedFile: (selectedFile) {
                if(selectedFile != null) {
                  laporanAkhirFile = selectedFile;
                }
              },
            ),
            const SizedBox(height: superBigMarginSize,),
            CustomButton(
              text: 'Submit',
              onPressed: () {
                if(transkripFile != null && laporanAkhirFile != null) {
                  uploadFile();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void uploadFile() {
    debugPrint("UPLOAD FILE");
    //TODO : Implement upload file
  }
}
