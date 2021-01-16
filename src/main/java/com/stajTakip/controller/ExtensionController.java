package com.stajTakip.controller;

import com.stajTakip.model.Danisman;
import com.stajTakip.model.User;
import com.stajTakip.services.DanismanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;



@Controller

public class ExtensionController {
    @Autowired
    DanismanService danismanService;

    @RequestMapping(value="/logout", method= RequestMethod.POST)

    public ModelAndView logout(HttpSession request){
                User user = (User) request.getAttribute("user");
                Danisman danisman = (Danisman) request.getAttribute("danisman");


        for (Danisman danisman2: danismanService.getAllDanisman())
        {
            if (danisman2.getUser().getId() == user.getId() )
            {
                request.removeAttribute("user");
                request.removeAttribute("danisman");
                System.out.println("YÖNETİCİ ÇIKIŞ YAPTI");
                return new ModelAndView("redirect:/student_login");

            }

        }

        request.removeAttribute("user");
        return new ModelAndView("redirect:/student_login");

    }
}
