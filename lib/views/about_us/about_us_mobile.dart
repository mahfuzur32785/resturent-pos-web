import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web/utils/constant.dart';
import 'package:web/widgets/custom_text_field.dart';

class AboutUsMobile extends StatefulWidget {
  const AboutUsMobile({super.key});

  @override
  State<AboutUsMobile> createState() => _AboutUsMobileState();
}

class _AboutUsMobileState extends State<AboutUsMobile> {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final guestCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final timeCtrl = TextEditingController();
  String? selectedGuest;
  final basicFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
        child: Form(
          key: basicFormKey,
          child: Column(
            children: [
              const Text(
                "Online reservation",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                "You can reserve a table in ouur resturant during th weekays amd at weekends, for maximum 7 Guest.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),

              ///Name Section++++++++++++++++++++++++++++++++++
              const Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              CustomTextField(
                text: "Enter your name",
                textEditingController: nameCtrl,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                callback: (p0) {
                  return "Please enter name";
                },
              ),
              const SizedBox(
                height: 16,
              ),

              ///Phone Section ++++++++++++++++++++++++++++++++++
              const Row(
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              CustomTextField(
                text: "Enter your phone",
                textEditingController: phoneCtrl,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                callback: (p0) {
                  return "Please enter phone";
                },
              ),
              const SizedBox(
                height: 16,
              ),

              ///Email Section +++++++++++++++++++++++++++++++++++
              const Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              CustomTextField(
                text: "Enter your email",
                textEditingController: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),

              ///Date +++++++++++++++++++++++++++++++++++++++ Time
              Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          ///Date Section
                          const Row(
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            textAlign: TextAlign.start,
                            controller: dateCtrl,
                            validator: (String? value) {
                              if (value == "") {
                                return 'Please select date';
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            maxLines: 1,
                            cursorColor: Colors.black87,
                            onSaved: (String? val) {
                              selectedDate = val;
                            },
                            onTap: () {
                              returnDateChooser(context);
                            },
                            decoration: const InputDecoration(
                              suffix: Icon(
                                Icons.calendar_month,
                                color: Colors.black45,
                                size: 20,
                              ),
                              hintText: 'DD/MM/YYYY',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  )),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          ///Time Section
                          const Row(
                            children: [
                              Text(
                                "Time",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            textAlign: TextAlign.start,
                            controller: timeCtrl,
                            validator: (String? value) {
                              if (value == "") {
                                return 'Please select time';
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            maxLines: 1,
                            cursorColor: Colors.black87,
                            onSaved: (String? val) {
                              selectedTime = val;
                            },
                            onTap: () {
                              selectTime(context);
                            },
                            decoration: const InputDecoration(
                              suffix: Icon(
                                Icons.calendar_month,
                                color: Colors.black45,
                                size: 20,
                              ),
                              hintText: 'hh:mm aa',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  )),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),

              ///Guest Section ++++++++++++++++++++++++++++++
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Text(
                    "Guest",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return "Please select Guest";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Select Guest',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  border: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                value: selectedGuest,
                items: guestList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedGuest = value!;
                  setState(() {

                  });
                },
              ),
              Visibility(
                visible: selectedGuest=="Custom",
                child: Column(
                  children: [
                    const SizedBox(height: 6),
                    CustomTextField(
                      text: "Enter your guest",
                      textEditingController: guestCtrl,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      callback: (p0) {
                        return "Please enter guest";
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Text(
                    "Note",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              CustomTextField(
                text: "Additional test",
                textEditingController: descCtrl,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLine: 4,
              ),


              const SizedBox(height: 10,),
              RichText(
                text: const TextSpan(
                  text: "After completion the form you will received a confirmation of your reservation by",style: TextStyle(
                    color: Colors.black,
                    fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: " email ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14)),
                    TextSpan(text: "or ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14)),
                    TextSpan(
                        text: "text message.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14)),

                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: const Color(0xFF077bd7),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    if (basicFormKey.currentState!.validate()) {
                      print("Valideddd");
                    }
                  },
                  child: const Text(
                    "Book a Table",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    text: "You can",style: TextStyle(
                      color: Colors.black,
                      fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: " cancel ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14)),
                      TextSpan(text: "the reservation by calling +880194512632.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  ///..........Return Date Chooser ............
  final returnFormatter = DateFormat('dd-MM-yyyy');
  DateTime returnDateTime = DateTime.now();
  String? selectedDate;
  returnDateChooser(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: returnDateTime,
        firstDate: DateTime(1950),
        lastDate: DateTime(2040),
        currentDate: DateTime.now(),
        // initialDatePickerMode: DatePickerMode.year,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Color(0xFF31A3DD),
                surface: Colors.white,
                onSurface: Color(0xFF000000),
              ),
              dialogBackgroundColor: const Color(0xFF31A3DD),
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      returnDateTime = newSelectedDate;
      dateCtrl
        ..text = returnFormatter.format(returnDateTime)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateCtrl.text.length, affinity: TextAffinity.upstream));
      selectedDate = dateCtrl.text;
      setState(() {});
    }
  }

  /// .......... time choose .....................
  var selectedTime;
  TimeOfDay fromSelectedTime = TimeOfDay.now();
  TimeOfDay toSelectedTime = TimeOfDay.now();
  selectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: toSelectedTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: redColor,
              onPrimary: Color(0xFF31A3DD),
              surface: Colors.white,
              onSurface: Color(0xFF000000),
            ),
            dialogBackgroundColor: Colors.blue[500],
          ),
          child: child!,
        );
      },
    );

    if (newTime != null) {
      fromSelectedTime = newTime;
      timeCtrl
        ..text = newTime.format(context)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: timeCtrl.text.length, affinity: TextAffinity.upstream));
      selectedTime = timeCtrl.text;
      setState(() {});
    }
  }
}
