import 'package:timetable/Data/dataContainer.dart';

class WeekDataContainer extends DataContainer{
  @override
  String get myName => 'courseList';

  @override
  void createData() {
    for(int w = 0; w < 7; w++){
      var course = [];
      for(int c = 0; c < 4; c++){
        course.add([]);
      }
      add(course);
    }
  }
}