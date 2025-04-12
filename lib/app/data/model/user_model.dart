class UserModel {
  final int id;
  final String empId;
  final String name;
  final String mobile;
  final String address;
  final String nid;
  final String image;
  final String designation;
  final int designationId;
  final String role;
  final String? district;
  final int upazilaId;
  final int unionId;
  final int unitId;
  final String? upazila;
  final String? unionName;
  final String? unitName;
  final String createDate;
  final String updateDate;
  final String inTime;
  final String outTime;
  final int leaveBalance;
  final String createPrivilege;
  final String readPrivilege;
  final String deletePrivilege;
  final String editPrivilege;

  UserModel({
    required this.id,
    required this.empId,
    required this.name,
    required this.mobile,
    required this.address,
    required this.nid,
    required this.image,
    required this.designation,
    required this.role,
    required this.designationId,
    required this.upazilaId,
    required this.unionId,
    required this.unitId,
    required this.createDate,
    required this.updateDate,
    required this.inTime,
    required this.outTime,
    required this.leaveBalance,
    required this.createPrivilege,
    required this.readPrivilege,
    required this.deletePrivilege,
    required this.editPrivilege,
    this.district,
    this.upazila,
    this.unionName,
    this.unitName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      empId: json['emp_id'] ?? "",
      name: json['name'] ?? "",
      mobile: json['mobile'] ?? "",
      address: json['address'] ?? "",
      nid: json['nid'] ?? "",
      image: json['image'] ?? "",
      designation: json['designation'] ?? "",
      designationId: json['designation_id'] ?? 0,
      role: json['role'] ?? "",
      district: json['district']?.toString(),
      upazilaId: json['upazila_id'] ?? 0,
      unionId: json['union_id'] ?? 0,
      unitId: json['unit_id'] ?? 0,
      upazila: json['upazila']?.toString(),
      unionName: json['unionName']?.toString(),
      unitName: json['unitName']?.toString(),
      createDate: json['createDate'] ?? "",
      updateDate: json['updateDate'] ?? "",
      inTime: json['in_time'] ?? "",
      outTime: json['out_time'] ?? "",
      leaveBalance: json['leaveBalance'] ?? 0,
      createPrivilege: json['create_privilege'] ?? "",
      readPrivilege: json['read_privilege'] ?? "",
      deletePrivilege: json['delete_privilege'] ?? "",
      editPrivilege: json['edit_privilege'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emp_id': empId,
      'name': name,
      'mobile': mobile,
      'address': address,
      'nid': nid,
      'image': image,
      'designation': designation,
      'designation_id': designationId,
      'role': role,
      'district': district,
      'upazila_id': upazilaId,
      'union_id': unionId,
      'unit_id': unitId,
      'upazila': upazila,
      'unionName': unionName,
      'unitName': unitName,
      'createDate': createDate,
      'updateDate': updateDate,
      'in_time': inTime,
      'out_time': outTime,
      'leaveBalance': leaveBalance,
      'create_privilege': createPrivilege,
      'read_privilege': readPrivilege,
      'delete_privilege': deletePrivilege,
      'edit_privilege': editPrivilege,
    };
  }
}
