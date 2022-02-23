package com.carloscaicedo.bookbroker.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.carloscaicedo.bookbroker.models.Book;
import com.carloscaicedo.bookbroker.models.LoginUser;
import com.carloscaicedo.bookbroker.models.User;
import com.carloscaicedo.bookbroker.services.BookService;
import com.carloscaicedo.bookbroker.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private BookService bookServ;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User()); //for Register form
		model.addAttribute("newLogin", new LoginUser()); //for Login form
		return "index.jsp";
	}
	
	@GetMapping("/books")
	private String bookDashboard(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";			
		}
		User user = userServ.getOneUser((Long) session.getAttribute("userId"));		
		List<Book> allBooks = bookServ.availableBooks();
		model.addAttribute("allBooks", allBooks);
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result,  HttpSession session, Model model) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
    		model.addAttribute("newLogin", new LoginUser());//+Login form model
            return "index.jsp";
        }
        session.setAttribute("userId", newUser.getId());
        session.setAttribute("userName", newUser.getUserName());
        return "redirect:/books";
    }
	
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());//+register form model
            return "index.jsp";
        }
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());
        return "redirect:/books";
    }
    
    @GetMapping("/logout")
    public String home(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }	
}
