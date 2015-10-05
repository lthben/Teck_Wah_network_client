
/*
 Author: Benjamin Low (benjamin.low@digimagic.com.sg)
 Last updated: 5 Oct 2015
 Description: 
 Simulated client program for Teck Wah for communicating between Flash and the USB networked Arduinos via the Processing server. 
 Data used are all strings, including text and numerical data. 
 The Flash client should send all data in the form of strings as well, including numbers. 
 The Flash client is the brains and will contain all operating logic. 
 */

import processing.net.*; 
Client myClient; 
String server_string = "", server_displayed_string = "";
boolean is_linear_actuator_extended;
long led_strip_activated_time;
boolean is_spinning_activated; //spinning motors

void setup() { 
        size(200, 200);
       
       String[] textlines = loadStrings("settings.txt"); 
       
       int port_number = 0;
       
       for (int i=0; i<textlines.length; i++) {
                String[] a_number = split(textlines[i], '=');
                port_number = int(a_number[1]);
       }

        myClient = new Client(this, "127.0.0.1", port_number);
        println("listening at port: " + port_number);

        server_string = "";
}

void draw() { 

        background(0);
        
        text("received: ", 20, 50);
        text(server_displayed_string, 20, 80);
        
        read_from_server();
        
        process_logic(); //the brains
}

void read_from_server() {
        String my_buffer = "";
        
        if (myClient.available() > 0) { 
                my_buffer = myClient.readString(); //ASCII return = 13
        } 
        if (my_buffer != null) {
                my_buffer = trim(my_buffer);
                if (my_buffer.length() > 0) {
                        server_string = my_buffer;
                        server_displayed_string = server_string;
                }
        }       
}

void process_logic() {
         if (server_string.equals("tag2")) {
                 
                 myClient.write("light_effect_1");
                 led_strip_activated_time = millis();
                 is_spinning_activated = false;
                 server_string = "";
                 
         } else if (server_string.equals("tag3")) {
                 
                 myClient.write("light_effect_2");
                 server_string = "";
                 
         } else if (server_string.equals("tag4")) {
                 
                 myClient.write("light_effect_3");
                 server_string = "";
                 
         } else if (server_string.equals("tag5")) {
                 
                 myClient.write("light_effect_4");
                 server_string = "";
                 
         } else if (server_string.equals("captouch_on")) {
                 
                 is_linear_actuator_extended = !is_linear_actuator_extended; 
                server_string = ""; 
                                  
         } else if (server_string.equals("captouch_off")) { 
                 
                 if (is_linear_actuator_extended) {
                         myClient.write("close_drawer");
                 } else {
                         myClient.write("open_drawer");       
                 }   
                 
                 server_string = "";
         }
         
         if (millis() - led_strip_activated_time > 5000 && !is_spinning_activated) {
                  myClient.write("spin_motors");
                   is_spinning_activated = true;       
         }
}

void keyPressed() {
        if (key == 'a') {
                myClient.write("0");
        }
        if (key == 's') {
                myClient.write("1");
        }
}

