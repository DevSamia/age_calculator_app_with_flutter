class DateUtil {
  static int calculateAgeFromDate(DateTime dateOfBirth, DateTime currentDate) {
    int age = currentDate.year - dateOfBirth.year;
    if (_isCurrentDateBeforeBirthday(dateOfBirth, currentDate)) {
      age--;
    }
    return age;
  }

  static bool _isCurrentDateBeforeBirthday(DateTime dateOfBirth, DateTime currentDate) {
    return currentDate.month < dateOfBirth.month ||
        (currentDate.month == dateOfBirth.month && currentDate.day < dateOfBirth.day);
  }
}
