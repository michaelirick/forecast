import React from "react";
import { createRoot } from "react-dom/client";
import 'semantic-ui-css/semantic.min.css';
import App from "./app";

document.addEventListener("DOMContentLoaded", () => {
  const root = createRoot(
    document.body.appendChild(document.createElement("div"))
  );
  root.render(<App />);
});