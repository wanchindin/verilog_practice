module traffic_light(
    input wire clk,
    input wire rst,
    output reg [1:0] light   // 00=紅, 01=綠, 10=黃
);
    // 狀態編碼
    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    reg [1:0] state, next_state;

    // 狀態暫存器 (時序邏輯)
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= RED;          // Reset 初始為紅燈
        else
            state <= next_state;   // 狀態更新
    end

    // 狀態轉換邏輯 (組合邏輯)
    always @(*) begin
        case(state)
            RED:    next_state = GREEN;
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            default: next_state = RED;
        endcase
    end

    // 輸出邏輯 (燈號)
    always @(*) begin
        light = state;
    end
endmodule
