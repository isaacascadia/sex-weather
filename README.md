# sex-weather
Comparing Google search trends for "sexual enhancement" to fluctuations in weather.

This repository contains R scripts, data, and figures for a Data Analysis in R course project.


Cities list should be ordered!

Weather workflow
1. Reduce uscities data to top n cities 
2. extract city lat and long from uscities data
3. Use lat and long to find first station in each city
4. paste wban and usaf codes to collect weather data for ith city


Gtrends workflow
1. use cities data to find sub_codes for top n cities
2. query gtrends with ith city's sub_code


Analysis workflow
1. transform data to match temporally
2. for ith city, run correlation test
