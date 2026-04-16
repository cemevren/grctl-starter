# Ground Control Starter

A minimal [grctl](https://grctl.dev) workflow project, ready to run.

## Prerequisites

- Python 3.13+
- [uv](https://docs.astral.sh/uv/)
- grctl server binary (`grctld`)

## Quick Start

**1. Start the grctl server** (in a separate terminal):

```bash
grctl start
```

**2. Install dependencies:**

```bash
uv sync
```

**3. Start the worker:**

```bash
uv run python worker.py
```

**4. Run a workflow** (in another terminal):

```bash
uv run python client.py
```

## Project Structure

```
.
├── pyproject.toml       # Project config and dependencies
├── worker.py            # Worker entry point — registers and runs workflows
├── client.py            # Client entry point — starts a workflow and prints the result
├── workflows/
│   └── hello.py         # Sample "Hello World" workflow definition
└── README.md
```

## What's in the sample workflow?

`workflows/hello.py` defines a simple workflow that:

1. Receives a `name` input
2. Calls a greeting task
3. Stores the result and completes

This demonstrates the core grctl concepts: **workflows**, **tasks**, **context/store**, and **directives**.

## Next Steps

- Add more workflows in the `workflows/` directory
- Explore [steps](https://docs.grctl.dev), [events](https://docs.grctl.dev), and [child workflows](https://docs.grctl.dev)
- Read the [grctl documentation](https://docs.grctl.dev)
