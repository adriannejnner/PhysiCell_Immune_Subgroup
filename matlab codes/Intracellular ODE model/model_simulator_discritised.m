function sol_mat_updated = model_simulator_discritised(dt,sol_mat,parameters)	

% Variables
VEx     = sol_mat(1);
VAtthi  = sol_mat(2);
VAttlo  = sol_mat(3);
VEn     = sol_mat(4);
Vcytp 	= sol_mat(5);
Vnucp   = sol_mat(6);
RC      = sol_mat(7);
RV      = sol_mat(8);	
RCRdRp  = sol_mat(9);
RVRdRp  = sol_mat(10);
Cp      = sol_mat(11);
VnucPM1 = sol_mat(12);
VcytPM1 = sol_mat(13);
RM1     = sol_mat(14);
RM2     = sol_mat(15);
RM3     = sol_mat(16);
RM4     = sol_mat(17);
RM5     = sol_mat(18);
RM6     = sol_mat(19);
RM7     = sol_mat(20);
RM8     = sol_mat(21);
PPB1    = sol_mat(22);
PPB2    = sol_mat(23);
PPA     = sol_mat(24);
PRdRp   = sol_mat(25);
PNP     = sol_mat(26);
PM1     = sol_mat(27);
PNEP    = sol_mat(28);
PHA     = sol_mat(29);
PNA     = sol_mat(30);
PM2     = sol_mat(31);
VRel    = sol_mat(32);
    
% Parameters
DRib = parameters.DRib;
		
FSp17 = parameters.FSp17;
FSp18 = parameters.FSp18;
	
kEn = parameters.kEn;
kEqhi = parameters.kEqhi;
kEqlo = parameters.kEqlo;
kFus = parameters.kFus;
kImp = parameters.kImp;
kExp = parameters.kExp;
kRdRp = parameters.kRdRp;
kRel = parameters.kRel;
	
kBindNP = parameters.kBindNP;
kBindM1 = parameters.kBindM1;
kBindRdRp = parameters.kBindRdRp;

kDegRnp = parameters.kDegRnp;
kDegR = parameters.kDegR;
kDegRRdRp = parameters.kDegRRdRp;
kDegM = parameters.kDegM;
	
kSynC = parameters.kSynC;
kSynV = parameters.kSynV;	
kSynM = parameters.kSynM;	
kSynP = parameters.kSynP;	
		
L1 = parameters.L1;
L2 = parameters.L2;
L3 = parameters.L3;
L4 = parameters.L4;
L5 = parameters.L5;
L6 = parameters.L6;
L7 = parameters.L7;
L8 = parameters.L8;
	
LV = parameters.LV;
		
KVRel = parameters.KVRel;
		
NNucNP = parameters.NNucNP;
NNucM1 = parameters.NNucM1;
NNucNEP = parameters.NNucNEP;
NPM1 = parameters.NPM1;
NPM2 = parameters.NPM2;
NPRdRp = parameters.NPRdRp;
NPHA = parameters.NPHA;
NPNP = parameters.NPNP;
NPNA = parameters.NPNA;
NPNEP = parameters.NPNEP;

kAtthi = parameters.kAtthi;
kAttlo = parameters.kAttlo;
FFus = parameters.FFus;
Btothi = parameters.Btothi;
Btotlo = parameters.Btotlo;

kDishi = kAtthi/kEqhi;
kDislo = kAttlo/kEqlo;

kDegVen = (1-FFus)/FFus*kFus;


%% calculate variables

Bhi = Btothi - VAtthi;
Blo = Btotlo - VAttlo;

% binding model
VEx = VEx + (kDishi*VAtthi+kDislo*VAttlo-(kAtthi*Bhi+kAttlo*Blo)*VEx)*dt;
VAtthi = VAtthi + (kAtthi*Bhi*VEx-(kDishi+kEn)*VAtthi)*dt;
VAttlo = VAttlo + (kAttlo*Blo*VEx-(kDislo+kEn)*VAttlo)*dt;
VEn = VEn + (kEn*(VAtthi+VAttlo)-(kFus+kDegVen)*VEn)*dt;

% replication model
rRel = kRel*VcytPM1*(PRdRp/(PRdRp+KVRel*NPRdRp))*(PHA/(PHA+KVRel*NPHA))*(PNP/(PNP+KVRel*NPNP))*(PNA/(PNA+KVRel*NPNA))*(PM1/(PM1+KVRel*NPM1))*(PM2/(PM2+KVRel*NPM2))*(PNEP/(PNEP+KVRel*NPNEP));
	
Vcytp   = 0;% Vcytp + (8*kFus*VEn-kImp*Vcytp)*dt;
Vnucp   = Vnucp + (kImp*Vcytp+kBindNP*PNP*RVRdRp-(kBindM1*PM1+kDegRnp)*Vnucp)*dt;
RC      = RC + (kSynC*Vnucp-kBindRdRp*PRdRp*RC-kDegR*RC)*dt;
RV      = RV +(kSynV*Cp-kBindRdRp*PRdRp*RV-kDegR*RV)*dt;	
RCRdRp  = RCRdRp +(kBindRdRp*PRdRp*RC-kBindNP*PNP*RCRdRp-kDegRRdRp*RCRdRp)*dt;
RVRdRp  = RVRdRp+(kBindRdRp*PRdRp*RV-kBindNP*PNP*RVRdRp-kDegRRdRp*RVRdRp)*dt;
Cp      = Cp +(kBindNP*PNP*RCRdRp-kDegRnp*Cp)*dt;
VnucPM1 = VnucPM1 +(kBindM1*PM1*Vnucp-(kExp*PNEP+kDegRnp)*VnucPM1)*dt;
VcytPM1 = VcytPM1 +(kExp*PNEP*VnucPM1-8*rRel-kDegRnp*VcytPM1)*dt;
RM1     = RM1 + ((kSynM/L1)*(Vnucp/8)-kDegM*RM1)*dt;
RM2     = RM2 +((kSynM/L2)*(Vnucp/8)-kDegM*RM2)*dt;
RM3     = RM3 + ((kSynM/L3)*(Vnucp/8)-kDegM*RM3)*dt;
RM4     = RM4 + ((kSynM/L4)*(Vnucp/8)-kDegM*RM4)*dt;
RM5     = RM5 + ((kSynM/L5)*(Vnucp/8)-kDegM*RM5)*dt;
RM6     = RM6 + ((kSynM/L6)*(Vnucp/8)-kDegM*RM6)*dt;
RM7     = RM7 + ((kSynM/L7)*(Vnucp/8)-kDegM*RM7)*dt;
RM8     = RM8 + ((kSynM/L8)*(Vnucp/8)-kDegM*RM8)*dt;
PPB1    = PPB1 + (kSynP/DRib*RM2-kRdRp*PPB1*PPB2*PPA)*dt;
PPB2    = PPB2 + (kSynP/DRib*RM1-kRdRp*PPB1*PPB2*PPA)*dt;
PPA     = PPA + (kSynP/DRib*RM3-kRdRp*PPB1*PPB2*PPA)*dt;
PRdRp   = PRdRp + (kRdRp*PPB1*PPB2*PPA-kBindRdRp*PRdRp*(RV+RC)-(NPRdRp-8)*rRel)*dt;
PNP     = PNP + (kSynP/DRib*RM5-LV/NNucNP*kBindNP*PNP*(RVRdRp+RCRdRp)-(NPNP-8*LV/NNucNP)*rRel)*dt;
PM1     = PM1+(kSynP/DRib*(1-FSp17)*RM7-LV/NNucM1*kBindM1*PM1*Vnucp-(NPM1-8*LV/NNucM1)*rRel)*dt;
PNEP    = PNEP + (kSynP/DRib*FSp18*RM8-LV/NNucNEP*kExp*PNEP*VnucPM1-(NPNEP-8*LV/NNucNEP)*rRel)*dt;
PHA     = PHA +(kSynP/DRib*RM4-NPHA*rRel)*dt;
PNA     = PNA + (kSynP/DRib*RM6-NPNA*rRel)*dt;
PM2     = PM2 + (kSynP/DRib*FSp17*RM7-NPM2*rRel)*dt;
VRel    = VRel +(rRel)*dt;
   
sol_mat_updated= [VEx;VAtthi;VAttlo;VEn;Vcytp;Vnucp;RC;RV;RCRdRp;RVRdRp;Cp;VnucPM1;VcytPM1;...
    RM1;RM2;RM3;RM4;RM5;RM6;RM7;RM8;PPB1;PPB2;PPA;PRdRp;PNP;PM1;PNEP;PHA;PNA;PM2;VRel];
end