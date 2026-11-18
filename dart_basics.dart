// Student: ASMAA TAGELSIR
// Reg no: 26057
const String regNo = '26057';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by AT 
  text = text.toLowerCase();

  int count = 0;
  int i = 0;

  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }

  return count;
}

String initials(String fullName) {
  // by AT 
  fullName = fullName.trim();

  if (fullName.isEmpty) {
    return '';
  }

  List<String> names = fullName.split(RegExp(r'\s+'));

  String result = '';
  int i = 0;

  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

void main() {
  // by AT
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'ASMAA TAGELSIR';

  print('$fullName has ${countVowels(fullName)} vowels');

  print(initials('ASMAA TAGELSIR'));
  print(initials(' ana uwase '));
  print(initials(' '));
}