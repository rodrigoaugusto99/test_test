import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_test/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('users').add(user.toMap());
    } catch (e) {
      print('Erro ao adicionar usuário: $e');
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } catch (e) {
      print('Erro ao atualizar usuário: $e');
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      var querySnapshot = await _firestore.collection('users').get();
      return querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      print("Erro ao buscar usuários: $e");
      return [];
    }
  }

  Future<UserModel?> getUserByCpf(String cpf) async {
    // throw Exception('aaaaaaaaaaaaaa');

    try {
      var docSnapshot = await _firestore
          .collection('users')
          .where('cpf', isEqualTo: cpf)
          .get();
      if (docSnapshot.docs.isNotEmpty) {
        var doc = docSnapshot.docs.first;
        return UserModel.fromMap(doc.data(), doc.id);
      } else {
        throw Exception('Usuário não existe');
      }
    } catch (e) {
      throw Exception('Erro ao buscar usuário');
    }
  }
}
