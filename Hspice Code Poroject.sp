Name: MohammadAli Daneshsefatdost
*____________________________________library @ [90nm CMOS]______________________________________________________
.lib './TSMC_90nm.l' tt
*_______________________________Operating Temperature @ [25.C]__________________________________________________
.temp 25
*___________________________OTA(Operational Transmission Guide Booster)_________________________________________

Gm_OTA	out-	out+	in+	in-	10m
Rout	out+	out-	1MEG

*__________capacitors @[(Cs1 & Cs2 =1pF) , (Cp1 & Cp2 = 0.2pF) ,(Cl1 &Cl2 = 1pF) , (Cbst+,- = 1pF]______________

CL1	out+	0	1P
CL2	out-	0	1P
CS1	1	in-	1p
CS2	2	in+	1p
CP1	in-	0	0.2p
CP2	in+	0	0.2p
Cbst+	5	6	1p
Cbst-	55	66	1p
	
*________________switches Name.@[(Drain) , (Gate) ,(source) , (balk) , (Model_channel) , (W) , (L) , (M)________
Msw1	1	7	inp+	0	nch	W=1.23u		L=0.1u	M=1	*Clock Bootstrapping switches(+) 
Msw2	2	77	inp-	0	nch	W=1.23u		L=0.1u	M=1	*Clock Bootstrapping switches(-)
M3	in-	ph1a	cmi	0	nch	W=1.37u		L=0.1u	M=1	*number switches 3(NMOS)
M4	in+	ph1a	cmi	0	nch	W=1.37u		L=0.1u	M=1	*number switches 4(NMOS)
M5	out+	ph2	1	0	nch	W=2.56u		L=0.1u	M=1	*number switches 5(CMOS-N)
M6	1	ph2p	out+	dd	pch	W=10.61u	L=0.1u	M=1	*number switches 5(CMOS-P)
M7	out-	ph2	2	0	nch	W=2.56u		L=0.1u	M=1	*number switches 6(CMOS-N)
M8	2	ph2p	out-	dd	pch	W=10.61u	L=0.1u	M=1	*number switches 6(CMOS-P)
M9	out+	ph1	cmo	0	nch	W=3.44u		L=0.1u	M=1	*number switches 7(NMOS)
M1O	out-	ph1	cmo	0	nch	W=3.44u		L=0.1u	M=1	*number switches 8(NMOS)

*_____________________________________Clock Bootstrapping(+)____________________________________________________
MP1+	3	ph1d	dd	dd	pch	W=0.4u	L=0.1u	M=1
MP2+	4	ph1d	dd	dd	pch	W=0.4u	L=0.1u	M=1
MN1+	3	ph1d	0	0	nch	W=0.8u	L=0.1u	M=1
MN2+	4	ph1d	6	0	nch	W=0.8u	L=0.1u	M=1
M1+	inp+	7	6	0	nch	W=0.4u	L=0.1u	M=1
M2+	7	4	5	5	pch	W=0.16u	L=0.1u	M=1
M3+	6	3	0	0	nch	W=0.4u	L=0.1u	M=1
M4+	dd	7	5	5	pch	W=0.16u	L=0.1u	M=1
M5+	8	3	0	0	nch	W=0.8u	L=0.1u	M=1
MT5+	7	dd	8	0	nch	W=0.8u	L=0.1u	M=1

*_____________________________________Clock Bootstrapping(-)____________________________________________________
MP1-	33	ph1d	dd	dd	pch	W=0.4u	L=0.1u	M=1
MP2-	44	ph1d	dd	dd	pch	W=0.4u	L=0.1u	M=1
MN1-	33	ph1d	0	0	nch	W=0.8u	L=0.1u	M=1
MN2-	44	ph1d	66	0	nch	W=0.8u	L=0.1u	M=1
M1-	inp-	77	66	0	nch	W=0.4u	L=0.1u	M=1
M2-	77	44	55	55	pch	W=0.16u	L=0.1u	M=1
M3-	66	33	0	0	nch	W=0.4u	L=0.1u	M=1
M4-	dd	77	55	55	pch	W=0.16u	L=0.1u	M=1
M5-	88	33	0	0	nch	W=0.8u	L=0.1u	M=1
MT5-	77	dd	88	0	nch	W=0.8u	L=0.1u	M=1

*__________________sources @[(Vdd=1V) , (Vss=0V) , (Vcmi=0.2) , (Vcmo=0.5)]_____________________________________

Vdd	dd	0	dc=1           
Vcmi	cmi	0	dc=0.2	
Vcmo	cmo	0	dc=0.5
Vcm	cms	0	dc=0.5
*______________________________________Sinusoidal input source__________________________________________________

Vin+	inp+	cms	sin(0	0.25	1.599121094MEG	0	0)
Vin-	inp-	cms	sin(0	-0.25	1.599121094MEG	0	0)

*___________Vph number @pulse=[(V1),(V2),(Td:"delay"),(Tr:"rise"),(Tf:"fall"),(Width),(Period)]_________________

VPH1	ph1	0	pulse(0		1	0.3n	0.1n	0.1n	4.6n	10n)	
VPH2	ph2	0	pulse(1		0	0n	0.1n	0.1n	5.2n	10n)
VPH1a	ph1a	0	pulse(0		1	0.3n	0.1n	0.1n	4.4n	10n)
VPH1d	ph1d	0	pulse(0		1	0.4n	0.1n	0.1n	4.6n	10n)	
VPH2p	ph2p	0	pulse(0		1	0n	0.1n	0.1n	5.2n	10n)
*____________________________________________simulation_________________________________________________________
.tran	10n	81920n  
.probe tran V(out+,out-) V(inp+,inp-) 
.print tran V(out+,out-) V(inp+,inp-)
.option accurate=1
.option ingold=2
.options list node post
.optin post
.print
.probe
.ap
ends
