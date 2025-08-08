/*
設計紅綠燈 FSM，狀態依序為 RED → GREEN → YELLOW → RED，
但每個燈必須維持特定時間：
狀態	停留時間
RED	    5 秒
GREEN	3 秒
YELLOW	2 秒
條件：
輸入 clk 是 1Hz（每秒 1 個脈波）
請加入 reg [2:0] timer 來幫助倒數
當倒數結束時才轉移狀態
✅ 你需要設計：
localparam 狀態名稱
加入 timer 控制每個狀態停留時間
三段式 FSM
*/
module traffic_light_timer(
    input wire clk, rst,
    output reg [1:0] light
);
    reg [2:0] timer;
    reg [1:0] state, next_state;

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
            RED : 
                if(timer < 5-1) 
                    next_state = RED;
                else
                    next_state = GREEN;
            GREEN:
                if(timer < 3-1)
                    next_state = GREEN;
                else
                    next_state = YELLOW;
            YELLOW:
                if(timer < 2-1)
                    next_state = YELLOW;
                else
                    next_state = RED;
        endcase
    end

    always @(*) begin
        light = state;
    end

endmodule
