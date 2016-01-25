void keyPressed() {

        if (DEBUG) {

                if (key == 'q') {
                        to_server_string = "light1_on";
                }
                if (key == 'w') {
                        to_server_string = "light1_off";
                }
                if (key == 'e') {
                        to_server_string = "light2_on";
                }
                if (key == 'r') {
                        to_server_string = "light2_off";
                }
                if (key == 't') {
                        to_server_string = "light3_on";
                }
                if (key == 'y') {
                        to_server_string = "light3_off";
                }
                if (key == 'u') {
                        to_server_string = "light4a_on";
                }
                if (key == 'i') {
                        to_server_string = "light4a_off";
                }
                if (key == 'n') {
                        to_server_string = "light4b_on";
                }
                if (key == 'm') {
                        to_server_string = "light4b_off";
                }
                if (key == 'o') {
                        to_server_string = "light5_on";
                }
                if (key == 'p') {
                        to_server_string = "light5_off";
                }
                if (key == 'a') {
                        to_server_string = "light6_on";
                }
                if (key == 's') {
                        to_server_string = "light6_off";
                }
                if (key == 'd') {
                        to_server_string = "light7_on";
                }
                if (key == 'f') {
                        to_server_string = "light7_off";
                }
                if (key == 'g') {
                        to_server_string = "light8_on";
                }
                if (key == 'h') {
                        to_server_string = "light8_off";
                }
                if (key == 'j') {
                        to_server_string = "light9_on";
                }
                if (key == 'k') {
                        to_server_string = "light9_off";
                }
                if (key == 'l') {
                        to_server_string = "light10_on";
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

                myClient.write(to_server_string);
                to_server_string_display = to_server_string;
                to_server_string = ""; //reset
        }
}
