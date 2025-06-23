module traffic_light_controller (
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

    reg [1:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 2'b00;
        else
            state <= state + 1;
    end

    always @(*) begin
        case (state)
            2'b00: begin red = 1; yellow = 0; green = 0; end  // RED
            2'b01: begin red = 0; yellow = 0; green = 1; end  // GREEN
            2'b10: begin red = 0; yellow = 1; green = 0; end  // YELLOW
            default: begin red = 1; yellow = 0; green = 0; end // Back to RED
        endcase
    end
endmodule
