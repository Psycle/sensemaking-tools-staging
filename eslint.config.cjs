const js = require('@eslint/js');

module.exports = [
  js.configs.recommended,
  {
    rules: {
      'no-undef': 'off',
      'no-unused-vars': 'off'
    }
  }
];