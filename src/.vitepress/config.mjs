import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  lang: 'en',
  title: 'UŘLS TEI Cookbook',
  description: 'Guidelines for manuscript description incorporating TEI.',

  head: [
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }],
    ['meta', { name: 'theme-color', content: '#fff' }],
    ['script', { src: 'https://umami.rocek.dev/script.js', 'data-website-id': '021f40c5-179d-4546-9bf4-9c294a4eaf92' }],
  ],

  // Pages keep their .html URLs (e.g. /guidelines/tei-header.html), as with VuePress 1,
  // so links in the downloadable templates and from other sites keep working.
  cleanUrls: false,

  // Only the white theme existed before; no dark-mode switch.
  appearance: false,

  themeConfig: {
    nav: [
      { text: 'Guidelines', link: '/guidelines/' },
      { text: 'Examples', link: '/examples/' },
      { text: 'For editors', link: '/for-editors/' },
      { text: 'Changelog', link: '/changelog/' },
    ],

    sidebar: {
      '/guidelines/': [
        {
          text: 'Guidelines',
          items: [
            { text: 'Introduction', link: '/guidelines/' },
            { text: 'General TEI structure', link: '/guidelines/common-structure-and-elements' },
          ],
        },
        {
          text: 'Meta-information',
          items: [
            { text: 'TEI Header', link: '/guidelines/tei-header' },
            { text: 'Witness description', link: '/guidelines/witness-description' },
            { text: 'People and places', link: '/guidelines/people-and-places' },
            { text: 'Bibliography', link: '/guidelines/bibliography' },
          ],
        },
        {
          text: 'Content of the edition',
          items: [
            { text: 'Text structure', link: '/guidelines/text-structure' },
            { text: 'Text corrections', link: '/guidelines/text-corrections' },
            { text: 'Translations', link: '/guidelines/translations' },
          ],
        },
        {
          text: 'Abbreviations',
          items: [
            { text: 'Language abbreviations', link: '/guidelines/language-codes' },
            { text: 'Biblical abbreviations', link: '/guidelines/bible-short' },
          ],
        },
      ],
      '/examples/': [
        {
          text: 'Partial examples',
          items: [
            { text: 'Somniale Danielis', link: '/examples/somniale' },
            { text: 'Regula sancti Benedicti', link: '/examples/regula-st-benedicti' },
          ],
        },
      ],
    },

    outline: { level: [2, 3], label: 'On this page' },

    search: { provider: 'local' },

    footer: {
      message: 'Made by Martin Roček and Ondřej Fúsik',
    },
  },
})
