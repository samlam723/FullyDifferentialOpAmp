* EESM5120 amplifier design

.option post probe nomod dcon=1
.include 'tsmc018.mod'
.include 'folded_cascode_amp'

* low-frequency differential gain
vdd	vdd     0       1.0
vss	vss     0       -1.0
x1	vdd	vss	vp	vn	vo+	vo-	folded_cascode_amp

r2	vo+	vn	10k
r1	vn	vin-	10k
r4	vo-	vp	10k
r3	vp	vin+	10k

vin1	vin+	100	sin(0 0.5625 30k)
vin2	vin-	100	sin(0 -0.5625 30k)
vcm	100	vss	1.0

.tran	10n	5m
.four	30k	v(vo-,vo+)

.end
