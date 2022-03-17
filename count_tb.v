`timescale 1ns/100ps
module count_tb();

// testbench intelnal signals
wire  [15:0] count_out_tb;
wire         up_count_tb;
reg          up_down_tb;
reg          clk_tb;
reg          rst_tb;

// testbench parameters 
localparam clk_period = 100;

// clock generation 
always # (clk_period /2) clk_tb = ~clk_tb;

// module instatiation
count dut (
 .count_out(count_out_tb),
 .up_count(up_count_tb),
 .up_down(up_down_tb),
 .clk(clk_tb),
 .rst(rst_tb)

);
// main intial block
initial 
 begin
     // intialization 
     up_down_tb = 1'b0;
     clk_tb = 1'b0;
     rst_tb = 1'b1;

     // Reset
     #(clk_period * 0.3)
     rst_tb = 1'b0;
     #(clk_period * 0.7)
     rst_tb = 1'b1;
      
     
     // test case
          
     #(clk_period * 2) 
     $display ("-------------------test case 1--------------------");
     if (count_out_tb ==  16'd2 && up_count_tb == 1'b0)
     $display ("test case 1 : passed");
     else 
     $display ("test case 1 : failled");

     #(clk_period * 10) 
     $display ("-------------------test case 2--------------------");
     if (count_out_tb ==  16'd12 && up_count_tb == 1'b0)
     $display ("test case 2 : passed");
     else 
     $display ("test case 2 : failled");

     up_down_tb = 1'b1;
     #(clk_period * 8) 
     $display ("-------------------test case 3--------------------");
     if (count_out_tb ==  16'd4 && up_count_tb == 1'b1)
     $display ("test case 3 : passed");
     else 
     $display ("test case 3 : failled");

     #(clk_period * 5) 
     $display ("-------------------test case 4--------------------");
     if (count_out_tb ==  16'hFFFF && up_count_tb == 1'b1)
     $display ("test case 4 : passed");
     else 
     $display ("test case 4 : failled");
     
     #(clk_period * 5) 
     $stop; // $finish;(will close modelsim)
     
 end

endmodule
 
