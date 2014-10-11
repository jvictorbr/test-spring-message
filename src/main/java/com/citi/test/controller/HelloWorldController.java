package com.citi.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorldController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	@ResponseBody
	public String showIndex() {
		return "Hello world";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView goToIndex() { 
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}

}
