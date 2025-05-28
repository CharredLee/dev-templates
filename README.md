# dev-templates

provides opinionated development environment templates for nix development.

this project was born out of an appreciation for
[these dev templates](https://github.com/the-nix-way/dev-templates), but a
distain for the use of flakehub therein.

## usage

to use a template with name `$TEMPLATE`, first
[ensure that nix-direnv is available in your shell](https://direnv.net/docs/hook.html),
then run the following commands:

```sh
nix flake init --template CharredLee/dev-templates#$TEMPLATE
direnv allow
```

this can also be used without `nix-direnv` by running `nix develop`, however, it
is recommended for the convenience of the developer to install and enable
`nix-direnv`.

valid template names are listed in the following table.

| language      | description                   | template name   |
| ------------- | ----------------------------- | --------------- |
| c             | the C programming language    | `c`             |
| haskell       | haskell                       | `haskell`       |
| lean4         | the lean theorem prover       | `lean`          |
| javascript    | javascript via nodejs         | `node`          |
| python        | python with uv                | `python`        |
| rocq          | theorem prover, formerly coq  | `rocq`          |
| rust          | rust                          | `rust`          |
| embedded rust | rust for embedded development | `rust-embedded` |

## project goals

here are the currently planned features and improvements to this project:

- [ ] **additional language support:** the main target feature right now is
      support for additional languages/tooling. this includes, but is certainly
      not limited to, the following:
  - [x] ~~c~~
  - [ ] c++
  - [ ] go
  - [x] ~~haskell~~
    - [ ] agda
  - [x] ~~node.js~~
  - [ ] ocaml
  - [x] ~~rocq~~
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
