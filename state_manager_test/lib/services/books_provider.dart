class BooksProvider {
  List<String> booksInStorage = [
    'Колобок',
    'Букварь',
    'Отцы и дети',
    'Шоколад',
    'Поваренная книга анархиста',
    'Отцы и дети',
    'Граф Монте-Кристо',
    'Война и Мир',
    'На дне',
    'Волшеьник стрнаы Оз',
    'Отцы и дети',
    'Атлант расправил плечи',
    'Кладбише домашних животных',
    'Осознанное питание',
    '1984',
  ];

  List<String> takenBooks = [
    'Ночной дозор',
    'Час быка',
    'Танцы на снегу',
    'Тихий дон',
    'Шерок Холмс'
  ];

  List<String> returnBookAt(int index) {
    var returnedBook = takenBooks[index];
    takenBooks.removeAt(index);
    booksInStorage.add(returnedBook);
    return takenBooks;
  }

  List<String> takeBookAt(int index) {
    var takenBook = booksInStorage[index];
    booksInStorage.removeAt(index);
    takenBooks.add(takenBook);
    return booksInStorage;
  }

  List<String> getTakenBooks() {
    return takenBooks;
  }

  List<String> getBooksInStorage() {
    return booksInStorage;
  }
}
