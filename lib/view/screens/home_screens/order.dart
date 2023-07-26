import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/appcubit/app_cubit.dart';
import 'package:laboar/blocs/appcubit/app_state.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/screens/home_screens/layout.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:laboar/view/widgets/select_buttton.dart';

import '../../widgets/dropdown.dart';
import '../../widgets/rate.dart';

class OrederScreen extends StatefulWidget {
  final image;
  final title;

  const OrederScreen({super.key, required this.image, required this.title});

  @override
  State<OrederScreen> createState() => _OrederScreenState();
}

class _OrederScreenState extends State<OrederScreen> {
  List<bool> timeSelected = List.generate(12, (index) => false);

  late DateTime NewselectedDate;

  @override
  void initState() {
    AppCubit.get(context).getCopmanyData();
    super.initState();
  }

  bool atDayClicked = true;
  final List<String> vistesItems = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  String? visitsSelectedValue;
  final List<String> hoursitems = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  String? hoursSelectedValue;

  final List<String> nationalityitems = [
    S.current.Philippines,
    S.current.indian,
    S.current.pakistani,
  ];
  String? nationalitySelectedValue;

  final List<String> cityitems = [
    S.current.riyadh,
    S.current.jadah,
    S.current.dmamm,
  ];
  String? citySelectedValue;

  int currentStep = 0;

  bool cardSlected = false;
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return ConditionalBuilder(
          condition: AppCubit.get(context).data != null,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator.adaptive()),
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
              body: SizedBox(
                width: media.width,
                height: media.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${widget.title}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: greenColor),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: media.width,
                          height: media.height * 0.80,
                          child: Stepper(
                            onStepContinue: () {
                              if (currentStep != 2) {
                                setState(() {
                                  currentStep += 1;
                                });
                              } else {
                                var value = {
                                  "Period": atDayClicked ? "Day" : "Night",
                                  "hours": "$hoursSelectedValue",
                                  "nat": nationalitySelectedValue == null
                                      ? "indian"
                                      : '$nationalitySelectedValue',
                                  "city": "$citySelectedValue",
                                  "company": "United Group",
                                  "price": "1500",
                                  "service": "${widget.title}",
                                  "date": "$NewselectedDate",
                                };
                                ordersBox!.add(value);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LayoutScreen(),
                                  ),
                                );
                                showOkAlertDialog(
                                  context: context,
                                  message: S
                                      .of(context)
                                      .Aconfirmationmessagewillbesentwhenyourofferisacceptedbythecompany,
                                  title: S.of(context).Yourrequestisunderreview,
                                  okLabel: S.of(context).OK,
                                  style: AdaptiveStyle.material,
                                );
                              }
                            },
                            onStepCancel: () {
                              if (currentStep == 0) {
                                return;
                              }
                              setState(() {
                                currentStep -= 1;
                              });
                            },
                            onStepTapped: (value) {
                              setState(() {
                                currentStep = value;
                              });
                            },
                            elevation: 0,
                            currentStep: currentStep,
                            type: StepperType.horizontal,
                            steps: getSteps(media, nationalitySelectedValue,
                                citySelectedValue, hoursSelectedValue, cubit),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Step> getSteps(Size media, String? nationalitySelectedValue,
          String? citySelectedValue, String? hoursSelectedValue, cubit) =>
      [
        Step(
          isActive: currentStep >= 0,
          state: currentStep <= 0 ? StepState.editing : StepState.complete,
          title: Text(S.of(context).Step1),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Period,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.height * .01,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        atDayClicked = true;
                      });
                    },
                    child: DSelectButton(
                      atDayClicked: atDayClicked,
                      icon: Icons.wb_sunny_sharp,
                      text: S.of(context).Morning,
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.06,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        atDayClicked = false;
                      });
                    },
                    child: DSelectButton(
                      atDayClicked: !atDayClicked,
                      icon: Icons.nights_stay_sharp,
                      text: S.of(context).Night,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              Dropdown(
                items: hoursitems,
                selectedValue: hoursSelectedValue,
                title: S.of(context).NumberOfhours,
              ),
              Dropdown(
                items: nationalityitems,
                selectedValue: nationalitySelectedValue,
                title: S.of(context).Nationality,
              ),
              Dropdown(
                items: cityitems,
                selectedValue: citySelectedValue,
                title: S.of(context).City,
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          state: currentStep <= 1 ? StepState.editing : StepState.complete,
          title: Text(S.of(context).Step2),
          content: Column(
            children: [
              Text(S.of(context).Filter),
              InkWell(
                onTap: () {
                  setState(() {
                    cardSlected = !cardSlected;
                  });
                },
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: cardSlected ? greenColor : Colors.white)),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(media.width * .04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: media.width * 0.08,
                                height: media.height * 0.08,
                                child: Image(
                                    image: NetworkImage(cubit!.data['photo']),
                                    fit: BoxFit.contain),
                              ),
                              SizedBox(
                                width: media.width * 0.02,
                              ),
                              Text(
                                cubit!.data['name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                              const Spacer(),
                              Text(
                                S.of(context).price,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: media.width * .09),
                            child: Row(
                              children: [
                                StarRate(rate: S.of(context).rate),
                                const Spacer(),
                                const Text(
                                  "1500",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: media.width * .09),
                            child: Text(
                              cubit!.data['details'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 10),
                            ),
                          ),
                          Row(
                            children: [
                              FittedBox(
                                child: Row(
                                  children: [
                                    const Icon(Icons.flag_circle_outlined),
                                    Text(S.of(context).Philippines),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    const Icon(Icons.list_alt_outlined),
                                    Text(
                                      widget.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.watch_later_outlined),
                                    Text("4 Hours"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          state: currentStep <= 2 ? StepState.editing : StepState.complete,
          title: Text(S.of(context).Step3),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: darkGreenColor,
                ),
                padding: EdgeInsetsDirectional.all(media.height * 0.01),
                width: media.width * 0.90,
                child: Row(
                  children: [
                    SizedBox(
                      height: media.height * 0.06,
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.01,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).yourlocation,
                            textAlign: TextAlign.start,
                            style: const TextStyle(color: lightGrayColor),
                          ),
                          const Text(
                            'Jiddah Alexander Language School , ALS',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              Dropdown(
                items: vistesItems,
                selectedValue: visitsSelectedValue,
                title: S.of(context).NumberofVistes,
              ),
              Text(
                S.of(context).ChooseDateTime,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              DatePicker(
                onDateChange: (selectedDate) {
                  NewselectedDate = selectedDate;
                },
                DateTime.now(),
                height: media.height * 0.10,
                width: media.width * 0.20,
                initialSelectedDate: DateTime.now(),
                selectionColor: greenColor,
                selectedTextColor: Colors.white,
              ),
              Text(S.of(context).ChooseTime),
              SizedBox(
                height: media.height * 0.10,
                width: media.width,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return timePicker(media, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ];
  timePicker(media, index) => InkWell(
        onTap: () {
          setState(() {
            timeSelected[0] = !timeSelected[0];
          });
        },
        child: Container(
          height: media.height * 0.10,
          width: media.width * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: timeSelected[0] ? greenColor : Colors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            '${index + 1}',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: timeSelected[0] ? Colors.white : Colors.black),
          ),
        ),
      );
}
