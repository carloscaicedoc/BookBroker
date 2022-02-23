package com.carloscaicedo.bookbroker.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.carloscaicedo.bookbroker.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();
	List<Book> findAllByBorrowerIsNullOrderByTitle();
}
