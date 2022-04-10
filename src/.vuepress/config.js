const { description } = require('../../package')

module.exports = {
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#title
   */
  title: 'UŘLS TEI Cookbook',
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#description
   */
  description: description,

  /**
   * Extra tags to be injected to the page HTML `<head>`
   *
   * ref：https://v1.vuepress.vuejs.org/config/#head
   */
  head: [
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }],
    ['meta', { name: 'theme-color', content: '#fff' }],
  ],

  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   *
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  themeConfig: {
    repo: '',
    editLinks: false,
    docsDir: '',
    editLinkText: '',
    lastUpdated: false,
    nav: [
      {
        text: 'Guidelines',
        link: '/guidelines/',
      },
      {
        text: 'Examples',
        link: '/examples/'
      },
      {
        text: 'For editors',
        link: '/for-editors/'
      }
    ],
    sidebar: {
      '/guidelines/': [
        {
          title: 'Guidelines',
          collapsable: false,
          children: [
            '',
            'common-structure-and-elements'
          ]
        },
        {
          title: 'Meta-information',
          collapsable: false,
          children: [
            'tei-header',
            'witness-description',
            'people-and-places',
            'bibliography',
          ]
        },
        {
          title: 'Content of the edition',
          collapsable: false,
          children: [
            'text-structure',
            'text-corrections',
            'translations',
          ]
        },
        {
          title: 'Abbreviations',
          collapsable: false,
          children: [
            'language-codes',
            'bible-short'
          ]
        }
      ],
      '/examples/': [
        {
          title: 'Partial examples',
          collapsable: false,
          children: [
            'somniale',
            'regula-st-benedicti'
          ]
        }
      ]
    }
  },

  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    '@vuepress/plugin-back-to-top',
    // '@vuepress/plugin-medium-zoom',
  ],

  chainWebpack: (config, isServer) => {
    config.module
      .rule('xml')
      .test(/\.xml$/)
      .use('file-loader')
      .loader('file-loader')
      .options({
        name: `[path][name].[ext]`
      }
    );

    config.module.rule('vue')
    .uses.store
    .get('vue-loader').store
    .get('options').transformAssetUrls = {
      video: ['src', 'poster'],
      source: 'src',
      img: 'src',
      image: ['xlink:href', 'href'],
      a: 'href'
    };
  },
}
