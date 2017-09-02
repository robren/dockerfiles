
# quandl _ fund _ xlsx

A unofficial CLI tool which uses the Quandl API and the Sharadar Essential Fundamentals
Database to extract financial fundamentals, Sharadar provided ratios as
well as calculate additional ratios.  Results are
written to an Excel Workbook with a separate worksheet per ticker analysed.

# How to use this image

Run the image in an interactive terminal mode (that's the -it flag) and bind
mount a location on the host where you wish the output excel file from the
application to be written to

``` shell

	➜  test ls -l
	total 0
	➜  test docker run -it -v $PWD:/home/quandl_user -e QUANDL_API_KEY  quandl_fund_xlsx_image
	quandl_user@1199369bddfd:~$ quandl_fund_xlsx -h
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
	-d --database <database>    Sharadar Fundamentals database to use, SFO or
								SF1 [default: SF0]
	--dimension <dimension>     Sharadar database dimension, MRY, MRT, ART [default: MRY]
	--version             Show version.
	quandl_user@1199369bddfd:~$ quandl_fund_xlsx -t aapl
	{'--database': 'SF0',
	'--dimension': 'MRY',
	'--input': None,
	'--output': 'stocks.xlsx',
	'--ticker': 'aapl',
	'--years': '5'}
	('Ticker =', 'aapl')
	Output will be written to stocks.xlsx
	2017-09-02 20:34:00,877 INFO     Processing the stock aapl
	2017-09-02 20:34:07,213 INFO     Processed the stock aapl
	quandl_user@1199369bddfd:~$ ls -l
	total 12
	-rw-r--r-- 1 quandl_user quandl_user 8794 Sep  2 20:34 stocks.xlsx
	quandl_user@1199369bddfd:~$ exit
	exit
	➜  test ls -l
	total 12
	-rw-r--r-- 1 test test 8794 Sep  2 16:34 stocks.xlsx
	➜

```

## GitHub repos 

The Dockerfile  for the image can be found at [robren/dockerfiles](https://github.com/robren/dockerfiles)
The GitHub repo for the quandl _ fund _ xlsx python package can be found at [github.com/robren](https://github.com/robren/quandl_fund_xlsx)


