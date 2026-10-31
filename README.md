# RAM Experiment

Parameterized synchronous-write, asynchronous-read Verilog RAM with a
10-bit address and 8-bit data word by default.

## Requirements

- Icarus Verilog 11 or newer
- `make`

Run the self-checking simulation with:

```sh
make test
```

## Structure

- `mem.v` defines the parameterized `mem` module.
- `mem_tb.v` writes sixteen locations and verifies every readback.
- `docs/ARCHITECTURE.md` describes the memory interface.
- `docs/MODERNIZATION.md` records the baseline and audit.

The default memory contains 1024 words. Override `addr_size`, `word_size`,
and `mem_size` when instantiating the module, subject to the target synthesis
tool's RAM inference rules.
