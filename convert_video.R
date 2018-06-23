#convert videos using ffmpeg into a '/trimmed' folder
#setup to convert pygame.movie friendly files
library(gtools)

#mass convert
myPath = 'C:/Users/You/'
my_dir_list = mixedsort(list.files(myPath))

#list of start and end times of format 00:00:00
start_times = c("00:00:00")
end_times = c("00:00:30")
for (i in 1:length(start_times)) {
  system(sprintf('ffmpeg -i "%s%s" -vcodec mpeg1video -q:v 6 -acodec libmp3lame -r 30 -vf scale=500:400 -avoid_negative_ts make_zero -ss %s -to %s -intra trimmed/video_%s.mpg',myPath, my_dir_list[i],start_times[i],end_times[i],as.character(i)))
}

#convert single within dir, where i is item index in directory
i=0
system(sprintf('ffmpeg -i "%s%s" -vcodec mpeg1video -q:v 6 -acodec libmp3lame -r 30 -vf scale=500:400 -avoid_negative_ts make_zero -ss %s -to %s -intra trimmed/video_%s.mpg',myPath, my_dir_list[i],start_times[i],end_times[i],as.character(i)))

