# IGS_Rinex_Downloader
auto download Rinex from IGS server
 _      _____ _____  _____   _____  _____ _   _ ________   __
| |    |_   _/ ____|/ ____| |  __ \|_   _| \ | |  ____\ \ / /
| |______| || |  __| (___   | |__) | | | |  \| | |__   \ V /
| |______| || | |_ |\___ \  |  _  /  | | | .   |  __|   > <
| |     _| || |__| |____) | | | \ \ _| |_| |\  | |____ / . \
|_|    |_____\_____|_____/  |_|  \_\_____|_| \_|______/_/ \_\
Downloader

collection.txt: add stations to download from.
process.txt: errors log.

Rinex Format:
| | | | O: Observation file
| | | | N: GPS navigation message file
| | | | M: Meteorological data file
| | | | G: GLONASS navigation message file
| | | | L: Galileo navigation message file
| | | | P: Mixed GNSS navigation message file
| | | | H: SBAS Payload navigation message file
| | | | B: SBAS broadcast data file

IGS-Stations found [collection.txt]: ramo drag bshm isba

start date dd/MM/yy: 01/01/19
end date dd/MM/yy: 02/01/19
Your input '01/01/2019 00:00:00' and '01/02/2019 00:00:00' on '07/13/2019 14:49:04'
Downloading 4 files.
1/4: Downloading ftp://cddis.gsfc.nasa.gov/gnss/data/daily/2019/001/19o/ramo0010.19o.Z
2/4: Downloading ftp://cddis.gsfc.nasa.gov/gnss/data/daily/2019/001/19o/drag0010.19o.Z
3/4: Downloading ftp://cddis.gsfc.nasa.gov/gnss/data/daily/2019/001/19o/bshm0010.19o.Z File not found.
4/4: Downloading ftp://cddis.gsfc.nasa.gov/gnss/data/daily/2019/001/19o/isba0010.19o.Z
