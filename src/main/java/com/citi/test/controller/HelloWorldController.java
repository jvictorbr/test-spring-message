package com.citi.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorldController {

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	@ResponseBody
	public String showIndex() {
		return "Hello world";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView goToIndex() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}

	@RequestMapping(value = "/index2", method = RequestMethod.GET)
	public ModelAndView gotToIndex2() {
		return new ModelAndView("index2_pure_sockjs");
	}

}
