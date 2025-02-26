class UserModel {
  final String cpf;
  final String nome;
  final int idade;

  UserModel({required this.cpf, required this.nome, required this.idade});

  // Método para converter de Map para UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'] ?? '',
      nome: map['name'] ?? '',
      idade: map['idade'] ?? 0,
    );
  }

  // Método para converter UserModel em Map
  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'name': nome, //o amarelinho é o campo do bd
      'idade': idade,
    };
  }
}
