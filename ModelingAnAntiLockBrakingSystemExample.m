
open_system('sldemo_absbrake'); 


open_system('sldemo_absbrake/Wheel Speed');


evalc('sim(''sldemo_absbrake'')'); %this code is not shown in the example


Time_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Time;
Stop_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Data;




ctrl=0;



evalc('sim(''sldemo_absbrake'')'); 


Time_no_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Time; %save the non-ABS results
Stop_no_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Data;
%% Braking With ABS Versus Braking Without ABS

plot(Time_ABS, Stop_ABS, Time_no_ABS, Stop_no_ABS); 
xlabel('Slip Time (sec)'); 
ylabel('Stopping Distance (ft)');
legend('With ABS','Without ABS','Location','SouthEast');
title('Stopping distance for hard braking with and without ABS');

%% Closing the Model

close_system('sldemo_absbrake', 0);
close_system('sldemo_wheelspeed_absbrake', 0);
clear sldemo_absbrake_output Stop_ABS Stop_no_ABS Time_ABS Time_no_ABS;
clear mex;

