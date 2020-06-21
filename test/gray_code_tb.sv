module gray_code_tb ();
    localparam WIDTH = 16;
    logic [WIDTH-1:0] in, out, out_inverted;
    gray_code #(.WIDTH(WIDTH)) gray_code(.in(in), .out(out));
    gray_code #(.WIDTH(WIDTH), .INVERT(1)) gray_code_inverted(.in(out), .out(out_inverted));
    integer i;

    logic [WIDTH-1:0] prev = WIDTH'(0);
    initial
    begin
        #1;
        for (i = 1; i < 2**WIDTH; i++)
        begin
            in = WIDTH'(i);
            #1;
            assert($onehot(out ^ prev)) else $fatal(1, "Not onehot: %b vs %b for %d", out, prev, in);
            prev = out;
            #1;
            assert(in == out_inverted) else $fatal(1, "Input %d does not equal inverted output %d", in, out_inverted);
        end
        $finish;
    end
endmodule
