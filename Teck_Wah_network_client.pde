
/*
 Author: Benjamin Low (benjamin.low@digimagic.com.sg)
 
 Description: 
 Simulated client program for Teck Wah for communicating between Flash and the USB networked Arduinos via the Processing server. 
 Data used are all strings, including text and numerical data. 
 The Flash client should send all data in the form of strings as well, including numbers. 
 The Flash client is the brains and will contain all operating logic. 
 
 Last updated: 26 Jan 2016
 */

import processing.net.*; 

//USER DEFINED SETTINGS
boolean DEBUG = true; //for testing the dummy server test program

//defined settings
Client myClient; 

String from_server_string = "", from_server_string_display = "", to_server_string = "", to_server_string_display;

boolean isDrawerOpen, isDisplayOpen;

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
}

void draw() { 

        background(0);

        text("Client received: " + from_server_string_display, 5, 33);
        text("Client sent: " + to_server_string_display, 5, 66);

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
                        
                        from_server_string = my_buffer;
                        from_server_string_display = from_server_string;

                        process_server_string(from_server_string);

                        from_server_string = ""; //reset
                }
        }
}

void process_server_string(String _string) {
        
        if (_string.equals("touch1_activated")) {
                if (!isDrawerOpen) {
                        to_server_string = "drawer_open";
                        isDrawerOpen = true;
                }
                else if (isDrawerOpen) {
                        to_server_string = "drawer_close";
                        isDrawerOpen = false;
                }
        } else if (_string.equals("touch2_activated")) {
                if (!isDisplayOpen) {
                        to_server_string = "display_open";
                        isDisplayOpen = true;
                }
                else if (isDisplayOpen) {
                        to_server_string = "display_close";
                        isDisplayOpen = false;
                }
        }
        myClient.write(to_server_string);
        
        to_server_string_display = to_server_string;
        
        to_server_string = "";//reset
}



