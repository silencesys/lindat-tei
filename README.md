<p align="center">
<img src="./src/.vuepress/public/logo.png" alt="UŘLS TEI Cookbook"/>
</p>

<p align="center">
Guidelines for the manuscript encoding incorporating rules of TEI.
</p>

<br><br>

# What is it
These guidelines are followed by the encoders of The Institute of Greek and Latin Studies at the Faculty of Arts at Charles University.

# Installation
The site is built with [VitePress](https://vitepress.dev) and needs Node.js 18 or newer and [pnpm](https://pnpm.io). Clone this repository and run `pnpm install`. Then `pnpm dev` runs the website in developer mode, `pnpm build` creates the static version in `src/.vitepress/dist`, and `pnpm preview` serves that build locally.

Pages are Markdown files in `src/`; the site configuration (navigation, sidebar) is in `src/.vitepress/config.mjs`. Files in `src/public/` (images, the schema and templates in `src/public/files/`) are published as they are.

# License
The content of the website is publicly available if not stated otherwise.