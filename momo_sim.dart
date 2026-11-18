// Student: Asmaa Tagelsir
// Reg no: 26057
const String regNo = '26057';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ===== Part F: momoFee copied from D2 =====
int momoFee(int amount) {
  // by AT
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// ===== F1: formatRwf, commas every 3 digits and "RWF" at the end =====
String formatRwf(int amount) {
  // by AT
  bool negative = amount < 0;
  String digits = (negative ? -amount : amount).toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    result = digits[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  if (negative) {
    result = '-' + result;
  }
  return '$result RWF';
}

// ===== F2: isValidPin =====
bool isValidPin(String pin) {
  // by AT
  if (pin.length != 5) return false; // exactly 5 characters
  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false; // every character is a digit
    i++;
  }
  if (pin == '12345') return false; // not 12345
  bool allSame = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      allSame = false;
    }
    i++;
  }
  if (allSame) return false; // not the same digit five times
  return true;
}

// ===== F3: sendMoney =====
int sendMoney(int balance, int amount) {
  // by AT
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// ===== F4: buyAirtime =====
int buyAirtime(int balance, int amount) {
  // by AT
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be from 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought ${formatRwf(amount)} airtime. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by AT

  // Personal block: first line printed
  print('Reg no: $regNo | D=$d | T=$t');

  // main 1: PIN checks ('4821D' uses my D)
  print("isValidPin('12345') = ${isValidPin('12345')}");
  print("isValidPin('77777') = ${isValidPin('77777')}");
  print("isValidPin('4821') = ${isValidPin('4821')}");
  print("isValidPin('48a21') = ${isValidPin('48a21')}");
  print("isValidPin('4821$d') = ${isValidPin('4821$d')}");

  // main 2: starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // main 3: transactions in the required order
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // main 4: final balance
  print('Final balance: ${formatRwf(balance)}');

  // main 5: my own tests (expected output in the comment)
  print(formatRwf(999999)); // expected: 999,999 RWF
  print(formatRwf(100000)); // expected: 100,000 RWF
  print(formatRwf(1000000)); // expected: 1,000,000 RWF
  print(formatRwf(-999)); // expected: -999 RWF
  print(formatRwf(-100000)); // expected: -100,000 RWF
  print(isValidPin('00000')); // expected: false
  print(isValidPin('01234')); // expected: true (leading zero is fine)
  print(isValidPin('123456')); // expected: false (6 characters)
  print(isValidPin('')); // expected: false
  // might break: '-1234' has 5 characters, int.tryParse would accept it
  print(isValidPin('-1234')); // expected: false
}