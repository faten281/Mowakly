// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fp/component/components.dart';
import 'package:fp/component/main_screens_components.dart';
import 'package:fp/component/text_widget.dart';
import 'package:fp/constants/constant_colors.dart';
import 'package:fp/network/models/models.dart';
import 'package:fp/screens/LawyerMainScreens/edit_profile_screen_lawyer/edit_profile_lawyer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../component/buildButton.dart';

class ProfilePageLawyer extends StatefulWidget {
  const ProfilePageLawyer({Key? key}) : super(key: key);

  @override
  State<ProfilePageLawyer> createState() => _ProfilePageLawyerState();
}

class _ProfilePageLawyerState extends State<ProfilePageLawyer> {
  String brief ='محامي متمرس  متخصص في القانون التجاري. عملت على أكثر من خمسين قضية من إعداد المِلَفّ إلى  إصدار الحكم. إثر عملي كمحامي متدرب اشتغلت مع كبار المحامين في المملكة العربية السعودية و تمرنت على أيديهم. افتتحت مكتبي الخاص في الاستشارات القانونية و المحاماة بجدة منذ سنة 2010.  قمت حتى الآن بمباشرة جميع أنواع القضايا سواء كانت مدنية شرعية تجارية أو جنائية. قدمت مئات الاستشارات القانونية في شتى القطاعات.';
  List<String> majors = ['أسرة', 'مدني'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(DARK_GREEN),
      body: Stack(
        children: [
          Container(
            height: 80.h,
            width: double.infinity,
            margin: EdgeInsets.only(top: 16.h),
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(36),
                topLeft: Radius.circular(36),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                     Center(child: TextWidget(label: '${loginmodel!.data!.fname} ${loginmodel!.data!.lname}')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        TextWidget(
                          label: 'محامي',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        Icon(
                          Icons.person,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    Center(
                        child: BuildButton(
                      title: 'تعديل الملف الشخصي',
                      labelSize: 12,
                      height: 40,
                      width: 160,
                          rightIcon: Icons.tune_rounded,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EditProfilePageLawyer(),
                            ));
                      },
                    )),
                    TFLabel(label: 'نبذة عني'),
                    TextWidget(
                        fontSize: 12,
                        label: brief),
                    SizedBox(height: 12,),
                    TFLabel(label: 'مجال التخصص'),
                    SizedBox(
                      height: 40,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: majors.length + 1 ?? 0 + 1,
                          itemBuilder: (context, index) {
                            if (index == majors.length) {
                              return AddButton(onPress: () {});
                            } else {
                              return SmallTextContainer(text: majors[index]);
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    TFLabel(label: 'سعر الخدمة'),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        ServicePrice(
                            major: 'مدني',
                            channel: 'مكالمة صوتية',
                            price: '300 EG'),
                        SmallDeleteButton(onPress: () {}),
                        SmallAddButton(onPress: () {}),
                      ],
                    ),
                    SizedBox(height: 12,),
                    TFLabel(label: 'المرفقات'),
                    BuildButton(
                        title: 'أضف المزيد من هنا',
                        labelSize: 12,
                        height: 32,
                        width: 160,
                        rightIcon: Icons.add_circle_outline,
                        onPress: () {})
                  ],
                ),
              ),
            ),
          ),

          // profile picture
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Align(
              alignment: Alignment.topCenter,
              child: ProfilePicture(),
            ),
          ),
        ],
      ),
    );
  }
}
