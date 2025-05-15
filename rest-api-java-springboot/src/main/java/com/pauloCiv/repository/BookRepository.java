package com.pauloCiv.repository;

import com.pauloCiv.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {}