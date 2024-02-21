import 'dart:typed_data';

import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/components/messages_methods.dart';
import 'package:chronos/components/progress_indicator.dart';
import 'package:chronos/components/textfield.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/user.dart';
import 'package:chronos/requests/put_data.dart';
import 'package:chronos/services/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationPage extends StatefulWidget {
  PersonalInformationPage({
    Key? key,
  }) : super(key: key);
  // User user;
  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    TextEditingController incomeController = TextEditingController(
        text: appCubit.user.totalIncome.toStringAsFixed(2));
    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurvedAppBar(
            height: 200,
            isBackButton: true,
            title: "Personal Information",
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                appCubit.user.name,
                style: titleStyleWhite,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: (appCubit.user.avatar != null)
                        ? Image.memory(
                            appCubit.user.avatar!,
                            fit: BoxFit.fitWidth,
                          ).image
                        : null,
                    backgroundColor: Colors.teal,
                  ),
                  Positioned(
                    left: 110,
                    top: 100,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () async {
                          Uint8List? image = await getImage();
                          appCubit.updateUserAvatar(image);
                          String message = "";
                          showProgressIndicator(context);
                          try {
                            var res = await putUser(appCubit.user);
                            if (res.statusCode == 201) {
                              message = "Sucess";
                            } else {
                              message = res.data;
                            }
                          } catch (e) {
                            message = e.toString();
                          }
                          Navigator.pop(context);
                          showSnackBar(message, context);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "   Total Income",
            style: subTitleStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: getTextField(
                title: "Total Income",
                onChanged: (p0) {},
                icon: Icons.attach_money_outlined,
                controller: incomeController),
          ),
        ],
      ),
    );
  }
}
