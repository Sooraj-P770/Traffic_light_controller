module tb_traffic_light;
    reg clk;
    reg reset;
    wire red, yellow, green;

    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock with 10-time units period
    end

    // Test sequence
    initial begin
        $monitor("Time=%0t : RED=%b YELLOW=%b GREEN=%b", $time, red, yellow, green);
        reset = 1; #10;
        reset = 0;
        #100 $finish;
    end
endmodule
