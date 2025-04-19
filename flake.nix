{
  description = "development environment template generator";

  outputs = {self}: {
    templates = {
      rust = {
        path = ./rust;
        description = "rust development environment template";
      };
      rust-embedded = {
        path = ./rust-embedded;
        description = "embedded rust development environment template";
      };
      python = {
        path = ./python;
        description = "python development environment template";
      };
    };
  };
}
