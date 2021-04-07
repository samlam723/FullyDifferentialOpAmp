* EESM5120 amplifier design

.option post probe nomod dcon=1
.include 'tsmc018.mod'
.include 'folded_cascode_amp'

* low-frequency differential gain
vdd	100     0       1.0
vss	vss     0       -1.0
x1	vdd	vss	101	101	vo+	vo-	folded_cascode_amp
vcm	101	vss	dc=1
vs	vdd	100	dc=0	ac=1

* load capacitance
cl1	vo+	0	1p
cl2	vo-	0	1p

* dc analysis (low-frequency gain, input resistance and output resistance)
.dc	vs	-5m	5m	0.001m
.tf	v(vo+,vo-)	vs
.probe	dc	v(vo+,vo-)

* ac analysis (Bode plot)
.ac	dec	100	2	1g
.probe	ac	vdb(vo+,vo-)	vp(vo+,vo-)

* pole-zero analysis
.pz	v(vo+,vo-)	vs

.op

*.alter
*vcm	102	0	dc=1	ac=1
*vs	100	0	dc=0	ac=0

.end
