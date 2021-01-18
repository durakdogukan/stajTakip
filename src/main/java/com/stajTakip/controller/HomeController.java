package com.stajTakip.controller;

import com.stajTakip.model.*;
import com.stajTakip.services.*;
import com.sun.net.httpserver.HttpContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Scope("session")
@Controller

//@RequestMapping
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    DanismanService danismanService;

    @Autowired
    StudentService studentService;

    @Autowired
    SirketbilgisiService sirketbilgisiService;

    @Autowired
    StajbirimService stajbirimService;

    @Autowired
    StajbilgisiService stajbilgisiService;

    @GetMapping({"/"})

    public String home() {

        return "student_login";

    }

    @GetMapping({"/student_login"})

    public String stajyerGiris() {

        return "student_login";

    }

    @GetMapping({"/deneme"})

    public String deneme() {

        return "deneme";

    }


    @GetMapping({"/yonetici_login"})

    public String yoneticiGiris() {

        return "student_login";

    }


    @GetMapping({"/studentOgrenci_list"})

    public String studentOgrenciGiris() {

        return "studentOgrenci_list";

    }


    @RequestMapping(value="/student_login", method=RequestMethod.POST)

    public ModelAndView stajyerGirisKontrol(HttpSession request, @ModelAttribute("user") User user){

        User user2 = getUserStudent(user);
        request.setAttribute("user", user2);

        if (user2 != null){
            Student student = getStudent(user2.getId());
            request.setAttribute("student", student);

            if(student != null){

                Sirketbilgisi sirketbilgisi = getSirket(student.getId());
                if (sirketbilgisi != null)
                    request.setAttribute("sirketbilgisi", sirketbilgisi);

                if(sirketbilgisi != null){

                    Stajbirim stajbirim = getStajbirim(student.getId());
                    if(stajbirim != null)
                        request.setAttribute("stajbirim", stajbirim);

                    if(stajbirim != null){

                        Stajbilgisi stajbilgisi = getStajbilgisi(student.getId());
                        if (stajbilgisi != null)
                            request.setAttribute("stajbilgisi", stajbilgisi);

                    }
                }
            }
        }

        if (user2 == null){

            return new ModelAndView("redirect:/student_login");

        }

        else

            return new ModelAndView("redirect:/studentOgrenci_list");

    }

    private User getUserStudent(User user){

        for (User user2: userService.getAllUsers())
        {

            for(Student student2: studentService.getAllStudents())
            {

                if (user2.getUsername().equals(user.getUsername()) && user2.getPassword().equals(user.getPassword())
                                                                   && student2.getUser().getUsername().equals(user.getUsername())
                                                                   && student2.getUser().getPassword().equals(user.getPassword())
                )
                {

                    return user2;

                }
            }
        }

        return null;

    }

    private Student getStudent(int user_id){

        for (Student student2: studentService.getAllStudents()){

            if(student2.getUser().getId() == user_id){

                return student2;

            }
        }

        return null;

    }

    // Staj bilgisi tablosundan student_id'si bizim gönderdiğimiz student_id'ye eşit olan student'ın
    // staj birim id'si alınır. Sonra bu id ile staj birim tablosundaki eşleşen kaydın şirket bilgisinin idsi elde edilir
    // bu id yoluyla şirket bilgisi bulunur.
    // Eğer student'idsi bulunamazsa boş kayıt döndürür.

    private  Sirketbilgisi getSirket(int student_id){

        try {
                for (Stajbilgisi stajbilgisi: stajbilgisiService.getAllStajbilgisi()){

                    if (stajbilgisi.getStudent() != null && stajbilgisi.getStudent().getId() == student_id){

                        int stajbirim_id = stajbilgisi.getStajbirim().getId();

                        for (Stajbirim stajbirim: stajbirimService.getAllStajbirim()){

                            if(stajbirim.getId() == stajbirim_id){

                                for(Sirketbilgisi sirketbilgisi: sirketbilgisiService.getAllSirketbilgisi()){

                                    if(sirketbilgisi.getId() == stajbirim.getSirketbilgisi().getId()){

                                        return sirketbilgisi;

                                    }
                                }
                            }
                        }
                    }
                }
        }catch(Exception e){
            System.out.println("Catch - Hata Alındı.");
        }
        return null;
    }

    private  Stajbirim getStajbirim(int student_id){

        for (Stajbilgisi stajbilgisi: stajbilgisiService.getAllStajbilgisi()){

            if (stajbilgisi.getStudent().getId() == student_id){

                int stajbirim_id = stajbilgisi.getStajbirim().getId();

                for (Stajbirim stajbirim: stajbirimService.getAllStajbirim()){

                    if(stajbirim.getId() == stajbirim_id){

                        return stajbirim;
                    }
                }
            }
        }
        return null;
    }

    private  Stajbilgisi getStajbilgisi(int student_id){

        for (Stajbilgisi stajbilgisi: stajbilgisiService.getAllStajbilgisi()){

            if (stajbilgisi.getStudent().getId() == student_id){
                return stajbilgisi;
            }
        }
        return null;
    }


    @RequestMapping(value="/yonetici_login", method=RequestMethod.POST)

    public ModelAndView yoneticiGirisKontrol(HttpSession request, @ModelAttribute("user") User user, @ModelAttribute("user") Danisman danisman){

        for (User user2: userService.getAllUsers())
        {
            for(Danisman danisman2: danismanService.getAllDanisman())
            {

                if (
                        user2.getUsername().equals(user.getUsername()) && user2.getPassword().equals(user.getPassword())
                                                                       && danisman2.getUser().getUsername().equals(user.getUsername())
                                                                       && danisman2.getUser().getPassword().equals(user.getPassword())
                   )

                {

                    request.setAttribute("user", user2);
                    request.setAttribute("danisman", danisman2);
                    return new ModelAndView("redirect:/student/list");

                }
            }
        }

        return new ModelAndView("redirect:/student_login");

    }
}