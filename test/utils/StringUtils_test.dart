import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_c1_online/utils/StringUtils.dart';

void main(){
  group('test extractFirstName function', (){




    test('when call extractFirstName with String wihtout spaces '
        'it should return same String', () {
      String input = "Mohamed";
      StringUtils utils = StringUtils();
      var actual =  utils.extractFirstName(input);
      expect(actual, input);
    });
    test('when call extractFirstName with String containes spaces '
        'it should return first segment', () {
      String input = "Mohamed Nabil";
      StringUtils utils = StringUtils();
      var actual =  utils.extractFirstName(input);
      expect(actual, "Mohamed");
    });
  });

}