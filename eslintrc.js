const a11yWarn = Object.keys(require('eslint-plugin-jsx-a11y').rules).reduce(
  (acc, rule) => {
    acc[`jsx-a11y/${rule}`] = 'warn';
    return acc;
  },
  {},
);

module.exports = {
  parser: 'babel-eslint',
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
    },
  },
  env: {
    browser: true,
    node: true,
  },
  extends: [
    'eslint:recommended',
    'plugin:react/recommended',
    'airbnb',
    'prettier',
  ],
  plugins: ['react-hooks', 'prettier'],
  rules: {
    ...a11yWarn,
    'react/prop-types': 'off',
    'react-hooks/rules-of-hooks': 'error',
    'react-hooks/exhaustive-deps': 'warn',
    'react/jsx-no-useless-fragment': 'error',
    'react/jsx-filename-extension': 'off',
    'react/jsx-props-no-spreading': 'off',
    'react/jsx-one-expression-per-line': 'off',
    'react/jsx-wrap-multilines': 'off',
    'react/jsx-indent': 'off',
    'react/jsx-curly-newline': 'off',
    'react/static-property-placement': ['error', 'static public field'],
    'react/state-in-constructor': ['error', 'never'],
    'prettier/prettier': 'warn',
    'import/no-cycle': 'off',
    'arrow-parens': 'off',
    'operator-linebreak': 'off',
    indent: 'off',
    'no-underscore-dangle': 'off',
    'no-nested-ternary': 'warn',
    'no-shadow': ['error', { allow: ['error'] }],
    'no-param-reassign': [
      'error',
      {
        // Copied from airbnb config: https://github.com/airbnb/javascript/blob/6d05dd898acfec3299cc2be8b6188be542824965/packages/eslint-config-airbnb-base/rules/best-practices.js#L190-L204
        // with extra added and unnecessary removed
        props: true,
        ignorePropertyModificationsFor: [
          'acc', // for reduce accumulators
          'accumulator', // for reduce accumulators
          'e', // for e.returnvalue
          'req', // for Express requests
          'request', // for Express requests
          'res', // for Express responses
          'response', // for Express responses
          'staticContext', // for ReactRouter context,
          'draft', // for immer draft
        ],
      },
    ],
    'no-magic-numbers': [
      'warn',
      {
        ignore: [0, 1],
        ignoreArrayIndexes: true,
        enforceConst: true,
        detectObjects: false,
      },
    ],
  },
  overrides: [
    {
      files: ['common/components/**/*.js', 'common/containers/**/*.js'],
      rules: {
        'no-nested-ternary': 'off',
      },
    },
    {
      files: ['server/controllers/**/*.js', 'common/pages/**/*.js'],
      rules: {
        'class-methods-use-this': 'off',
      },
    },
    {
      files: ['server/models/**/*.js'],
      rules: {
        'no-use-before-define': ['error', { classes: false }],
      },
    },
  ],
};
