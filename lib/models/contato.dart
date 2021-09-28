class Contato{
  final String nome;
  final int numero;
  final int id;

  Contato(this.nome, this.numero, this.id);

  @override
  String toString() {
    return 'Contato{Nome: $nome, Numero: $numero}';
  }
}