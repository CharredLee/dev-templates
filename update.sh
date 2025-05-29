#!/usr/bin/env bash

echo -e "\e[1;31mflake update:\e[0m updating all flake.lock..."

for template in templates/*/; do
  template_name=$(basename "$template")
  echo -e "\e[1;31mflake update:\e[0m Updating $template_name..."
  (cd "$template" && nix flake update)
  if [ $? -eq 0 ]; then
    echo -e "\e[1;31mflake update:\e[0m updated $template_name successfully"
  else
    echo -e "\e[1;31mflake update:\e[0m ERROR: failed to update $template_name"
  fi
done

echo -e "\e[1;31mflake update:\e[0m updates complete"
