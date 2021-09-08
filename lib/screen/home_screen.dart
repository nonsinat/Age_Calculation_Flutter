import 'package:age/age.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:age_calculator_flutter/services/age_calculator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime todayDate = DateTime.now();
  DateTime dob = DateTime(2000, 1, 1);

  AgeDuration? _ageduration;
  AgeDuration? _nextduration;
  var _nextBirthdayWeekday;

  List<String> _months = [
    "months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  List<String> _days = [
    "Days",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY",
  ];

  Future<Null> _selectTodayDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: dob,
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != todayDate) {
      setState(() {
        todayDate = picked;
        _ageduration = AgeCalculation().calculateAge(todayDate, dob);
        _nextduration = AgeCalculation().nextBirthday(todayDate, dob);
        _nextBirthdayWeekday = AgeCalculation().nextWeekday(todayDate, dob);
      });
    }
  }

  Future<Null> _selectDOBDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: DateTime(1900),
      lastDate: todayDate,
    );
    if (picked != null && picked != todayDate) {
      setState(() {
        dob = picked;
        _ageduration = AgeCalculation().calculateAge(todayDate, dob);
        _nextduration = AgeCalculation().nextBirthday(todayDate, dob);
        _nextBirthdayWeekday = AgeCalculation().nextWeekday(todayDate, dob);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _ageduration = AgeCalculation().calculateAge(todayDate, dob);
    _nextduration = AgeCalculation().nextBirthday(todayDate, dob);
    _nextBirthdayWeekday = AgeCalculation().nextWeekday(todayDate, dob);

    print("You age is : ${_ageduration!.years}");
    print("Next Birthday is : $_nextduration ");

    print("Day birthday is : $_nextBirthdayWeekday ");

    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Age Calculator",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.brightness_4_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "${todayDate.day} ${_months[todayDate.month]} ${todayDate.year}",
                              style: TextStyle(
                                color: Color(0xff89C948),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _selectTodayDate(context);
                              },
                              child: Icon(
                                Icons.fiber_manual_record,
                                color: Color(0xff89C948),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date of Birth",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "${dob.day} ${_months[dob.month]} ${dob.year}",
                              style: TextStyle(
                                color: Color(0xff89C948),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _selectDOBDate(context);
                              },
                              child: Icon(
                                Icons.fiber_smart_record,
                                color: Color(0xff89C948),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0xffC4C4C4).withOpacity(.16),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "AGE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${_ageduration!.years}",
                                        style: TextStyle(
                                          color: Color(0xff89C948),
                                          fontSize: 38,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          "YEARS",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${_ageduration!.months} months | ${_ageduration!.days} days",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 180,
                              width: 1,
                              color: Color(0xff89C948),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "NEXT BIRTHDAY",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.cake,
                                        color: Color(0xff89C948),
                                        size: 48,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 6),
                                        child: Text(
                                          "${_days[_nextBirthdayWeekday]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${_nextduration!.months} months | ${_nextduration!.days} days",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Color(0xff89C948),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "SUMMARY",
                        style: TextStyle(
                          color: Color(0xff89C948),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "YEARS",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${_ageduration!.years}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "DAYS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${todayDate.difference(dob).inDays}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "MONTHS",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${((_ageduration!.years) * 12) + ((_ageduration!.months))} ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "HOURS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${todayDate.difference(dob).inHours}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "WEEKS",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${(todayDate.difference(dob).inDays / 7).floor()}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "MINUTES",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${todayDate.difference(dob).inMinutes}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
