module gray_code_tb ();
    localparam WIDTH = 8;
    logic [WIDTH-1:0] in, out, out_inverted;
    gray_code #(.WIDTH(WIDTH)) gray_code(.in(in), .out(out));
    gray_code #(.WIDTH(WIDTH), .INVERT(1)) gray_code_inverted(.in(out), .out(out_inverted));
    integer i;
    initial
    begin
        #1;
        for (i = 0; i < 2**WIDTH; i++)
        begin
            if (i == 0)
                assert($onehot(gray_code.mapping[i] ^ gray_code.mapping[2**WIDTH - 1])) else $fatal("(%d) %b ^ %b not onehot", i, gray_code.mapping[i], gray_code.mapping[2**WIDTH - 1]);
            else
                assert($onehot(gray_code.mapping[i] ^ gray_code.mapping[i - 1])) else $fatal("(%d) %b ^ %b not onehot", i, gray_code.mapping[i], gray_code.mapping[i - 1]);

            if (i == 2**WIDTH - 1)
                assert($onehot(gray_code.mapping[i] ^ gray_code.mapping[0])) else $fatal("(%d) %b ^ %b not onehot", i, gray_code.mapping[i], gray_code.mapping[0]);
            else
                assert($onehot(gray_code.mapping[i] ^ gray_code.mapping[i + 1])) else $fatal("(%d) %b ^ %b not onehot", i, gray_code.mapping[i], gray_code.mapping[i + 1]);
        end
        $finish;
        for (i = 0; i < 2**WIDTH; i++)
        begin
            in = i;
            #1;
            assert(in == out_inverted) else $fatal("f_inverse(f(%d)) != %d", in, out_inverted);
        end
    end
endmodule
