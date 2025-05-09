{
  description = "development environment template generator";

  outputs = {self}: {
    templates = {
      lean = {
        path = ./lean;
        description = "lean development environment template";
      };
      python = {
        path = ./python;
        description = "python development environment template";
      };
      rust = {
        path = ./rust;
        description = "rust development environment template";
      };
      rust-embedded = {
        path = ./rust-embedded;
        description = "embedded rust development environment template";
      };
    };
  };
}
