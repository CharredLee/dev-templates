{
  description = "development environment template generator";

  outputs = {self}: {
    templates = {
      python = {
        path = "./python";
        description = "python development environment template";
      };
    };
  };
}
