const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './config/initializers/simple_form.rb',
    './config/initializers/heroicon.rb',
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  safelist: [
    "absolute",
    "bg-gray-50",
    "bg-red-50",
    "border",
    "border-gray-300",
    "border-l-0",
    "border-l-4",
    "border-r-0",
    "border-red-400",
    "flex",
    "flex-shrink-0",
    "h-5",
    "inline-flex",
    "inset-y-0",
    "items-center",
    "ml-3",
    "mt-1",
    "p-4",
    "pointer-events-none",
    "pr-3",
    "px-3",
    "relative",
    "right-0",
    "rounded-l-md",
    "rounded-md",
    "rounded-r-md",
    "shadow-sm",
    "sm:text-sm",
    "text-gray-500",
    "text-red-500",
    "text-red-700",
    "text-sm",
    "w-5"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/container-queries'),
  ]
}
