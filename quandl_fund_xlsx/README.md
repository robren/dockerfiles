
# quandl _ fund _ xlsx

An unofficial CLI tool which uses the Quandl API and the Sharadar Essential Fundamentals
Database to extract financial fundamentals, Sharadar provided ratios as
well as calculate additional ratios.  Results are
written to an Excel Workbook with a separate worksheet per ticker analysed.

# How to use this image

## To build a local image file
Clone this repo and run the following command.

	docker build -t quandl_fund_xlsx_app .

When this is posted to the dockerhub this step will be unnecessary.

# Running the image

Run the image in an interactive terminal mode (that's the -it flag) and bind
mount a location on the host where you wish the output excel file from the
application to be written to (the -v flag)

Note that at least one of the local  environment variables
QUANDL_API_SF0_KEY or QUANDL_API_SF1_KEY must be set and exported to the docker container
using the -e flag

``` shell

➜  quandl_fund_xlsx git:(master) ✗ ls -la
total 24
drwxr-xr-x  5 rob  staff   160 Apr 22 11:06 .
drwxr-xr-x  6 rob  staff   192 Apr 21 17:30 ..
-rw-r--r--  1 rob  staff   277 Apr 21 17:30 Dockerfile
-rw-r--r--  1 rob  staff  2706 Apr 21 17:35 README.md
-rw-r--r--  1 rob  staff    15 Apr 22 11:05 portfolio.txt

➜  quandl_fund_xlsx git:(master) ✗ docker run -it -v $PWD:/home/quandl_user -e QUANDL_API_SF1_KEY quandl_fund_xlsx_app
quandl_user@48146d26108d:~$ quandl_fund_xlsx --version
version='0.4.0'

quandl_user@48146d26108d:~$ quandl_fund_xlsx --help
quandl_fund_xlsx

Usage:
  quandl_fund_xlsx (-i <ticker-file> | -t <ticker>) [-o <output-file>]
                                 [-y <years>] [-d <sharadar-db>]
                                 [--dimension <dimension>]


  quandl_fund_xlsx.py (-h | --help)
  quandl_fund_xlsx.py --version

Options:
  -h --help             Show this screen.
  -i --input <file>     File containing one ticker per line
  -t --ticker <ticker>  Ticker symbol
  -o --output <file>    Output file [default: stocks.xlsx]
  -y --years <years>    How many years of results (max 7 with SF0) [default: 5]
  -d --database <database>    Sharadar Fundamentals database to use, SFO (aka Sample Data) or
                              SF1 [default: SF0]
  --dimension <dimension>     Sharadar database dimension, ARY, MRY, ART, MRT, MRQ, ARQ
                              [default: MRY]
 --version             Show version.


quandl_user@48146d26108d:~$ quandl_fund_xlsx -d SF1 -i portfolio.txt -o portfolio.xlsx
{'--database': 'SF1',
 '--dimension': 'MRY',
 '--input': 'portfolio.txt',
 '--output': 'portfolio.xlsx',
 '--ticker': None,
 '--years': '5'}
Ticker = MSFT

Ticker = AAPL

Ticker = INTC

Output will be written to portfolio.xlsx
2020-04-22 15:07:14,897 INFO     Processing the stock MSFT
2020-04-22 15:07:15,758 INFO     Processed the stock MSFT
2020-04-22 15:07:15,759 INFO     Processing the stock AAPL
2020-04-22 15:07:16,384 INFO     Processed the stock AAPL
2020-04-22 15:07:16,385 INFO     Processing the stock INTC
2020-04-22 15:07:17,107 INFO     Processed the stock INTC
quandl_user@48146d26108d:~$ ls -la
total 56
drwxr-xr-x 6 quandl_user quandl_user   192 Apr 22 15:07 .
drwxr-xr-x 1 root        root         4096 Apr 21 21:39 ..
-rw-r--r-- 1 quandl_user quandl_user   277 Apr 21 21:30 Dockerfile
-rw-r--r-- 1 quandl_user quandl_user  2706 Apr 21 21:35 README.md
-rw-r--r-- 1 quandl_user quandl_user    15 Apr 22 15:05 portfolio.txt
-rw-r--r-- 1 quandl_user quandl_user 37558 Apr 22 15:07 portfolio.xlsx

quandl_user@48146d26108d:~$

quandl_user@48146d26108d:~$ exit
exit
➜  quandl_fund_xlsx git:(master) ✗ ls -la
total 112
drwxr-xr-x  7 rob  staff    224 Apr 22 11:09 .
drwxr-xr-x  6 rob  staff    192 Apr 21 17:30 ..
-rw-------@ 1 rob  staff    141 Apr 22 11:09 .bash_history
-rw-r--r--  1 rob  staff    277 Apr 21 17:30 Dockerfile
-rw-r--r--  1 rob  staff   2706 Apr 21 17:35 README.md
-rw-r--r--  1 rob  staff     15 Apr 22 11:05 portfolio.txt
-rw-r--r--  1 rob  staff  37558 Apr 22 11:07 portfolio.xlsx


## GitHub repos
The Dockerfile for the image can be found at [github.com/robren/dockerfiles/quandl_fund_xlsx](https://github.com/robren/dockerfiles/blob/master/quandl_fund_xlsx/Dockerfile)
The GitHub repo for the quandl _ fund _ xlsx python package can be found at [github.com/robren/quand_fund_xlsx](https://github.com/robren/quandl_fund_xlsx)
