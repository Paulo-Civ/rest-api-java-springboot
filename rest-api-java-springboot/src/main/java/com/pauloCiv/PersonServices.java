package com.pauloCiv;

import com.pauloCiv.model.Person;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.logging.Logger;

@Service
public class PersonServices {

    private final AtomicLong counter = new AtomicLong();
    private Logger logger = Logger.getLogger(PersonServices.class.getName());

    public Person findById(String id){
        logger.info("Finding one Person!");

        //Mock
        Person person = new Person();
        person.setId(counter.incrementAndGet());
        person.setFirstName("Paulo");
        person.setLastName("Civardi");
        person.setAddress("Dourados - Mato Grosso do Sul - Brasil");
        person.setGender("male");

        return person;
    }

}
