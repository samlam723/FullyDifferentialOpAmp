* EESM5120 amplifier design

.option post probe nomod dcon=1
.include 'tsmc018.mod'
.include 'folded_cascode_amp'

* low-frequency differential gain
vdd	vdd     0       1.0
vss	vss     0       -1.0
x1	vdd	vss	vin+	vin-	vo+	vo-	folded_cascode_amp
e+	vin+	101	100	0	0.5
e-	vin-	102	100	0	-0.5
voff	101	102	dc=0
vcm	102	vss	dc=1
vs	100	0	dc=0	ac=1

* load capacitance
cl1	vo+	vss	1p
cl2	vo-	vss	1p

* dc analysis (low-frequency gain, input resistance and output resistance)
.dc	vs	-100m	100m	0.1m
.tf	v(vo+,vo-)	vs
.probe	v(vo+,vo-)

* ac analysis (Bode plot)
.ac	dec	100	2	1g
.probe	ac	vdb(vo+,vo-)	vp(vo+,vo-)

* pole-zero analysis
.pz	v(vo+,vo-)	vs

.alter
vcm	102	0	dc=1	ac=1
vs	100	0	dc=0	ac=0

.op

.end
