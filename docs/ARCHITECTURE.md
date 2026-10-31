# Architecture

`mem` is a single self-contained RAM module:

```text
mem_tb ──> mem
```

- `addr` selects a word.
- `data_in` is written when `wr` and `cs` are high at a positive edge of
  either control signal.
- `data_out` continuously reflects the selected memory word.

The implementation uses a Verilog memory array so synthesis tools can infer
block RAM or distributed RAM. Board-specific wrappers should own clocks,
resets, and pin mapping rather than changing the memory primitive.
