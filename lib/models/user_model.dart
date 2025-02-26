class UserModel {
  final String cpf;
  final String nome;
  final int idade;

  UserModel({
    required this.cpf,
    required this.nome,
    required this.idade,
  });

  // Método para criar um UserModel a partir de um Map de dados (do Firestore)
  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      cpf: documentId, // O CPF será o documentId, que é único
      nome: data['nome'],
      idade: data['idade'],
    );
  }

  // Método para converter um UserModel de volta para Map (quando você precisar salvar no Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'idade': idade,
    };
  }
}
