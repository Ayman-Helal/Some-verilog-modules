module count (
    output  reg  [15:0] count_out,
    output  reg         up_count,
    input   wire        up_down,
    input   wire        clk,
    input   wire        rst
);

always @(posedge clk, negedge rst ) begin
    if (~rst) 
         begin
         count_out <= 16'b0;
          end
    else 
         begin
             if (up_down)
              begin 
                  count_out <= count_out - 16'b1;
              end 
            else 
             begin
                count_out <= count_out + 16'b1; 
             end

        end 
    
end
always @(posedge clk , negedge rst) begin
    if (!rst)
     begin
         up_count <= 1'b0;
     end 
    else 
      begin
    up_count <= up_down;
      end
end

endmodule