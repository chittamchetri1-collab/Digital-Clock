//seconds counter

module seconds_counter (
    input wire clk,
    input wire rst,
    output reg [5:0] seconds,
    output reg minute_tick
);

always @(posedge clk) begin
    if (rst) begin
        seconds <= 6'd0;
        minute_tick <= 1'b0;
    end
    else begin
        minute_tick <= 1'b0;

        if (seconds == 6'd59) begin
            seconds <= 6'd0;
            minute_tick <= 1'b1;
        end
        else begin
            seconds <= seconds + 1'b1;
        end
    end
end

endmodule

//minutes counter

module minutes_counter (
    input wire clk,
    input wire rst,
    input wire minute_tick,
    output reg [5:0] minutes,
    output reg hour_tick
);

always @(posedge clk) begin
    if (rst) begin
        minutes <= 6'd0;
        hour_tick <= 1'b0;
    end
    else begin
        hour_tick <= 1'b0;

        if (minute_tick) begin
            if (minutes == 6'd59) begin
                minutes <= 6'd0;
                hour_tick <= 1'b1;
            end
            else begin
                minutes <= minutes + 1'b1;
            end
        end
    end
end

endmodule

//connection of second and minutes counter

module digital_clock_top (
    input wire clk,
    input wire rst,
    output wire [5:0] seconds,
    output wire [5:0] minutes,
    output wire minute_tick,
    output wire hour_tick
);

seconds_counter sec_inst (
    .clk(clk),
    .rst(rst),
    .seconds(seconds),
    .minute_tick(minute_tick)
);

minutes_counter min_inst (
    .clk(clk),
    .rst(rst),
    .minute_tick(minute_tick),
    .minutes(minutes),
    .hour_tick(hour_tick)
);

endmodule

//hours counter

module hours_counter (
    input wire clk,
    input wire rst,
    input wire hour_tick,
    output reg [4:0] hours
);

always @(posedge clk) begin
    if (rst) begin
        hours <= 5'd0;
    end
    else if (hour_tick) begin
        if (hours == 5'd23)
            hours <= 5'd0;
        else
            hours <= hours + 1'b1;
    end
end

endmodule


//connection of second and minutes counter and hours counter

module digital_clock_counters (
    input wire clk_1hz,
    input wire rst,
    output wire [5:0] seconds,
    output wire [5:0] minutes,
    output wire [4:0] hours
);

wire minute_tick;
wire hour_tick;

// Seconds counter
seconds_counter sec_inst (
    .clk(clk_1hz),
    .rst(rst),
    .seconds(seconds),
    .minute_tick(minute_tick)
);

// Minutes counter
minutes_counter min_inst (
    .clk(clk_1hz),
    .rst(rst),
    .minute_tick(minute_tick),
    .minutes(minutes),
    .hour_tick(hour_tick)
);

// Hours counter
hours_counter hr_inst (
    .clk(clk_1hz),
    .rst(rst),
    .hour_tick(hour_tick),
    .hours(hours)
);

endmodule



module clock_divider (
    input wire clk_100mhz,
    input wire rst,
    output wire clk_div
);

reg [26:0] count;

// 27-bit counter
always @(posedge clk_100mhz) begin
    if (rst)
        count <= 27'd0;
    else
        count <= count + 1'b1;
end

// Bit selector
assign clk_div = count[26];

endmodule




module digital_clock_top (
    input wire clk_100mhz,
    input wire rst,
    output wire [5:0] seconds,
    output wire [5:0] minutes,
    output wire [4:0] hours
);

wire clk_div;

// Clock divider

clock_divider div_inst (
    .clk_100mhz(clk_100mhz),
    .rst(rst),
    .clk_div(clk_div)
);

// Seconds, minutes and hours

digital_clock_counters counters_inst (
    .clk_1hz(clk_div),
    .rst(rst),
    .seconds(seconds),
    .minutes(minutes),
    .hours(hours)
);

endmodule


