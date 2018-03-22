%% DEMO of CGS and CGStime

% Save this demo file, with CGS and CGS_time in the same directory (required time < 1 minute) . The
% code does not require compilation and is ready for usage.

% Next, change the matlab work directory to the directory containing the 3 files
% (the current working directory can be found by typing 'pwd' in the matlab
% command line, followed by pressing enter).

% This demo can now be evaluated by typing DEMO_CGS_AND_CGS_time in the matlab
% command line and pressing enter.

% By running this demo, the tumor growth simulations CGS and CGS_time have
% been called with parameters lambda=0.35, h=1 and a=0.55 (for CGS only).
% The resulting clone sizes have been stored in clonesizes and
% clonesizes_time for CGS and CGS_time, respectively. 
% In these output arrays, each column contains the size of all clones for a
% given time, and each row the size of a clone at all times.
% The expected run time on a normal computer is < 20 seconds.

%%
% Display start time and date of demo
now=datetime;
disp(strcat('Demo started:',datestr(now) ));
% Define input
lambda=0.35;
a=0.55;
h=1;
% Call CGS and store clone sizes in 'clonesizes' 
clonesizes=CGS(lambda,a,h);
% Call CGS_time and store clone sizes in 'clonesizes_time'
clonesizes_time=CGS_time(lambda,h);
% Display end time and date of demo
now=datetime;
disp(strcat('Demo finished:',datestr(now) ));
% clear parameters
clear lambda a h now