import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:profy/models/user_profile.dart';

class DataController extends GetxController {
  var userProfiles = <UserProfile>[].obs;
  final storage = GetStorage();
  final String userKey = "user";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    final users = storage.read(userKey);
    if (users != null&& users is List) {
      userProfiles.assignAll(
        (users as List).map((e) => UserProfile.fromJson(e)).toList(),
      );
    }
  }

  void addUser(UserProfile user) {
    userProfiles.add(user);
    userProfiles.refresh();
    storage.write(userKey, userProfiles.map((e) => e.tojson()).toList());
  }
  void updateUser(UserProfile updateUser) {
    int index = userProfiles.indexWhere((user) => user.id == updateUser.id);
    if (index != -1) {
      userProfiles[index] = updateUser;
      userProfiles.refresh();
      storage.write(userKey, userProfiles.map((e) => e.tojson()).toList());
    }
  }

}
