# RAM Experiment

Simple synchronous memory RTL with a self-checking-oriented testbench.

## Simulate

```bash
iverilog -o mem_tb mem.v mem_tb.v
vvp mem_tb
```