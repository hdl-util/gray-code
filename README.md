# Gray code

[![Build Status](https://travis-ci.com/hdl-util/gray-code.svg?branch=master)](https://travis-ci.com/hdl-util/gray-code)

SystemVerilog code for generating a [Gray code](https://en.wikipedia.org/wiki/Gray_code) of arbitrary width.

## Why?

I needed an efficient, easy way to generate gray codes for dual clock FIFOs. It's a pain to manually write out a gray code. Why not let a module do the heavy lifting for you?

## Usage


1. Take files from `src/` and add them to your own project. If you use [hdlmake](https://hdlmake.readthedocs.io/en/master/), you can add this repository itself as a remote module.
1. Other helpful modules are also available in this GitHub organization.
1. Consult the testbench in `test/gray_code_tb.sv` for example usage.
1. Read through the parameter descriptions in `gray_code.sv` and tailor any instantiations to your situation.
1. Please create an issue if you run into a problem or have any questions.

## To-do List

* [ ] [Balanced gray codes](https://github.com/hdl-util/gray-code/issues/1)


