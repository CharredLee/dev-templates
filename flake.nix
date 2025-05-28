{
  description = "development environment template generator";

  outputs = {self}: {
    templates = {
      c = {
        path = ./templates/c;
        description = "C development environment template";
      };
      haskell = {
        path = ./templates/haskell;
        description = "haskell development environment template";
      };
      lean = {
        path = ./templates/lean;
        description = "lean development environment template";
      };
      node = {
        path = ./templates/node;
        description = "nodejs development environment template";
      };
      python = {
        path = ./templates/python;
        description = "python development environment template, with uv";
      };
      rocq = {
        path = ./templates/rocq;
        description = "rocq development environment template";
      };
      rust = {
        path = ./templates/rust;
        description = "rust development environment template";
      };
      rust-embedded = {
        path = ./templates/rust-embedded;
        description = "embedded rust development environment template";
      };
    };
  };
}
