package org.conplement.streaming;

import org.conplement.streaming.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/kafka")
public class KafkaController {

    private final Producer producer;
    @Autowired
    public KafkaController(Producer producer) {
        this.producer = producer;
    }
    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public void sendMessageToKafkaTopic(@RequestParam("message") String message){
        this.producer.sendMessage(message);
    }
}