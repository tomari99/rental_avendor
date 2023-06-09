import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'vendor_model.g.dart';


@JsonSerializable()
class Vendor extends GetxController {
  String? name;

  @JsonKey(name: "shop_name")
  String? shopName;
  String? email;
  String? phone;

  @JsonKey(name: "join_date")
  String? joinDate;
  String? address;
  int? status;

  @JsonKey(name: "auth_token")
  String? authToken;

  @JsonKey(name: "_id")
  String? id;
  Vendor(
      {this.name,
      this.shopName,
      this.email,
      this.phone,
      this.joinDate,
      this.address,
      this.authToken,
      this.id,
      this.status});

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  /// Connect the generated [_$VendorToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VendorToJson(this);

  void setToken() async {
    if (authToken != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("AuthToken", authToken!);
      // print(pref.getString("AuthToken"));
    } else {
      throw Exception("Auth Token is null");
    }
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("AuthToken");
    // print("token from getToken -> $token");
    if (token != null) return token;
    return null;
  }

  Future<void> removeToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("AuthToken");
    // print(pref.getString("AuthToken"));
  }

  // Future<void> setVendor({required Vendor vendor}) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (pref.getString("AuthToken") != null) {
  //     pref.setString("Vendor", vendor.toString());
  //   } else {
  //     throw Exception("Token is null , failed to set Vendor");
  //   }
  //   notifyListeners();
  // }

  // Future<String> getVendor() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   final vendor = pref.getString("Vendor");
  //   if (vendor != null) {
  //     return vendor;
  //   } else {
  //     throw Exception("Vendor data is null , cant get dat");
  //   }
  // }

  void addVendorData({required Vendor vendor}) {
    // print("add -> ${vendor.name}");
    name = vendor.name;
    shopName = vendor.shopName;
    id = vendor.id;
    email = vendor.email;
    phone = vendor.phone;
    joinDate = vendor.joinDate;
    address = vendor.address;
    authToken = vendor.authToken;
    status = vendor.status;
  }
}
