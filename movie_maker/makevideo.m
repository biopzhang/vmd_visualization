% This program is to make a video in Matlab
% by collecting the pictures generated from 
% function contactmap(filename, dist).
% Credit: Pengzhi Zhang
% 3/10/2016

v = VideoWriter('Movie.avi');
v.FrameRate = 200;	  % fps
v.Quality = 100;		  % 0-100, quality of compressed files
open(v);

nFrames = 4000;
for k = 0: nFrames
	time =  k*0.001;
	filename = ['../pics/untitled.',num2str(k,'%05d'),'.ppm'];

	drawnow;
	frame=imread(filename);

	text = ['time: ', num2str(time, '%5.3f'), '  ns'];
	position = [400 1000];
	RGB = insertText(frame, position, text, 'FontSize', 30, 'BoxColor', 'yellow', 'BoxOpacity', 0.01, 'TextColor', 'black');
	writeVideo(v,RGB);
end

close(v);
