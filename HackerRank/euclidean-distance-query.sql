select  round(
    sqrt
        ((min(Lat_n) - max(Lat_n)) * (min(Lat_n) - max(Lat_n)) + 
        (min(long_w) - max(long_w)) * (min(long_w) - max(long_w)))
        ,4) 
from station;
/*Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

Input Format

The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.*/