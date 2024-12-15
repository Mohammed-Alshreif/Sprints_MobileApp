class Book {
  String id;
  String title;
  bool borrowed;

  Book(this.id, this.title, {this.borrowed = false});

  void displayInfo() {
    print("Book ID: $id, Title: $title, Borrowed: $borrowed");
  }
}

class User {
  String id;
  String name;

  User(this.id, this.name);

  void displayInfo() {
    print("User ID: $id, Name: $name");
  }
}

class Library {
  var books = [];
  var users = [];

  void addBook(Book book) {
    books.add(book);
    print("Book '${book.title}' added...");
  }

  void addUser(User user) {
    users.add(user);
    print("User '${user.name}' added...");
  }

  void borrowBook(String book_Id, String user_Id) {
    //
    Book? book = books.firstWhere((b) => b.id == book_Id,orElse: () => null);
    if (book == null) {
      print("ID $book_Id does not exist.");
      return;
    }

    if (book.borrowed) {
      print("Book '${book.title}' already borrowed.");
      return;
    }

    User? user = users.firstWhere((u) => u.id == user_Id, orElse: () => null);
    if (user == null) {
      print("ID $user_Id does not exist.");
      return;
    }

    book.borrowed = true;
    print("Book '${book.title}' borrowed by User'${user.name}'.");
  }

  void returnBook(String bookId) {
    Book? book = books.firstWhere((b) => b.id == bookId, orElse: () => null);
    if (book == null) {
      print("Book with ID $bookId does not exist.");
      return;
    }

    if (!book.borrowed) {
      print("Book '${book.title}' was not borrowed.");
      return;
    }

    book.borrowed = false;
    print("Book '${book.title}' returned to the library.");
  }

  void displayInfo() {
    print("\nLibrary Books:");
    for (var book in books) {
      book.displayInfo();
    }

    print("\nLibrary Users:");
    for (var user in users) {
      user.displayInfo();
    }
  }
}

void main() {
 
  Library library = Library();
  
  library.addBook(Book("1", "SPRINTS"));
  library.addBook(Book("2", "elaraby"));
  library.addBook(Book("3", "embedded"));
  library.addUser(User("1", "momo"));
  library.addUser(User("2", "momo2"));
  library.borrowBook("1", "1"); 
  library.borrowBook("2", "2");
  library.returnBook("1");         
  library.borrowBook("3", "1"); 
  library.displayInfo();
}
