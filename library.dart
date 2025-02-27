import 'dart:io';

List<Map<String, dynamic>> library = [];

void addBook({required String title, String author = "Unknown", int year = 0, String genre = "General"}) {
  library.add({
    "title": title,
    "author": author,
    "year": year,
    "genre": genre,
  });
  print("Book added successfully.\n");
}

void getBookInfo({required String title}) {
  for (var book in library) {
    if (book["title"].toLowerCase() == title.toLowerCase()) {
      print("Title: ${book["title"]}, Author: ${book["author"]}, Year: ${book["year"]}, Genre: ${book["genre"]}\n");
      return;
    }
  }
  print("Book not found.\n");
}

void listAllBooks({String genre = ""}) {
  if (library.isEmpty) {
    print("No books in the library.\n");
    return;
  }

  print("Library Books:");
  for (var book in library) {
    if (genre.isEmpty || book["genre"].toLowerCase() == genre.toLowerCase()) {
      print("Title: ${book["title"]}, Author: ${book["author"]}, Year: ${book["year"]}, Genre: ${book["genre"]}");
    }
  }
  print("");
}

void listBooksByGenre({required String genre}) {
  List<String> booksInGenre = [];
  for (var book in library) {
    if (book["genre"].toLowerCase() == genre.toLowerCase()) {
      booksInGenre.add(book["title"]);
    }
  }

  if (booksInGenre.isNotEmpty) {
    print("Books in genre '$genre': ${booksInGenre.join(", ")}\n");
  } else {
    print("No books found for this genre.\n");
  }
}

void removeBook({required String title}) {
  for (var book in library) {
    if (book["title"].toLowerCase() == title.toLowerCase()) {
      library.remove(book);
      print("Book removed successfully.\n");
      return;
    }
  }
  print("Book not found.\n");
}

void main() {
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

        addBook(title: title, author: author, year: year, genre: genre);
        break;

      case '2':
        stdout.write("Enter book title to retrieve info: ");
        String title = stdin.readLineSync()!;
        getBookInfo(title: title);
        break;

      case '3':
        listAllBooks();
        break;

      case '4':
        stdout.write("Enter genre to filter books: ");
        String genre = stdin.readLineSync()!;
        listBooksByGenre(genre: genre);
        break;

      case '5':
        stdout.write("Enter book title to remove: ");
        String title = stdin.readLineSync()!;
        removeBook(title: title);
        break;

      case '6':
        print("Exiting program. Goodbye!");
        return;

      default:
        print("Invalid option. Please try again.\n");
    }
  }
}
