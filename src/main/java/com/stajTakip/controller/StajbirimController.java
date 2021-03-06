package com.stajTakip.controller;

import com.stajTakip.model.Sirketbilgisi;
import com.stajTakip.model.Stajbirim;
import com.stajTakip.model.User;
import com.stajTakip.services.SirketbilgisiService;
import com.stajTakip.services.StajbirimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping(value="/stajbirim")

public class StajbirimController {

    @Autowired
    StajbirimService stajbirimService;

    @Autowired
    SirketbilgisiService sirketbilgisiService;

    @RequestMapping(value="/list", method= RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("stajbirim_list");
        List<Stajbirim> stajbirimList = stajbirimService.getAllStajbirim();
        model.addObject("stajbirimList", stajbirimList );

        return model;
    }


    @RequestMapping(value="/addStajbirim/", method=RequestMethod.GET)
    public ModelAndView addStajbirim() {

        ModelAndView model = new ModelAndView();
        Stajbirim stajbirim = new Stajbirim();
        model.addObject("stajbirimForm", stajbirim);

        List<Sirketbilgisi> sirketbilgisiList = sirketbilgisiService.getAllSirketbilgisi();
        model.addObject("sirketbilgisiList", sirketbilgisiList );

        List<Stajbirim> stajbirimList = stajbirimService.getAllStajbirim();
        model.addObject("stajbirimList", stajbirimList );

        model.setViewName("stajbirim_form");
        return model;
    }



    @RequestMapping(value="/editStajbirim/{id}", method=RequestMethod.GET)
    public ModelAndView editStajbirim(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Stajbirim stajbirim = stajbirimService.getStajbirimId(id);
        model.addObject("stajbirimForm", stajbirim);

        List<Sirketbilgisi> sirketbilgisiList = sirketbilgisiService.getAllSirketbilgisi();
        model.addObject("sirketbilgisiList", sirketbilgisiList );

        List<Stajbirim> stajbirimList = stajbirimService.getAllStajbirim();
        model.addObject("stajbirimList", stajbirimList );

        model.setViewName("stajbirim_form");
        return model;
    }




    @RequestMapping(value="/addStajbirim", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("stajbirimForm") Stajbirim stajbirim, RedirectAttributes redirAttrs) {



        stajbirimService.addStajbirim(stajbirim);
        redirAttrs.addFlashAttribute("message", "Staj Birimi Başarıyla Oluşturuldu ");
        return new ModelAndView("redirect:/stajbirim/list");

    }

    @RequestMapping(value="/deleteStajbirim/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        try {
            stajbirimService.deleteStajbirim(id);
            return new ModelAndView("redirect:/stajbirim/list");
        }catch (Exception e){
            return new ModelAndView("redirect:/stajbirim/list");
        }
    }
}
