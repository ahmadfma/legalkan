import 'package:flutter/material.dart';
import 'package:legalkan/ui/widgets/custom_textfield.dart';

import '../../common/dimensions.dart';
import '../../common/styles.dart';

class DetailProfilePage extends StatefulWidget {
  static const route = '/detail-profile';
  const DetailProfilePage({Key? key}) : super(key: key);

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {

  TextEditingController nameController = TextEditingController(text: "Ahmad Fathanah M.Adil");
  TextEditingController nimController = TextEditingController(text: "D121191048");
  TextEditingController phoneController = TextEditingController(text: "082291453878");
  TextEditingController alamatController = TextEditingController(text: "BTN Kendari Permai Blok Y1 No.2");
  TextEditingController tanggalLahirController = TextEditingController(text: "2001-11-15");
  TextEditingController tempatLahirController = TextEditingController(text: "Maros");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Profile", style: appbarTitleStyle,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultMarginSize),
        child: Column(
          children: [
            CustomTextField(
              hint: 'name',
              onChanged: (value) {},
              isReadOnly: true,
              textEditingController: nameController,
              label: 'Name',
            ),
            const SizedBox(height: defaultMarginSize,),
            CustomTextField(
              hint: 'Nomor Induk Mahasiswa (NIM)',
              onChanged: (value) {},
              isReadOnly: true,
              textEditingController: nimController,
              label: 'Nomor Induk Mahasiswa (NIM)',
            ),
            const SizedBox(height: defaultMarginSize,),
            CustomTextField(
              hint: 'Nomor Hp',
              onChanged: (value) {},
              isReadOnly: true,
              textEditingController: phoneController,
              label: 'Nomor Hp',
            ),
            const SizedBox(height: defaultMarginSize,),
            CustomTextField(
              hint: 'Alamat',
              onChanged: (value) {},
              isReadOnly: true,
              textEditingController: alamatController,
              label: 'Alamat',
            ),
            const SizedBox(height: defaultMarginSize,),
            CustomTextField(
              hint: 'Tanggal Lahir',
              onChanged: (value) {},
              isReadOnly: true,
              textEditingController: tanggalLahirController,
              label: 'Tanggal Lahir',
            ),
            const SizedBox(height: defaultMarginSize,),
            CustomTextField(
              hint: 'Tempat Lahir',
              onChanged: (value) {},
              isReadOnly: true,
              textEditingController: tempatLahirController,
              label: 'Tempat Lahir',
            )
          ],
        ),
      ),
    );
  }
}
