import { type FC } from "react";

import { Chart } from "./chart";
import { createRoot } from "react-dom/client";

const COMPONENTS: Record<string, FC> = {
  Chart,
};

document.addEventListener("DOMContentLoaded", () => {
  const elements = document.querySelectorAll("[data-react]");
  for (const element of elements) {
    const root = createRoot(element);

    const name = element.getAttribute("data-react");

    const Component = COMPONENTS[name!];

    root.render(<Component />);
  }
});
