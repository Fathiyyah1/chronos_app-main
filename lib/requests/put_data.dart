import 'package:chronos/models/user.dart';
import 'package:chronos/services/dio_client.dart';
import 'package:chronos/services/utilities.dart';
import 'package:dio/dio.dart';

Future putUser(User user) async {
  Map<String, dynamic> data = user.toJson();
  data["avatar"] = (user.avatar != null)
      ? await getMultipartFile(
          user.avatar!, (user.username.isNotEmpty) ? user.username : user.name)
      : null;
  FormData formData = FormData.fromMap(data);
  var res = await DioHelper.dio.put('api/users', data: formData);
  print(res.data);
  return res;
}
