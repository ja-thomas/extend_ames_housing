download:
	mkdir -p data_raw data
	wget http://www.timeseriesclassification.com/Downloads/SmallKitchenAppliances.zip -P data_raw/
	wget http://www.timeseriesclassification.com/Downloads/LargeKitchenAppliances.zip -P data_raw/
	unzip data_raw/SmallKitchenAppliances.zip -d data_raw/
	unzip data_raw/LargeKitchenAppliances.zip -d data_raw/
	rm data_raw/*.zip
	rm data_raw/*.ts
	rm data_raw/*.txt

process:
	Rscript process_raw.R

timeseries:
	Rscript generate_time_series.R

ames:
	Rscript generate_ames_dirty.R

test:
	Rscript test_timeseries_pred_quality.R
