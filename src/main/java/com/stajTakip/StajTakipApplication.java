package com.stajTakip;

import com.stajTakip.controller.DanismanController;
import com.stajTakip.controller.UserController;
import com.stajTakip.model.Danisman;
import com.stajTakip.model.User;
import com.stajTakip.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class StajTakipApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(StajTakipApplication.class);
	}

	public static void main(String[] args) {

		SpringApplication.run(StajTakipApplication.class, args);

	}

}
