package com.kaishengit.action;

import com.kaishengit.pojo.Book;
import com.kaishengit.pojo.BookType;
import com.kaishengit.pojo.Publisher;
import com.kaishengit.service.BookService;
import com.kaishengit.util.Page;
import com.kaishengit.util.SearchParam;
import org.apache.struts2.components.If;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import javax.inject.Inject;
import java.util.List;

@Namespace("/book")
public class BookAction extends BaseAction {
    @Inject
    private BookService bookService;

    private List<Book> bookList;
    private List<BookType> bookTypeList;
    private List<Publisher> publisherList;
    private Book book;
    private Integer id;
    private Integer p;
    private Page<Book> page;

    @Action("list")
    @Override
    public String execute() throws Exception {
        if (p==null){
            p=1;
        }
//        bookList = bookService.findAllBook();
        List<SearchParam> searchParams = SearchParam.buiderSearchParam(getHttpServletRequest());
        page = bookService.findByPage(p,searchParams);
        bookTypeList = bookService.findAllBookType();
        publisherList = bookService.findAllPublisher();
        return SUCCESS;
    }

    @Action("new")
    public String toSave(){
        bookTypeList = bookService.findAllBookType();
        publisherList = bookService.findAllPublisher();
        return SUCCESS;
    }


    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }

    public List<BookType> getBookTypeList() {
        return bookTypeList;
    }

    public void setBookTypeList(List<BookType> bookTypeList) {
        this.bookTypeList = bookTypeList;
    }

    public List<Publisher> getPublisherList() {
        return publisherList;
    }

    public void setPublisherList(List<Publisher> publisherList) {
        this.publisherList = publisherList;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getP() {
        return p;
    }

    public void setP(Integer p) {
        this.p = p;
    }

    public Page<Book> getPage() {
        return page;
    }

    public void setPage(Page<Book> page) {
        this.page = page;
    }
}

