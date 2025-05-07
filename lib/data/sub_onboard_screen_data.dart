import 'package:expenz/const/img_paths.dart';
import 'package:expenz/const/text.dart';
import 'package:expenz/model/sub_onboard_screen_model.dart';

class SubOnboardScreenData {
  static final List<SubOnboardScreenModel>
  subOnboardScreens = [
    SubOnboardScreenModel(
      imgPath: onboard_1,
      title: onboardTitle_1,
      description: onboardDis_1,
    ),
    SubOnboardScreenModel(
      imgPath: onboard_2,
      title: onboardTitle_2,
      description: onboardDis_2,
    ),
    SubOnboardScreenModel(
      imgPath: onboard_3,
      title: onboardTitle_3,
      description: onboardDis_3,
    ),
  ];
}
