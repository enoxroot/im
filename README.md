# Tools which I use to find products valuable to start business with

### also in use

- data science toolbox (look foot the "data science at the command line" book) - header, body, cols
- csvkit (csvclean, csvjoin, csvcut, csvgrep, etc.)
- neovim and vim text editors
- firefox and chromium browsers
- bash, zsh, fish shells
- cat, less, sed, awk, grep, etc.
- libre office calc and google docs spreadsheets

### Approx workflow is

- defining intetrsting areas and creating the list (firefox, nvim)
- searching areas in market.yandex.ru and saving all first pages (market_get.sh)
- concatenating and parsing saved pages to get the list of area products with prices (cat, market_parse.sh, csvclean)
- creating separate list of products to check (csvcut, nvim)
- searching for wordings and ads, saving html pages (ads_get.sh, wordstat_get.sh)
- concatinating ads.html, concatenating wordstat.html (cat, zsh)
- parsing concatenated files to get search rate and ads count for each product (wordstat_parse.sh, ads_parse.sh, csvclean)
- joining 3 lists - data from market, data with search rate and amount of paid ads avaliable (csvjoin -c name --left market_out.csv, wordstat_out.csv, ads_out.csv)
- analising data with spreadshit software (libre, google)
- manually searching for partners


