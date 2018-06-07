
filenames = [];
for s = 1:4
    filename = "sub" + string(s) + "_" + "Handshaking.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Bowing.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Clapping.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Elbowing.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Frontkicking.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Hammering.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Headering.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Hugging.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Kneeing.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Jumping.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Pulling.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Punching.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Pushing.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Running.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Seating.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Sidekicking.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Slapping.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Standing.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Walking.txt";
    filenames =  [filenames, filename];
    filename = "sub" + string(s) + "_" + "Waving.txt";
    filenames =  [filenames, filename];
end

outputnames = [];
for s = 1:4
    filename = "sub" + string(s) + "_" + "Handshaking_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Bowing_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Clapping_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Elbowing_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Frontkicking_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Hammering_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Headering_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Hugging_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Kneeing_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Jumping_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Pulling_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Punching_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Pushing_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Running_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Seating_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Sidekicking_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Slapping_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Standing_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Walking_processed.txt";
    outputnames =  [outputnames, filename];
    filename = "sub" + string(s) + "_" + "Waving_processed.txt";
    outputnames =  [outputnames, filename];
end

for i = 1:length(filenames)
    datafile = convertStringsToChars(filenames(i));
    outputfile = convertStringsToChars(outputnames(i));
    processed_data = process_data(datafile,outputfile);
end

function processed_data = process_data(datafile,outputfile)
    raw_data = importdata(datafile);
    filter_data =detrend(raw_data);
    rectified_data = abs(filter_data);
    %figure(1)
   % plot_signals(raw_data);
    processed_data = sgolayfilt(rectified_data,3,49);
    %figure(2)
    %plot2 = plot_signals(processed_data);
    %figure(2)
    %findpeaks(processed_data(:,1))
    %figure(4)
    %plot(rectified_data(:,1))
    %figure(5)
    %plot(processed_data(:,1))
    fid=fopen(outputfile,'wt');
    fprintf(fid,'%f %f %f %f %f %f %f %f \n', processed_data');
    fclose(fid);
end

function plots = plot_signals(x)
    for i = 1:8
        s = x(:,i);
        subplot(8,1,i)
        plots = plot(s)
        ylim([0,4000])
    end
end
