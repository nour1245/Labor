import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/appcubit/app_cubit.dart';
import 'package:laboar/blocs/appcubit/app_state.dart';
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
    "Philippines",
    "indian",
    "pakistani",
  ];
  String? nationalitySelectedValue;

  final List<String> cityitems = [
    "riyadh",
    "jadah",
    "dmamm",
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LayoutScreen(),
                                  ),
                                );
                                showOkAlertDialog(
                                  context: context,
                                  message:
                                      'A confirmation message will be sent when your offer is accepted by the company',
                                  title: 'Your request is under review',
                                  okLabel: 'OK',
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
          title: const Text('Step 1'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Period",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                      text: 'Morning',
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
                      text: "Night",
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
                title: 'Number Of hours',
              ),
              Dropdown(
                items: nationalityitems,
                selectedValue: nationalitySelectedValue,
                title: 'Nationality',
              ),
              Dropdown(
                items: cityitems,
                selectedValue: citySelectedValue,
                title: 'City',
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          state: currentStep <= 1 ? StepState.editing : StepState.complete,
          title: const Text("Step 2"),
          content: Column(
            children: [
              const Text("Filter"),
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
                              const Text(
                                "price ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: media.width * .09),
                            child: Row(
                              children: [
                                StarRate(rate: 'rate'),
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
                              const FittedBox(
                                child: Row(
                                  children: [
                                    Icon(Icons.flag_circle_outlined),
                                    Text("Philippines"),
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
          title: const Text("Step 3"),
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
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'your location',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: lightGrayColor),
                          ),
                          Text(
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
                title: "Number of Vistes",
              ),
              const Text(
                'Choose Date & Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              DatePicker(
                DateTime.now(),
                height: media.height * 0.10,
                width: media.width * 0.20,
                initialSelectedDate: DateTime.now(),
                selectionColor: greenColor,
                selectedTextColor: Colors.white,
              ),
              const Text('Choose  Time'),
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
