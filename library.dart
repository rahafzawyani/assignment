import 'dart:io';

class Library {
  Map<String, Map<String, dynamic>> books = {};

  void addBook() {
    stdout.write("Enter book title: ");
    String title = stdin.readLineSync()!;

    stdout.write("Enter author (default: Unknown): ");
    String author = stdin.readLineSync()!;
    if (author.isEmpty) author = "Unknown";

    stdout.write("Enter year (default: 0): ");
    String yearInput = stdin.readLineSync()!;
    int year = yearInput.isEmpty ? 0 : int.parse(yearInput);

    stdout.write("Enter genre (default: General): ");
    String genre = stdin.readLineSync()!;
    if (genre.isEmpty) genre = "General";

    books[title] = {
      "author": author,
      "year": year,
      "genre": genre,
    };
    print("Book added successfully.\n");
  }

  void getBookInfo() {
    stdout.write("Enter book title to retrieve info: ");
    String title = stdin.readLineSync()!;
    if (books.containsKey(title)) {
      var book = books[title]!;
      print("Author: ${book["author"]}, Year: ${book["year"]}, Genre: ${book["genre"]}\n");
    } else {
      print("Book not found.\n");
    }
  }

  void listAllBooks() {
    if (books.isEmpty) {
      print("No books in the library.\n");
      return;
    }
    print("Library Books:");
    for (var entry in books.entries) {
      print("Title: ${entry.key}, Author: ${entry.value["author"]}, Year: ${entry.value["year"]}, Genre: ${entry.value["genre"]}");
    }
    print("");
  }

  void listBooksByGenre() {
    stdout.write("Enter genre to filter books: ");
    String genre = stdin.readLineSync()!;
    List<String> booksInGenre = [];
    for (var entry in books.entries) {
      if (entry.value["genre"].toLowerCase() == genre.toLowerCase()) {
        booksInGenre.add(entry.key);
      }
    }
    if (booksInGenre.isNotEmpty) {
      print("Books in genre '$genre': ${booksInGenre.join(", ")}\n");
    } else {
      print("No books found for this genre.\n");
    }
  }

  void removeBook() {
    stdout.write("Enter book title to remove: ");
    String title = stdin.readLineSync()!;
    if (books.containsKey(title)) {
      books.remove(title);
      print("Book removed successfully.\n");
    } else {
      print("Book not found.\n");
    }
  }
}

void main() {
  Library library = Library();
  while (true) {
    print("Library Management System:");
    print("1. Add Book");
    print("2. Get Book Info");
    print("3. List All Books");
    print("4. List Books by Genre");
    print("5. Remove Book");
    print("6. Exit");
    stdout.write("Choose an option: ");
    String choice = stdin.readLineSync()!;
    print("");

    switch (choice) {
      case '1':
        library.addBook();
        break;
      case '2':
        library.getBookInfo();
        break;
      case '3':
        library.listAllBooks();
        break;
      case '4':
        library.listBooksByGenre();
        break;
      case '5':
        library.removeBook();
        break;
      case '6':
        print("Exiting program. Goodbye!");
        return;
      default:
        print("Invalid option. Please try again.\n");
    }
  }
}
