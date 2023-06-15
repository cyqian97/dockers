rm -rf /tmp/.X1* 
tigervncserver :1 -xstartup /root/.xinit -geometry 2000x1000
websockify --web=/usr/share/novnc/ -D --cert=novnc.pem 6080 127.0.0.1:5901 
