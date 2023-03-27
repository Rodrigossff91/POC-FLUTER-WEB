import 'package:get/get.dart';
import 'package:tvlegaleadm/tv/screen_tv_details_custom.dart';
import 'package:tvlegaleadm/tv/screen_tv_list.dart';

List<GetPage> pages = [
  GetPage(
    name: "/TvList",
    page: () => ScreenTvList(),
  ),
  GetPage(
    name: "/TvCustomDetails",
    page: () => const ScreenTvDetailsCustom(),
  ),
];
