class BoggleGameData {
  final List<String> letters;
  final List<String> words;

  BoggleGameData({required this.letters, required this.words});
}

final Map<String, BoggleGameData> gameLevels = {
  'easy': BoggleGameData(
    letters: ['A', 'B', 'C', 'D', 'E', 'F'],
    words: ['FACE', 'DEAF', 'BEAD', 'CAFE', 'FAD', 'BED', 'ACED', 'BEEF', 'FEED', 'DEF','ACE','BAD','CAB','CAD','DAB',],
  ),
  'medium': BoggleGameData(
    letters: ['J', 'K', 'L', 'M', 'N', 'O', 'G', 'H', 'I'],
    words: ['JIG', 'JOG', 'KIN', 'LOG', 'NIL', 'GIN', 'HIM', 'INK', 'ION', 'JIN', 'KIM', 'KIN','KOI','OIL','JOIN','KLIN','KING','LION','LONG','MONK','MOTH','MINI','JOLT','LING','KILO','LOIN','MINT'],
  ),
  'hard': BoggleGameData(
    letters: ['P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'A'],
    words: ['ZAP', 'PAW', 'RAY', 'SAW', 'TAX', 'VAT', 'WAX', 'PAY', 'RAT', 'SAY', 'TUX', 'PAR', 'PAT', 'SAT', 'TAR','SWAN','TRAP','VAST','WAXY','ZANY','PAVE','RAZE','STAY','TRAY','AQUA','YAWN','PART','STAR','TAXI','RAPT'],
  ),
};