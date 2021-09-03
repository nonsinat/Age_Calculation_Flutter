import 'package:age/age.dart';
import 'package:age_calculator/age_calculator.dart';

class AgeCalculation {
  AgeDuration calculateAge(DateTime today, DateTime birthday) {
    AgeDuration age;
    age = Age.dateDifference(
      fromDate: birthday,
      toDate: today,
      includeToDate: false,
    );
    return age;
  }

  AgeDuration nextBirthday(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);
    DateTime nextBirthdayDate = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        : temp;
    AgeDuration nextBirthdayDuration =
        Age.dateDifference(fromDate: today, toDate: nextBirthdayDate);
    return nextBirthdayDuration;
  }

  /// Calculator Next Birthday Weekly

  int nextWeekday(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);

    DateTime nextBirthdayDate = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        : temp;

    return nextBirthdayDate.weekday;
  }
}
