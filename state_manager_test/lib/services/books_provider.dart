class Book {
  late String name;
  late bool isBookTaken;

  Book(this.name, this.isBookTaken);
}

class BooksProvider {
  List<Book> allBooks = [
    Book('Колобок', true),
    Book('Букварь', false),
    Book('Отцы и дети', true),
    Book('Шоколад', false),
    Book('Поваренная книга анархиста', true),
    Book('Отцы и дети', false),
    Book('Граф Монте-Кристо', true),
    Book('Война и Мир', true),
    Book('На дне', true),
    Book('Волшеьник стрнаы Оз', false),
    Book('Отцы и дети', false),
    Book('Атлант расправил плечи', false),
    Book('Кладбише домашних животных', false),
    Book('Осознанное питание', false),
    Book('1984', false),
  ];

  List<Book> takenBooks = [];

  List<Book> getTakenBooks() {
    List<Book> takenBooks = [];
    for (var book in allBooks) {
      if (book.isBookTaken == true) {
        takenBooks.add(book);
      }
    }
    this.takenBooks = takenBooks;
    return takenBooks;
  }

  void removeBookFromTaken(int index) {
    // var takenBook = takenBooks[index];

    // for(var book in allBooks) {
    // }
    takenBooks.removeAt(index);
  }

  List<Book> getNewTakenBooks() {
    return takenBooks;
  }
}
