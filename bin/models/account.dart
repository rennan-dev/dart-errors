class Account {
  String name;
  double balance;
  bool isAuthenticated;
  DateTime? createdAt;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated,
      this.createdAt}):
      assert(name.isNotEmpty, "O nome não pode ser uma String vazia."),
      assert(balance >= 0, "O saldo deve ser maior ou igual a zero.");

  editBalance({required value}) {
    balance = balance + value;
  }
}
