
/* TEST PROGRAM TO CREATE CLIENT
 import processing.net.*; 
 Client myClient; 
 String in_string;
 
 void setup() { 
 size(200, 200); 
 // Connect to the local machine at port 5204.
 // This example will not run if you haven't
 // previously started a server on this port.
 myClient = new Client(this, "127.0.0.1", 5331);
 } 
 
 void draw() { 
 
 background(0);
 
 if (myClient.available() > 0) { 
 in_string = myClient.readString();
 } 
 if (in_string != null) {
 textSize(30);
 text("received: ", 20, 50);
 text(in_string, 20, 80);
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
 */
