/*
題目描述：行人按鈕控制紅燈延長
📌 規格
狀態依序為：RED → GREEN → YELLOW → RED
每個燈號停留時間：
狀態	時間
RED	    5 秒（正常）
        → 若有行人按鈕 ped_btn=1，變成 8 秒
GREEN	3 秒
YELLOW	2 秒
*/
module traffic_light_ped(
    input wire clk, rst, ped_btn,
    output reg [1:0] light
);
    reg [1:0] state, next_state;
    reg [3:0] timer;
    localparam RED = 2'b00;
    localparam GREEN = 2'b01;
    localparam YELLOW = 2'b10;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= RED;
            timer <= 0;
        end else begin
            if(state != next_state)
                timer <= 0;
            else
                timer <= timer + 1;
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            RED: 
                if(timer < (ped_btn ? 8 : 5))
                    next_state = RED;
                else
                    next_state = GREEN;
            GREEN:
                if(timer < 3)
                    next_state = GREEN;
                else 
                    next_state = YELLOW;
            YELLOW:
                if(timer < 2)
                    next_state = YELLOW;
                else
                    next_state = RED;
            default: next_state = RED;
        endcase
    end

    always @(*) begin 
        light = state;
    end
endmodule