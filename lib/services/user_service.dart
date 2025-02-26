import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_test/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.cpf).set(user.toMap());
      print("Usuário adicionado com sucesso!");
    } catch (e) {
      print("Erro ao adicionar usuário: $e");
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.cpf).update(user.toMap());
      print("Usuário atualizado com sucesso!");
    } catch (e) {
      print("Erro ao atualizar usuário: $e");
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      var querySnapshot = await _firestore.collection('users').get();
      return querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Erro ao buscar usuários: $e");
      return [];
    }
  }

  Future<UserModel?> getUserByCpf(String cpf) async {
    try {
      var docSnapshot = await _firestore.collection('users').where('cpf',isEqualTo: cpf).get();
      if (docSnapshot.docs.isNotEmpty) {
        return UserModel.fromMap(docSnapshot.docs.first.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Erro ao buscar usuário: $e");
    }
    return null;
  }
}
