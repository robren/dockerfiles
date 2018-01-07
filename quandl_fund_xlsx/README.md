
# quandl _ fund _ xlsx

An unofficial CLI tool which uses the Quandl API and the Sharadar Essential Fundamentals
Database to extract financial fundamentals, Sharadar provided ratios as
well as calculate additional ratios.  Results are
written to an Excel Workbook with a separate worksheet per ticker analysed.

# How to use this image

## To build a local image file
Clone this repo and run the following command.

	docker build -t quandl_fund_xlsx_app .

When this is posted to the dockerhub this step will be unnecesary

# Running the image

Run the image in an interactive terminal mode (that's the -it flag) and bind
mount a location on the host where you wish the output excel file from the
application to be written to.

Note that the environment variable QUANDL_API_KEY must be set. This is exported
to the application by the use of the -e flag.

``` shell

	➜  test ls -l
	total 0
	➜  test docker run -it -v $PWD:/home/quandl_user -e QUANDL_API_KEY  quandl_fund_xlsx_app
	quandl_user@3900b86aaaff:~$ quandl_fund_xlsx --version
	0.1.4
	quandl_user@3900b86aaaff:~$ quandl_fund_xlsx --help
	quandl_fund_xlsx

	Usage:
	quandl_fund_xlsx (-i <ticker-file> | -t <ticker>) [-o <output-file>]
									[-y <years>] [-d <sharadar-db>]


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
	--version             Show version.
	quandl_user@3900b86aaaff:~$ quandl_fund_xlsx -t MSFT
	{'--database': 'SF0',
	'--input': None,
	'--output': 'stocks.xlsx',
	'--ticker': 'MSFT',
	'--years': '5'}
	Ticker = MSFT
	Output will be written to stocks.xlsx
	2018-01-07 18:18:02,747 INFO     Processing the stock MSFT
	2018-01-07 18:18:13,089 INFO     Processed the stock MSFT
	quandl_user@3900b86aaaff:~$ ls -l
	total 20
	-rw-rw-r-- 1 quandl_user quandl_user  532 Jan  7 17:26 Dockerfile
	-rw-rw-r-- 1 quandl_user quandl_user 2326 Sep  2 21:25 README.md
	-rw-r--r-- 1 quandl_user quandl_user 8796 Jan  7 18:18 stocks.xlsx
```

## GitHub repos 

The Dockerfile for the image can be found at [robren/dockerfiles/quandl_fund_xlsx](https://github.com/robren/dockerfiles/qaundl_fund_xlsx)
The GitHub repo for the quandl _ fund _ xlsx python package can be found at [github.com/robren/quand_fund_xlsx](https://github.com/robren/quandl_fund_xlsx)


