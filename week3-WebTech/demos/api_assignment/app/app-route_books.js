// Book API
import express from "express";
import Books from "../js/books.js";
const library = express.Router();
let books = [];

books.push(new Books(1, "book1", "authorname1", 900));
books.push(new Books(2, "book2", "authorname2", 700));
books.push(new Books(3, "book3", "authorname3", 500));

// get all books
library.get("/books", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  res.send(books);
});

//get book by id
library.get("/books/:bookid", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  const book = books.find((b) => b.bookid == req.params.bookid);
  if (book) {
    res.send(book);
  } else {
    res.status(404).send("Book not found");
  }
});

//delete book by id
library.delete("/books/:bookid", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  const delete_bookid = req.params.bookid;
  books = books.filter(function (v, i, a) {
    return a[i].bookid != delete_bookid;
  });
  console.log(books);
  resp.send(books);
});

// Add book
library.post("/books/add", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  let bookid = req.body.bookid;
  let bookname = req.body.bookname;
  let authorname = req.body.authorname;
  let unitprice = req.body.unitprice;
  books.push(new Books(bookid, bookname, authorname, unitprice));
  resp.send("Book added");
});

// Update book by id
library.put("/books/:bookid/:unitprice", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  const bid = req.params.bookid;
  const book = books.find((b) => b.bookid == bid);
  if (book) {
    book.unitprice = req.params.unitprice;

    resp.send(JSON.stringify(book) + " updated with new price");
  } else {
    resp.status(404).send(bid + " No product found");
  }
});

export default library;
