// Student: Asmaa Tagelsir
// Reg no: 26057
const String regNo = '26057';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ===== B2: count the vowels (capital letters count too) =====
int countVowels(String text) {
  // by AT
  String lower = text.toLowerCase(); // this line makes capitals count
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) {
      count++;
    }
    i++;
  }
  return count;
}

// ===== B3: initials, handles extra spaces and empty text =====
String initials(String fullName) {
  // by AT
  String result = '';
  bool newWord = true;
  int i = 0;
  while (i < fullName.length) {
    String ch = fullName[i];
    if (ch.trim().isEmpty) {
      newWord = true;
    } else if (newWord) {
      result += ch.toUpperCase() + '.';
      newWord = false;
    }
    i++;
  }
  return result;
}

// ===== C5: right-aligned triangle, odd rows * and even rows # =====
void drawTriangle(int height) {
  // by AT
  int row = 1;
  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    print(' ' * (height - row) + symbol * row);
    row++;
  }
}

// ===== D2: MoMo fee tariff =====
int momoFee(int amount) {
  // by AT
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// ===== D2: mask the phone number =====
String maskPhone(String phone) {
  // by AT
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) + '*' * 5 + phone.substring(8);
}

void main() {
  // by AT

  // Personal block: first line printed
  print('Reg no: $regNo | D=$d | T=$t');

  // B2: call with my full name
  String name = 'Asmaa Tagelsir';
  print('$name has ${countVowels(name)} vowels');

  // B3: my name, extra spaces, empty string
  print(initials(name));
  print(initials('  ana   uwase  '));
  print(initials(''));

  // C5: height D + 3, then 0 and -2 (these two print nothing)
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2: receipts with a while loop, i from 1 to D + 3
  String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}