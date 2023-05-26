class BooksProvider {
  final List<String> _booksInStorage = [
    'Колобок',
    'Букварь',
    'Отцы и дети',
    'Шоколад',
    'Поваренная книга анархиста',
    'Логика',
    'Граф Монте-Кристо',
    'Война и Мир',
    'На дне',
    'Волшеьник стрнаы Оз',
    'Герой нащего времени',
    'Атлант расправил плечи',
    'Кладбише домашних животных',
    'Осознанное питание',
    '1984',
  ];

  final List<String> _takenBooks = [
    'Ночной дозор',
    'Час быка',
    'Танцы на снегу',
    'Тихий дон',
    'Шерок Холмс'
  ];

  List<String> returnBookAt(int index) {
    var returnedBook = _takenBooks[index];
    _takenBooks.removeAt(index);
    List<String> newTakenBooks = [];
    newTakenBooks.addAll(_takenBooks);
    _booksInStorage.add(returnedBook);
    return newTakenBooks;
  }

  List<String> takeBookAt(int index) {
    var takenBook = _booksInStorage[index];
    _booksInStorage.removeAt(index);
    List<String> newBooksInStorage = [];
    newBooksInStorage.addAll(_booksInStorage);
    _takenBooks.add(takenBook);
    return newBooksInStorage;
  }

  List<String> get getTakenBooks => _takenBooks;
  List<String> get getBooksInStorage => _booksInStorage;
}
