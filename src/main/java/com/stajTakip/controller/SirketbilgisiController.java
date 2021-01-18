package com.stajTakip.controller;

import java.util.List;

import com.stajTakip.model.Danisman;
import com.stajTakip.model.Sirketbilgisi;
import com.stajTakip.model.Student;
import com.stajTakip.model.User;
import com.stajTakip.services.DanismanService;
import com.stajTakip.services.SirketbilgisiService;
import com.stajTakip.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value="/sirketbilgisi")

public class SirketbilgisiController {

    @Autowired
    SirketbilgisiService sirketbilgisiService;


    @RequestMapping(value="/list", method=RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("sirketbilgisi_list");
        List<Sirketbilgisi> sirketbilgisi = sirketbilgisiService.getAllSirketbilgisi();
        model.addObject("sirketbilgisiList", sirketbilgisi );
        return model;
    }



    @RequestMapping(value="/addSirketbilgisi/", method=RequestMethod.GET)
    public ModelAndView addSirketbilgisi() {

        ModelAndView model = new ModelAndView();
        Sirketbilgisi sirketbilgisi = new Sirketbilgisi();
        model.addObject("sirketbilgisiForm", sirketbilgisi);

        model.setViewName("sirketbilgisi_form");

        return model;
    }



    @RequestMapping(value="/editSirketbilgisi/{id}", method=RequestMethod.GET)
    public ModelAndView editSirketbilgisi(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Sirketbilgisi sirketbilgisi = sirketbilgisiService.getSirketbilgisiId(id);
        model.addObject("sirketbilgisiForm", sirketbilgisi);


        model.setViewName("sirketbilgisi_form");

        return model;
    }




    @RequestMapping(value="/addSirketbilgisi", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("sirketbilgisiForm") Sirketbilgisi sirketbilgisi, RedirectAttributes redirAttrs) {


        for(Sirketbilgisi sirketbilgisi2: sirketbilgisiService.getAllSirketbilgisi())
        {

            if (sirketbilgisi2.getAd().equals(sirketbilgisi.getAd()))
            {

                redirAttrs.addFlashAttribute("message", "Eklemeye Çalıştığınız Şirket Kayıtlarda Mevcut");
                return new ModelAndView("redirect:/sirketbilgisi/list");

            }

        }

        sirketbilgisiService.addSirketbilgisi(sirketbilgisi);
        redirAttrs.addFlashAttribute("message", "Şirket Bilgisi Başarıyla Oluşturuldu ");
        return new ModelAndView("redirect:/sirketbilgisi/list");

    }

    @RequestMapping(value="/deleteSirketbilgisi/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        sirketbilgisiService.deleteSirketbilgisi(id);
        return new ModelAndView("redirect:/sirketbilgisi/list");

    }
}
