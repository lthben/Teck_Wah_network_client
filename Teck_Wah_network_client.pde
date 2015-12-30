
/*
 Author: Benjamin Low (benjamin.low@digimagic.com.sg)
 
 Description: 
     Simulated client program for Teck Wah for communicating between Flash and the USB networked Arduinos via the Processing server. 
     Data used are all strings, including text and numerical data. 
     The Flash client should send all data in the form of strings as well, including numbers. 
     The Flash client is the brains and will contain all operating logic. 
 
 Last updated: 30 Dec 2015
 */

import processing.net.*; 

//USER DEFINED SETTINGS
boolean is_run_simulation = true; //for testing the dummy server test program

//defined settings
Client myClient; 

String server_string = "", server_displayed_string = "", to_client_string = "";

boolean is_linear_actuator_extended;

long led_strip_activated_time;

boolean is_spinning_activated; //spinning motors

void setup() { 
    
       size(400, 100);
       
       textSize(16);
       
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
        
        text("Client received: " + server_displayed_string, 5, 33);
        text("Client sent: " + to_client_string, 5, 66);
        
        read_from_server();       
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

void keyPressed() {
    
    if (is_run_simulation) {
        
        if (key == 'q') {
            to_client_string = "light1_on";
        }
        if (key == 'w') {
                to_client_string = "light1_off";
        }
        if (key == 'e') {
                to_client_string = "light2_on";
        }
        if (key == 'r') {
                to_client_string = "light2_off";
        }
        if (key == 't') {
                to_client_string = "light3_on";
        }
        if (key == 'y') {
                to_client_string = "light3_off";
        }
        if (key == 'u') {
                to_client_string = "light4_on";
        }
        if (key == 'i') {
                to_client_string = "light4_off";
        }
        if (key == 'o') {
                to_client_string = "light5_on";
        }
        if (key == 'p') {
                to_client_string = "light5_off";
        }
        if (key == 'a') {
                to_client_string = "light6_on";
        }
        if (key == 's') {
                to_client_string = "light6_off";
        }
        if (key == 'd') {
                to_client_string = "light7_on";
        }
        if (key == 'f') {
                to_client_string = "light7_off";
        }
        if (key == 'g') {
                to_client_string = "light8_on";
        }
        if (key == 'h') {
                to_client_string = "light8_off";
        }
        if (key == 'j') {
                to_client_string = "light9_on";
        }
        if (key == 'k') {
                to_client_string = "light9_off";
        }
        if (key == 'l') {
                to_client_string = "light10_on";
        }
        if (key == 'z') {
                to_client_string = "light10_off";
        }
        if (key == 'x') {
                to_client_string = "drawer_open";
        }
        if (key == 'c') {
                to_client_string = "drawer_close";
        }
        if (key == 'v') {
                to_client_string = "display_open";
        }
        if (key == 'b') {
                to_client_string = "display_close";
        }
        
        myClient.write(to_client_string);
    }
}