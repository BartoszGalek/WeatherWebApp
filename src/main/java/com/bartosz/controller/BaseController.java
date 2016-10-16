package com.bartosz.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.yql4j.*;

import java.util.Calendar;
import java.util.Date;

@Controller
public class BaseController {

    private static int counter = 0;
    private static final String VIEW_INDEX = "index";
    private static final String WEATHER_INDEX = "weather";
    private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(ModelMap model) {

        // Spring uses InternalResourceViewResolver and return back index.jsp
        return VIEW_INDEX;

    }

    @RequestMapping(value = "/weather/{locationstr}", method = RequestMethod.GET)
    public String locationWeather(@PathVariable String locationstr, ModelMap model) throws YqlException {
        Date fromDate = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(fromDate);
        cal.add(Calendar.DATE, 3);
        Date toDate = cal.getTime();
        YqlClient client = YqlClients.createDefault();
        YqlQuery query = YqlQueryBuilder
                .fromQueryString("select item.forecast, item.condition.code, item.condition.date, location from weather.forecast where woeid in (select woeid from geo.places(1) where text=@name) and item.forecast.date > @fromDate and item.forecast.date <= @toDate")
                .withVariable("name", locationstr)
                .withVariable("fromDate", fromDate.toGMTString())
                .withVariable("toDate", toDate.toGMTString())
                .withFormat(ResultFormat.JSON).build();
        YqlResult result = client.query(query);

        // Now you can do whatever you like with the raw result
        String rawResult = result.getContentAsString();
        model.addAttribute("rawResult", rawResult);

        logger.debug("rawResult : {}", rawResult);
        return WEATHER_INDEX;

    }

}