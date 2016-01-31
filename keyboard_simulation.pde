void keyPressed() {

        if (DEBUG) {

                if (key == 'q') {
                        to_server_string = "light1_on"; //panel1
                }
                if (key == 'w') {
                        to_server_string = "light1_off"; 
                }
                if (key == 'e') {
                        to_server_string = "light2_on"; //panel2
                }
                if (key == 'r') {
                        to_server_string = "light2_off";
                }
                if (key == 't') {
                        to_server_string = "light3_on"; //panel3
                }
                if (key == 'y') {
                        to_server_string = "light3_off";
                }
                if (key == 'u') {
                        to_server_string = "light4a_on"; //long forward
                }
                if (key == 'i') {
                        to_server_string = "light4a_off";
                }
                if (key == 'n') {
                        to_server_string = "light4b_on"; //;long backward
                }
                if (key == 'm') {
                        to_server_string = "light4b_off";
                }
                if (key == 'o') {
                        to_server_string = "light5_on"; //display1
                }
                if (key == 'p') {
                        to_server_string = "light5_off";
                }
                if (key == 'a') {
                        to_server_string = "light6_on"; //display2
                }
                if (key == 's') {
                        to_server_string = "light6_off";
                }
                if (key == 'd') {
                        to_server_string = "light7_on"; //display3
                }
                if (key == 'f') {
                        to_server_string = "light7_off";
                }
                if (key == 'g') {
                        to_server_string = "light8_on"; //single pixels map
                }
                if (key == 'h') {
                        to_server_string = "light8_off";
                }
                if (key == 'j') {
                        to_server_string = "light9_on"; //world map
                }
                if (key == 'k') {
                        to_server_string = "light9_off";
                }
                if (key == 'l') {
                        to_server_string = "light10_on"; //achievement wall
                }
                if (key == 'z') {
                        to_server_string = "light10_off";
                }
                if (key == 'x') {
                        to_server_string = "drawer_open";
                }
                if (key == 'c') {
                        to_server_string = "drawer_close";
                }
                if (key == 'v') {
                        to_server_string = "display_open";
                }
                if (key == 'b') {
                        to_server_string = "display_close";
                }
                if (key == '0') {
                         to_server_string = "drawer stop";       
                }
                if (key == '1') {
                         to_server_string = "display stop";       
                }

                myClient.write(to_server_string);
                to_server_string_display = to_server_string;
                to_server_string = ""; //reset
        }
}
