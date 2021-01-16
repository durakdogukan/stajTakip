package com.stajTakip.controller;

import com.stajTakip.model.Danisman;
import com.stajTakip.model.Sirketbilgisi;
import com.stajTakip.model.User;
import com.stajTakip.services.DanismanService;
import com.stajTakip.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/danisman")

public class DanismanController {

    @Autowired
    DanismanService danismanService;

    @Autowired
    UserService userService;


    @RequestMapping(value="/list", method= RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("danisman_list");
        List<Danisman> danismanList = danismanService.getAllDanisman();
        model.addObject("danismanList", danismanList );

        return model;
    }


    @RequestMapping(value="/addDanisman/", method=RequestMethod.GET)
    public ModelAndView addDanisman() {

        ModelAndView model = new ModelAndView();
        Danisman danisman = new Danisman();
        model.addObject("danismanForm", danisman);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList );

        model.setViewName("danisman_form");

        return model;
    }


    @RequestMapping(value="/editDanisman/{id}", method=RequestMethod.GET)
    public ModelAndView editDanisman(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Danisman danisman = danismanService.getDanismanId(id);
        model.addObject("danismanForm", danisman);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList );

        model.setViewName("danisman_form");

        return model;
    }

    @RequestMapping(value="/addDanisman2", method=RequestMethod.POST)
    public void add2(@RequestBody Danisman danisman) {

        danismanService.addDanisman(danisman);

    }


    @RequestMapping(value="/addDanisman", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("danismanForm") Danisman danisman) {

        danismanService.addDanisman(danisman);

        return new ModelAndView("redirect:/danisman/list");

    }

    @RequestMapping(value="/deleteStudent/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        danismanService.deleteDanisman(id);
        return new ModelAndView("redirect:/danisman/list");

    }
}