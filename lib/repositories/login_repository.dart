import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jcc_admin/model/employee_model.dart';

class LoginRepository {
  LoginRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<EmployeeModel?> login(String email) async {
    final response = await _firestore.collection('employees').doc(email).get();

    final data = response.data();

    if (data == null) {
      return null;
    }else {
      return EmployeeModel.fromMap(data);
    }
  }
}
