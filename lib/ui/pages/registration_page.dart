import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';
import 'package:legalkan/ui/widgets/custom_datepicker_input.dart';
import 'package:legalkan/ui/widgets/custom_dropdown_button.dart';
import 'package:legalkan/ui/widgets/custom_textfield.dart';
import 'package:legalkan/utils/date_helper.dart';

class RegistrationPage extends StatefulWidget {
  static const route = "/registration";
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final activityType = [
    'Studi Independen',
    'Kampus Mengajar',
    'Pertukaran Pelajar',
    'Magang Merdeka'
  ];

  final dosen = [
    'Dr. Ahmad Fathanah',
    'Prof. Indrabayu',
    'Ais Prayogi',
    'Zahir'
  ];

  String? selectedActivityType;
  String? mitra;
  String? selectedDosBing;

  DateTime? selectedStartDate;
  TextEditingController startDateController = TextEditingController();

  DateTime? selectedEndDate;
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pendaftaran", style: myTextTheme.titleLarge?.copyWith(color: Colors.white),),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultMarginSize),
        child: Column(
          children: [
            CustomDropdownButton(
              selectedValue: selectedActivityType,
              items: activityType,
              hint: "Jenis Kegiatan",
              onChanged: (value) {
                setState(() {
                  selectedActivityType = value;
                });
              },
            ),

            const SizedBox(height: defaultMarginSize,),
            CustomTextField(
              hint: "Mitra",
              onChanged: (value) {
                setState(() {
                  mitra = value;
                });
              },
            ),

            const SizedBox(height: defaultMarginSize,),
            CustomDatePickerInput(
              textEditingController: startDateController,
              selectedDate: selectedStartDate,
              hint: 'Tanggal Pelaksanaan',
              onChanged: (value) {
                setState(() {
                  selectedStartDate = value;
                  startDateController.text = parseDateTime(selectedStartDate, pattern: "dd MMM yyyy");
                });
              },
            ),

            const SizedBox(height: defaultMarginSize,),
            CustomDatePickerInput(
              textEditingController: endDateController,
              selectedDate: selectedEndDate,
              hint: 'Tanggal Berakhir',
              onChanged: (value) {
                setState(() {
                  selectedEndDate = value;
                  endDateController.text = parseDateTime(selectedEndDate, pattern: "dd MMM yyyy");
                });
              },
            ),

            const SizedBox(height: defaultMarginSize,),
            CustomDropdownButton(
              hint: 'Dosen Pembimbing',
              selectedValue: selectedDosBing,
              items: dosen,
              onChanged: (value) {
                setState(() {
                  selectedDosBing = value;
                });
              },
            ),

            const SizedBox(height: defaultMarginSize,),
            CustomButton(
              text: "Daftar",
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
