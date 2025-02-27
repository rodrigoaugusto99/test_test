class UserModel {
  String? id; // ID gerado pelo Firestore
  String cpf;
  String nome;
  int idade;

  UserModel({this.id, required this.cpf, required this.nome, required this.idade});

  // Converte um objeto UserModel para um Map (para salvar no Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cpf': cpf,
      'nome': nome,
      'idade': idade,
    };
  }

  // Constrói um UserModel a partir de um Map (quando busca do Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId, // Pega o ID do Firestore
      cpf: map['cpf'],
      nome: map['name'],
      idade: map['idade'],
    );
  }
}
