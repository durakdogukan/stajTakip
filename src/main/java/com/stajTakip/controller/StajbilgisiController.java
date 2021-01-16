package com.stajTakip.controller;

import com.stajTakip.model.*;
import com.stajTakip.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Controller
@RequestMapping(value="/stajbilgisi")

public class StajbilgisiController {

    @Autowired
    StajbilgisiService stajbilgisiService;

    @Autowired
    StudentService studentService;

    @Autowired
    SirketbilgisiService sirketbilgisiService;

    @Autowired
    StajbirimService stajbirimService;


    @RequestMapping(value="/list", method= RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("stajbilgisi_list");
        List<Stajbilgisi> stajbilgisiList = stajbilgisiService.getAllStajbilgisi();
        model.addObject("stajbilgisiList", stajbilgisiList);
        return model;
    }



    @RequestMapping(value="/addStajbilgisi/", method=RequestMethod.GET)
    public ModelAndView addStajbilgisi() {

        ModelAndView model = new ModelAndView();
        Stajbilgisi stajbilgisi = new Stajbilgisi();
        model.addObject("stajbilgisiForm", stajbilgisi);

        List<Student> studentList = studentService.getAllStudents();
        model.addObject("studentList", studentList );

        List<Sirketbilgisi> sirketbilgisiList = sirketbilgisiService.getAllSirketbilgisi();
        model.addObject("sirketbilgisiList", sirketbilgisiList );

        List<Stajbirim> stajbirimList = stajbirimService.getAllStajbirim();
        model.addObject("stajbirimList", stajbirimList );

        model.setViewName("stajbilgisi_form");

        return model;
    }



    @RequestMapping(value="/editStajbilgisi/{id}", method=RequestMethod.GET)
    public ModelAndView editDanisman(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Stajbilgisi stajbilgisi = stajbilgisiService.getStajbilgisiId(id);
        model.addObject("stajbilgisiForm", stajbilgisi);

        List<Student> studentList = studentService.getAllStudents();
        model.addObject("studentList", studentList );

        List<Sirketbilgisi> sirketbilgisiList = sirketbilgisiService.getAllSirketbilgisi();
        model.addObject("sirketbilgisiList", sirketbilgisiList );

        List<Stajbirim> stajbirimList = stajbirimService.getAllStajbirim();
        model.addObject("stajbirimList", stajbirimList );

        model.setViewName("stajbilgisi_form2");

        return model;
    }




    @RequestMapping(value="/addStajbilgisi", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("stajbilgisiForm") Stajbilgisi stajbilgisi) {

        stajbilgisiService.addStajbilgisi(stajbilgisi);
        return new ModelAndView("redirect:/stajbilgisi/list");

    }

    @RequestMapping(value="/deleteStajbilgisi/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        stajbilgisiService.deleteStajbilgisi(id);
        return new ModelAndView("redirect:/stajbilgisi/list");

    }

}
