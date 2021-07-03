EESM 5120 Midterm Project - Fully Differential Operational Amplifier Design
===============================================
Click below to see the project report\
<a href="https://github.com/samlam723/FullyDifferentialOpAmp/blob/main/EESM5120_midterm_project_report.pdf" target="_blank">EESM 5120 Project Report</a>


Structure Diagram
------------------
![Structure Diagram](https://user-images.githubusercontent.com/32325433/113855162-4d418d00-97d2-11eb-9c23-b351de93a286.png)

Specification and Result
------------------
![Specification and Result](https://user-images.githubusercontent.com/32325433/113892260-6a895200-97f8-11eb-801e-4a1ca2cbb827.png)

To simulate via HSPICE:
```
hspice opamp_diffgain.sp > opamp_diffgain.lis
```
To view the output file:
```
cat opamp_diffgain.lis
```
To view the output waveform via Synopsys WaveView Analyzer:
```
wv &
```




