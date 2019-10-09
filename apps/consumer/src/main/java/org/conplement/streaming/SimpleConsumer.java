package org.conplement.streaming;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class SimpleConsumer {

  @KafkaListener(topics = "test")
  public void consumeMessage(String message) {
    System.out.println("Got message: " + message);
  }
  
}