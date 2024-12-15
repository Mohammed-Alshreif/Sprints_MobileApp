class BankAccount {
  String accountID;
  double balance;

  BankAccount(this.accountID, this.balance);
  BankAccount.zeroBalance(this.accountID) : balance = 0.0;

  void withdraw(int withdraw_NUM) {
    if (withdraw_NUM <= 0 || withdraw_NUM > balance) {
      print("ERROR");
    } else {
      balance -= withdraw_NUM;
      print("DONE...");
    }
  } // Correctly closed the withdraw method

  void deposit(int deposit_NUM) {
    if (deposit_NUM <= 0) {
      print("ERROR");
    } else {
      balance += deposit_NUM;
      print("DONE...");
    }
  } // Correctly closed the deposit method

  void displayAccountInfo() {
    print("USER ID $accountID");
    print("USER Balance $balance");
  } // Correctly closed the displayAccountInfo method
}

void main() {
  BankAccount account1 = BankAccount("mo13456", 500.0);
  BankAccount account2 = BankAccount.zeroBalance("mo2313");
  print("Initial Account Information:");
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  print("\nPerforming Transactions:");
  account1.deposit(150);
  account1.withdraw(700); 
  account1.withdraw(300);
  account2.deposit(200);
  account2.withdraw(100); 
  account2.withdraw(200); 
  print("\nFinal Account Information:");
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  
}
