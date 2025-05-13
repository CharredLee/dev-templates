{
  description = "development environment template generator";

  outputs = {self}: {
    templates = {
      lean = {
        path = ./templates/lean;
        description = "lean development environment template";
      };
      python = {
        path = ./templates/python;
        description = "python development environment template, with uv";
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
