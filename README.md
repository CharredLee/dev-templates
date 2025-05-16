# dev-templates

provides opinionated development environment templates using
[nix-direnv](https://github.com/nix-community/nix-direnv). currently, provides
templates for the following languages:

- [lean4](https://github.com/leanprover/lean4)
- python (with [uv](https://github.com/astral-sh/uv))
- rust, along with a separate template for embedded rust

this project was born out of an appreciation for
[these dev templates](https://github.com/the-nix-way/dev-templates), but a
distain for the use of flakehub therein.

## usage

to use a template with name `$TEMPLATE`, first
[ensure that direnv is available in your shell](https://direnv.net/docs/hook.html),
then run the following commands:

```sh
nix flake init --template CharredLee/dev-templates#$TEMPLATE
direnv allow
```

valid template names are listed in the following table.

| language      | description                   | template name   |
| ------------- | ----------------------------- | --------------- |
| c             | the C programming language    | `c`             |
| lean4         | the lean theorem prover       | `lean`          |
| haskell       | haskell                       | `haskell`       |
| python        | python with uv                | `python`        |
| rocq          | theorem prover, formerly coq  | `rocq`          |
| rust          | rust                          | `rust`          |
| embedded rust | rust for embedded development | `rust-embedded` |

## project goals

here are the currently planned features and improvements to this project:

- [ ] **additional language support:** the main target feature right now is
      support for additional languages/tooling. this includes, but is certainly
      not limited to, the following:
  - [x] c
  - [ ] c++
  - [ ] go
  - [x] haskell
    - [ ] agda
  - [ ] node.js/typescript
  - [ ] ocaml
  - [x] rocq
  - [ ] zig
- [ ] **update the python template:** currently, the python template uses the
      `venvShellHook` to produce a virtual environment in the working directory.
      ideally, this is overhauled to have `uv` make the venv. probably a
      solution to this will involve
      [uv2nix](https://github.com/pyproject-nix/uv2nix).

## contributing

contributions are welcome. for languages/tooling with no existing templates (and
no existing PR), feel free to submit a PR directly. to propose any changes to
existing templates, or for changes of any other kind, please first open an
issue.
