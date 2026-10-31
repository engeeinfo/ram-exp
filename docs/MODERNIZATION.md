# Modernization record

## Baseline

Baseline captured on 2026-10-31 from `main`.

| Area | Result | Notes |
| --- | --- | --- |
| Stack | Verilog | Parameterized RAM and one testbench. |
| Build | Pass | Icarus compiles the design. |
| Tests | Weak | Existing testbench read random unwritten addresses and never asserted results. |
| Lint | Missing | No HDL quality gate existed. |
| License | Missing | Added MIT license. |
| CI | Missing | Added simulation workflow. |

## Audit findings

1. **Medium — non-deterministic verification:** random reads of unwritten
   addresses produced `x`, obscuring whether written data was preserved.
2. **Medium — no failure signal:** the testbench did not assert or terminate
   with a status based on correctness.
3. **Low — missing project contract:** setup, interface, and parameter
   behavior were undocumented.

No secrets or external dependency vulnerabilities were found.

## Changes

- Replaced random-only read output with deterministic readback assertions for
  every written address.
- Added README, architecture and baseline documentation.
- Added Makefile targets, CI, ignore rules, and MIT license.

The RAM interface and storage behavior were not changed.
