package com.carloscaicedo.bookbroker.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.carloscaicedo.bookbroker.models.Book;
import com.carloscaicedo.bookbroker.services.BookService;

@RestController
public class APIController {
	
	// ^^^^^^^^ Book API Routes ^^^^^^^^^
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/api/books")
	public List<Book> showAll() {
		return bookService.allBooks();
	}
	
	@PostMapping(value="/api/books")
	public Book create(
			@RequestParam(value="title") String title,
			@RequestParam(value="author") String author,
			@RequestParam(value="thoughts") String thoughts) {
		Book book = new Book(title, author, thoughts);
		return bookService.createBook(book);
	}
}
