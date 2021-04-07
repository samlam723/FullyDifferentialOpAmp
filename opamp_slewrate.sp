* EESM5120 amplifier design

.option post probe nomod dcon=1
.include 'tsmc018.mod'
.include 'folded_cascode_amp'

* slew rate
vdd	vdd	0	1.0
vss	vss	0	-1.0
x1	vdd	vss	vin+	vo+	vo+	vo-	folded_cascode_amp

* load capacitance
cl1	vo+	0	1p
cl2	vo-	0	1p

vpulse	vin+	0	pwl(0 -1.0 200n -1.0 200.1n 1.0 700n 1.0 700.1n -1.0)

.trans	0.1n	1u
.probe	v(vin+)	v(vo+,vo-)
.op

.end
