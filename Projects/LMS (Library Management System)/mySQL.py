import sqlite3

class DataBase():
    """This class is used as the object with which Python to interacts with the SQLite database."""

    def __init__(self):
        """Constructor method."""

        # Creating database and cursor,
        self.connection = sqlite3.Connection("books.db")
        self.cursor = self.connection.cursor()

        # Creating 'Books' table if it does not exist,
        try:
            sql_statement = """CREATE TABLE IF NOT EXISTS Books (
	        BookName VARCHAR(255) NOT NULL,
	        Author VARCHAR(255),
	        Published INTEGER,
	        ISBN CHAR(13) UNIQUE,
	        ID INTEGER PRIMARY KEY AUTOINCREMENT
        );"""

            self.cursor.execute(sql_statement)
            self.connection.commit()

        except Exception as error:
            print(error)

    def addBook(self, book_name, author, published, ISBN):
        """Use this method to add a book entry to the database."""

        sql_statement = """INSERT INTO Books (BookName, Author, Published, ISBN) VALUES
        ("{}", "{}", {}, "{}");""".format(book_name, author, published, ISBN)

        self.cursor.execute(sql_statement)
        self.connection.commit()

    def allBooks(self):
        """Returns all rows of the 'Books' database as elements of a list."""

        sql_statement = """SELECT * FROM Books;"""
        self.cursor.execute(sql_statement)
        rows = self.cursor.fetchall()

        self.cursor.execute(sql_statement)
        self.connection.commit()

        return rows

    def deleteBook(self, by, by_value):
        """Delete a book entry from the database by either its unique ID or its ISBN."""

        if by == "ISBN":
            sql_statement = """DELETE FROM Books WHERE ISBN = '{}'""".format(by_value)
        elif by == "ID":
            sql_statement = """DELETE FROM Books WHERE ID = {}""".format(by_value)
        else:
            # Exit out of function without executing SQL,
            return None

        self.cursor.execute(sql_statement)
        self.connection.commit()

        return None
    
    def searchBook(self, by, by_value):
        """Delete a book entry from the database by either its unique ID or its ISBN."""

        if by == "Book_Name":
            sql_statement = """SELECT BookName, Author, Published, ISBN, ID FROM Books WHERE BookName = '{}'""".format(by_value)
        elif by == "Author":
            sql_statement = """SELECT BookName, Author, Published, ISBN, ID FROM Books WHERE Author = '{}'""".format(by_value)
        elif by == "ISBN":
            sql_statement = """SELECT BookName, Author, Published, ISBN, ID FROM Books WHERE ISBN = '{}'""".format(by_value)
        elif by == "ID":
            sql_statement = """SELECT BookName, Author, Published, ISBN, ID FROM Books WHERE ID = {}""".format(by_value)
        else:
            # Exit out of function without executing SQL,
            return None

        results = self.cursor.fetchall()
        self.cursor.execute(sql_statement)
        self.connection.commit()

        return results
    
    
        




DB = DataBase()
print(DB.searchBook(by="Book_Name", by_value="Book 1"))
