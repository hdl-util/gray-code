module gray_code #(
    // The width of the value being converted to/from gray code
    parameter int WIDTH,
    // Whether to invert the gray code, so you can get the original decimal value
    parameter bit INVERT = 0
) (
    input logic [WIDTH-1:0] in,
    output logic [WIDTH-1:0] out
);

integer i;
generate
    if (INVERT)
    begin
        always_comb
        begin
            out = WIDTH'(0);
            for (i = 0; i < WIDTH; i++)
            begin: bitwise_assign
                out = out ^ (in >> i);
            end
        end
    end
    else
    begin
        always_comb
        begin
            out = in ^ (in >> 1);
        end
    end
endgenerate
    
endmodule
