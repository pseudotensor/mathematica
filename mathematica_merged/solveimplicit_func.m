(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* see also solveimplicit_superwrapper.nb *)


AutoGeneratedPackage->Button[Automatic, Inherited, BaseStyle -> "Link", ButtonData -> "paclet:ref/Automatic"]


InitializationCell->True


dosolveimplicitwrapper:=Module[
{foo},
(*filin=ToString[$ScriptCommandLine[[1]]];*)
(*filein="/data/jon/harmgit/longdoubleversion/runtt/test.txt";*)
filein=StringJoin[Directory[],"/","fails.txt"];
(*OpenRead[filein];*)
(*allfailsin=Import[filein,"Table"];*)
(*filein=StringJoin["/data/jon/harmgit/longdoubleversion/runo","/","fails.txt"];*)
str=OpenRead[filein];
numfails=2;
COUNTFINDROOT=1;
numele=134;
doradonly=0;
Clear[j];
For[j=1,j<=numfails,j++,
Clear[mylist];
mylist=0*Range[1,numele];
Clear[i];
For[i=1,i<=numele,i++,mylist[[i]]=Read[str,Number];];
(*Print["mylist=",Dimensions[mylist]," ",mylist];*)
dosolveimplicitone[j,mylist];
Print["Done=",j];
];
Close[str];
];


dosolveimplicitone[j0_,mylist0_]:=Module[
{myj=j0,mylist=mylist0},
(*filin=ToString[$ScriptCommandLine[[1]]];*)
(*filein="/data/jon/harmgit/longdoubleversion/runtt/test.txt";*)
(*filein=StringJoin[Directory[],"/","test.txt"];*)

(*Print["inside mylist=",Dimensions[mylist]," ",mylist];*)
{failtype,myid,failnum,gotfirstnofail,dt,gn11,gn12,gn13,gn14,gn21,gn22,gn23,gn24,gn31,gn32,gn33,gn34,gn41,gn42,gn43,gn44,gv11,gv12,gv13,gv14,gv21,gv22,gv23,gv24,gv31,gv32,gv33,gv34,gv41,gv42,gv43,gv44,pinuse0,pin0,uu00,uu0,uui0,pinuse1,pin1,uu01,uu1,uui1,pinuse2,pin2,uu02,uu2,uui2,pinuse3,pin3,uu03,uu3,uui3,pinuse4,pin4,uu04,uu4,uui4,pinuse5,pin5,uu05,uu5,uui5,pinuse6,pin6,uu06,uu6,uui6,pinuse7,pin7,uu07,uu7,uui7,pinuse8,pin8,uu08,uu8,uui8,pinuse9,pin9,uu09,uu9,uui9,pinuse10,pin10,uu010,uu10,uui10,pinuse11,pin11,uu011,uu11,uui11,pinuse12,pin12,uu012,uu12,uui12,uradcon0,uradcov0,uradcon1,uradcov1,uradcon2,uradcov2,uradcon3,uradcov3,ucon0,ucov0,ucon1,ucov1,ucon2,ucov2,ucon3,ucov3,uradconi0,uradcovi0,uradconi1,uradcovi1,uradconi2,uradcovi2,uradconi3,uradcovi3,uconi0,ucovi0,uconi1,ucovi1,uconi2,ucovi2,uconi3,ucovi3}=mylist;
(*Import[filein,"Table"][[1]];*)

rho0=N[uu00,20];
rhouu0i=N[uui0,20];
Tud0=N[{uu01,uu02,uu03,uu04},20];
Rud0=N[{uu08,uu09,uu010,uu011},20];
Tudi=N[{uui1,uui2,uui3,uui4},20];
Rudi=N[{uui8,uui9,uui10,uui11},20];
rhoi=N[pinuse0,20];
ui=N[pinuse1,20];
rhoii=N[pin0,20];
uii=N[pin1,20];
uu1i=N[ucon1,20];
uu2i=N[ucon2,20];
uu3i=N[ucon3,20];
uu1ii=N[uconi1,20];
uu2ii=N[uconi2,20];
uu3ii=N[uconi3,20];
Eri=N[pinuse8,20];
Erii=N[pin8,20];
uru1i=N[uradcon1,20];
uru2i=N[uradcon2,20];
uru3i=N[uradcon3,20];
uru1ii=N[uradconi1,20];
uru2ii=N[uradconi2,20];
uru3ii=N[uradconi3,20];

Bcon1=N[pin5,20];
Bcon2=N[pin6,20];
Bcon3=N[pin7,20];


Clear[uu1,uu2,uu3,uru1,uru2,uru3];
(* pinuse that gives uu?i and uru?i can be way off if failure from harm*)
constspinuse={rho->rhoi,u->ui,uu1->uu1i,uu2->uu2i,uu3->uu3i,Er->Eri,uru1->uru1i,uru2->uru2i,uru3->uru3i,whichuconi0->N[ucon0,20],whichuradconi0->N[uradcon0,20]};
ICpinuse={{rho,rhoi},{u,ui},{uu1,uu1i},{uu2,uu2i},{uu3,uu3i},{Er,Eri},{uru1,uru1i},{uru2,uru2i},{uru3,uru3i}};
constspin={rho->rhoii,u->uii,uu1->uu1ii,uu2->uu2ii,uu3->uu3ii,Er->Erii,uru1->uru1ii,uru2->uru2ii,uru3->uru3ii,whichuconi0->N[uconi0,20],whichuradconi0->N[uradconi0,20]};
ICpin={{rho,rhoii},{u,uii},{uu1,uu1ii},{uu2,uu2ii},{uu3,uu3ii},{Er,Erii},{uru1,uru1ii},{uru2,uru2ii},{uru3,uru3ii}};
ICpinrad={{Er,Erii},{uru1,uru1ii},{uru2,uru2ii},{uru3,uru3ii}};
ICpintest={{rho,0.81294331641668613088},{u,-0.39623582536829021164},{uu1,0.0059983053605683365108},{uu2,-6.050321005028674004*10^(-05)},{uu3,0.0016122825983277623461},{Er,8.4180452807836352799},{uru1,1.8487475475809896162*10^(-07)},{uru2,3.0057769907110685415*10^(-07)},{uru3,0.0020962681965309745859}};
constspintest={rho->0.81294331641668613088,u->-0.39623582536829021164,uu1->0.0059983053605683365108,uu2->-6.050321005028674004*10^(-05),uu3->0.0016122825983277623461,Er->8.4180452807836352799,uru1->1.8487475475809896162*10^(-07),uru2->3.0057769907110685415*10^(-07),uru3->0.0020962681965309745859};
If[0==1,
consts=constspinuse;
IC=ICpinuse;
,
consts=constspin;
IC=ICpin;
];

gcon=SetPrecision[{{gn11,gn12,gn13,gn14},{gn12,gn22,gn23,gn24},{gn13,gn23,gn33,gn34},{gn14,gn24,gn34,gn44}},20];
gcov=FullSimplify[Inverse[gcon]];

Clear[uu0,uu1,uu2,uu3];
ucon={uu0,uu1,uu2,uu3};
ucov=ucon.gcov;
soluu0=Solve[ucon.ucov==-1,uu0];
soluu0a=soluu0[[1,1,2]];
soluu0b=soluu0[[2,1,2]];
vala=soluu0a//.constspin;
valb=soluu0b//.constspin;
testucon0= whichuconi0//.constspin;
If[Abs[vala -testucon0]<Abs[valb- uconi0],uu0=soluu0a,uu0=soluu0b];
Print["uconi0=",uconi0," uu0=",uu0//.constspin," soluu0a=",soluu0a//.constspin," soluu0b=",soluu0b//.constspin];

Clear[uru0,uru1,uru2,uru3];
uradcon={uru0,uru1,uru2,uru3};
uradcov=uradcon.gcov;
soluru0=Solve[uradcon.uradcov==-1,uru0];
soluru0a=soluru0[[1,1,2]];
soluru0b=soluru0[[2,1,2]];
valra=soluru0a//.constspin;
valrb=soluru0b//.constspin;
testuradcon0= whichuradconi0//.constspin;
If[Abs[valra -testuradcon0]<Abs[valrb - uradconi0],uru0=soluru0a,uru0=soluru0b];
Print["uradconi0=",uradconi0," uru0=",uru0//.constspin," soluru0a=",soluru0a//.constspin," soluru0b=",soluru0b//.constspin];

Bcon={0,Bcon1,Bcon2,Bcon3};
udotB=Sum[ucov[[ii]]*Bcon[[ii]],{ii,1,4}];
bcon=(1/ucon[[1]])*Table[Bcon[[ii]]+udotB*ucon[[ii]],{ii,1,4}];
bcov=bcon.gcov;
bsq=bcon.bcov;
Pb=bsq/2;

arad=118316261947818976;
gam=4/3;
P=(gam-1)*u;
T=P/rho;
B=arad*T^4/(4*Pi);
KAPPAES=1;
KAPPA=1;
KAPPAESCODE=590799;
KAPPAFFCODE=3.46764*10^(-17);
kappa=rho*KAPPA*KAPPAFFCODE*rho*T^(-7/2);
kappaes=rho*KAPPAES*KAPPAESCODE;
(*
kappa=rho*KAPPAESCODE/10^(14)*1;
*)
lambda=kappa*4*Pi*B;
chi=kappa+kappaes;

rhou=Table[rho*ucon[[ii]],{ii,1,4}];
(* rho*ucon[[ii]]*KroneckerDelta[jj,1]*KroneckerDelta[ii,1]+*)
Tud=Table[rho*ucon[[ii]]*KroneckerDelta[jj,1]*KroneckerDelta[ii,1]+(rho+u+P+bsq)*ucon[[ii]]*ucov[[jj]]+KroneckerDelta[ii,jj]*(P+Pb)-bcon[[ii]]*bcov[[jj]],{ii,1,4},{jj,1,4}];
Rud=Table[(4/3)*Er*uradcon[[ii]]*uradcov[[jj]]+KroneckerDelta[ii,jj]*(Er/3),{ii,1,4},{jj,1,4}];

Ruu=Sum[Rud[[ii,jj]]*ucov[[ii]]*ucon[[jj]],{ii,1,4},{jj,1,4}];
Ru=Table[Sum[Rud[[ii,jj]]*ucon[[jj]],{jj,1,4}],{ii,1,4}];
Gu=Table[-(kappa*Ru[[ii]]+lambda*ucon[[ii]])-kappaes*(Ru[[ii]]+Ruu*ucon[[ii]]),{ii,1,4}];
Gd=Table[Sum[Gu[[ii]]*gcov[[ii,jj]],{ii,1,4}],{jj,1,4}];

he=(rho+u+P)/rho;
alpha=Sqrt[-1/gcon[[1,1]]];
DD=alpha*rhou[[1]];
etacov={-alpha,0,0,0};
gamma=-etacov.ucon;
W=DD*he*gamma;
Wp=W-DD;

Print["ucon=",ucon//.consts];
Print["uradcon=",uradcon//.consts];

(* Just Ui only *)
If[doradonly==0,
dtcold=0;
ferr0=rhou[[1]]-rhouu0i;
ferr1=Table[(Rud[[1,ii]]-Rudi[[ii]])+dtcold*Gd[[ii]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tudi[[ii]])-dtcold*Gd[[ii]],{ii,1,4}];
chooseresult=constspin;
(*chooseresult=constspintest;*)
Print["Aresult=",chooseresult];
ferr0=ferr0/rho//.chooseresult;
ferr1=(ferr1/Max[u,Er])//.chooseresult;
ferr2=(ferr2/Max[u,Er])//.chooseresult;
ferrtotal=Join[{ferr0},ferr1,ferr2];
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["Aferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-6) && ferrabs>10^6*ferrabsim,resulttype="Good",resulttype="Bad"];
(* Using 10^(-6) because apparently harm doesn't have inversion solution any more accurate than this even for ldouble *)
cc=0;
Print["A",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
Print["AUU ",rhou[[1]]//.chooseresult, " ",Rud[[1]]//.chooseresult," ",Tud[[1]]//.chooseresult];
Print["W and W' ",W//.chooseresult," ",Wp//.chooseresult];
];
If[doradonly==1,
ferr1=Table[(Rud[[1,ii]]-Rudi[[ii]]),{ii,1,4}];
chooseresult=constspin;
(*chooseresult=constspintest;*)
Print["ARADresult=",chooseresult];
ferr1=(ferr1/Max[Er,Er])//.chooseresult;
ferrtotal=ferr1;
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["ARADferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-6) && ferrabs>10^6*ferrabsim,resulttype="Good",resulttype="Bad"];
(* Using 10^(-6) because apparently harm doesn't have inversion solution any more accurate than this even for ldouble *)
cc=0;
Print["ARAD",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
Print["ARADUU ",Rud[[1]]//.chooseresult];
];

(* normal *)
If[doradonly==0,
ferr0=rhou[[1]]-rho0;
(*dt=0*)
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dt*Gd[[ii]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dt*Gd[[ii]],{ii,1,4}];
Print["0FindRoot"];
(*DampingFactor->2,*)
If[COUNTFINDROOT==1,
resultorig=Block[{cc=0},{FindRoot[{ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[2]]==0,ferr2[[3]]==0,ferr2[[4]]==0},ICpin,WorkingPrecision->18,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>cc++],cc}];result=resultorig[[1]];cc=resultorig[[2]];
,
resultorig=FindRoot[{ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[2]]==0,ferr2[[3]]==0,ferr2[[4]]==0},ICpin,WorkingPrecision->18,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>Print["Step to:",rho," ",u," ",uu1," ",uu2," ",uu3," ",Er," ",uru1," ",uru2," ",uru3]];result=resultorig;
];
chooseresult=result;
Print["0result=",chooseresult];
ferr0=ferr0/Abs[rho]//.chooseresult;
ferr1=(ferr1/Max[Abs[Er//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferr2=(ferr2/Max[Abs[Er//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferrtotal=Join[{ferr0},ferr1,ferr2];
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["0ferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-8) && ferrabs>10^8*ferrabsim,resulttype="Good",resulttype="Bad"];
Print["0",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
Print["W and W' ",W//.chooseresult," ",Wp//.chooseresult];
Print["DD",DD//.chooseresult];
Print["UU ",rhou[[1]]//.chooseresult, " ",Rud[[1]]//.chooseresult," ",Tud[[1]]//.chooseresult];
Print["dt*Gd=",dt*Gd//.chooseresult];
Print["term0=",(rho)*ucon[[1]]//.chooseresult];
Print["term1=",(rho+u+P+bsq)*ucon[[1]]*ucov[[1]]//.chooseresult];
Print["term1a=",(rho+u+P+bsq)//.chooseresult];
Print["term1b=",ucon[[1]]//.chooseresult];
Print["term1c=",ucov[[1]]//.chooseresult];
Print["term2=",(P+bsq/2)//.chooseresult];
Print["term2a=",P//.chooseresult];
Print["term2b=",(bsq/2)//.chooseresult];
Print["term3=",-bcon[[1]]*bcov[[1]]//.chooseresult];
Print["uu0=",uu0//.chooseresult," uru0=",uru0//.chooseresult];
];

(* normal radiation only *)
If[doradonly==1,
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]]),{ii,1,4}];
Print["0RADFindRoot"];
(*DampingFactor->2,*)
If[COUNTFINDROOT==1,
resultorig=Block[{cc=0},{FindRoot[{ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0},ICpinrad,WorkingPrecision->18,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>cc++],cc}];result=resultorig[[1]];cc=resultorig[[2]];
,
resultorig=FindRoot[{ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0},ICpinrad,WorkingPrecision->40,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>Print["Step to: ",Er," ",uru1," ",uru2," ",uru3]];result=resultorig;
];
chooseresult=result;
Print["0RADresult=",chooseresult];
ferr1=(ferr1/Max[Abs[Er//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferrtotal=ferr1;
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["0RADferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-8) && ferrabs>10^8*ferrabsim,resulttype="Good",resulttype="Bad"];
Print["0RAD",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
Print["UU ",Rud[[1]]//.chooseresult];
];


(* normal but more working precision to test if matters *)
If[resulttype=="Bad" &&doradonly==0,
ferr0=rhou[[1]]-rho0;
ferr0norm=10^(-300)+Abs[rhou[[1]]]+Abs[rho0];
(*dt=0*)
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dt*Gd[[ii]],{ii,1,4}];
ferr1norm=10^(-300)+Table[(Abs[Rud[[1,ii]]]+Abs[Rud0[[ii]]])+Abs[dt*Gd[[ii]]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dt*Gd[[ii]],{ii,1,4}];
ferr2norm=10^(-300)+Table[(Abs[Tud[[1,ii]]]+Abs[Tud0[[ii]]])+Abs[dt*Gd[[ii]]],{ii,1,4}];
(*ferr0=ferr0/ferr0norm;
ferr1=ferr1/ferr1norm;
ferr2=ferr2/ferr2norm;
*)
Print["0WFindRoot"];
resultorig=Block[{cc=0},{FindRoot[{ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[2]]==0,ferr2[[3]]==0,ferr2[[4]]==0},ICpin,WorkingPrecision->60,MaxIterations->1000,AccuracyGoal->30,PrecisionGoal->30, StepMonitor:>cc++],cc}];
(*DampingFactor->2,*)
result=resultorig[[1]];cc=resultorig[[2]];
chooseresult=result;
Print["0Wresult=",chooseresult];
(*ferr0=ferr0/Abs[rho]//.chooseresult;
ferr1=(ferr1/Max[Abs[Er//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferr2=(ferr2/Max[Abs[Er//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
*)
ferr0=ferr0/ferr0norm//.chooseresult;
ferr1=ferr1/ferr1norm//.chooseresult;
ferr2=ferr2/ferr2norm//.chooseresult;

(*
ferr0=ferr0//.chooseresult;
ferr1=ferr1//.chooseresult;
ferr2=ferr2//.chooseresult;
*)
ferrtotal=Join[{ferr0},ferr1,ferr2];
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["0Wferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-8) && ferrabs>10^8*ferrabsim,resulttype="Good",resulttype="Bad"];
Print["0W",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
];

(* normal but revert to gammamax if still can't find solution *)
If[resulttype=="Bad" && doradonly==0,
ferr0=rhou[[1]]-rho0;
(*dt=0*)
alphasq=1/-N[gcon[[1,1]],20];
gammarelmax=1000;
gammamax=gammarelmax/alphasq;
mysolsuru1=Solve[uru0==gammamax,uru1];
Print["GOD: ",mysolsuru1//.consts];
choosesolsuru1=mysolsuru1[[2,1,2]];
mysolsuru1;
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dt*Gd[[ii]],{ii,1,4}];
(* replace equation for uru1 *)
ferr1[[1]]=choosesolsuru1-uru1;
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dt*Gd[[ii]],{ii,1,4}];
Print["0MFindRoot"];
resultorig=Block[{cc=0},{FindRoot[{ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[2]]==0,ferr2[[3]]==0,ferr2[[4]]==0},ICpin,WorkingPrecision->60,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>cc++],cc}];
(*DampingFactor->2,*)
result=resultorig[[1]];cc=resultorig[[2]];
chooseresult=result;
Print["0Mresult=",chooseresult];
ferr0=ferr0/Abs[rho]//.chooseresult;
ferr1=(ferr1/Max[Abs[u//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferr2=(ferr2/Max[Abs[u//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferrtotal=Join[{ferr0},ferr1,ferr2];
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["0Mferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-8) && ferrabs>10^8*ferrabsim,resulttype="Good",resulttype="Bad"];
Print["0M",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
];

If[resulttype=="Bad" && doradonly==1,
alphasq=1/-N[gcon[[1,1]],20];
gammarelmax=1000;
gammamax=gammarelmax/alphasq;
mysolsuru1=Solve[uru0==gammamax,uru1];
Print["GODRAD: ",mysolsuru1//.consts];
choosesolsuru1=mysolsuru1[[2,1,2]];
mysolsuru1;
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]]),{ii,1,4}];
(* replace equation for uru1 *)
ferr1[[1]]=choosesolsuru1-uru1;
Print["0MRADFindRoot"];
resultorig=Block[{cc=0},{FindRoot[{ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0},ICpinrad,WorkingPrecision->60,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>cc++],cc}];
(*DampingFactor->2,*)
result=resultorig[[1]];cc=resultorig[[2]];
chooseresult=result;
Print["0MRADresult=",chooseresult];
ferr1=(ferr1/Max[Abs[Er//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferrtotal=ferr1;
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["0MRADferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-8) && ferrabs>10^8*ferrabsim,resulttype="Good",resulttype="Bad"];
Print["0MRAD",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
];



(* Just Ui *)
If[doradonly==0,
dtcold=0;
ferr0=rhou[[1]]-rhouu0i;
ferr1=Table[(Rud[[1,ii]]-Rudi[[ii]])+dtcold*Gd[[ii]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tudi[[ii]])-dtcold*Gd[[ii]],{ii,1,4}];
eqns={ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[2]]==0,ferr2[[3]]==0,ferr2[[4]]==0};
Print["1FindRoot"];
(*myIC=ICpintest;*)
 myIC=ICpin; 
resultorig=Block[{cc=0},{FindRoot[eqns,myIC,WorkingPrecision->18,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>cc++],cc}];
result=resultorig[[1]];cc=resultorig[[2]];
chooseresult=result;
Print["1result=",chooseresult];
ferr0=ferr0/Abs[rho]//.chooseresult;
ferr1=(ferr1/Max[Abs[u//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferr2=(ferr2/Max[Abs[u//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferrtotal=Join[{ferr0},ferr1,ferr2];
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["1ferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-8) && ferrabs>10^8*ferrabsim,resulttype="Good",resulttype="Bad"];
Print["1",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
Print["1UU ",rhou[[1]]//.chooseresult, " ",Rud[[1]]//.chooseresult," ",Tud[[1]]//.chooseresult];

(* Just UU0 *)
dtcold=0;
ferr0=rhou[[1]]-rho0;
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dtcold*Gd[[ii]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dtcold*Gd[[ii]],{ii,1,4}];
eqns={ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[2]]==0,ferr2[[3]]==0,ferr2[[4]]==0};
Print["2FindRoot"];
resultorig=Block[{cc=0},{FindRoot[eqns,ICpin,WorkingPrecision->18,MaxIterations->1000,AccuracyGoal->14,PrecisionGoal->14, StepMonitor:>cc++],cc}];
result=resultorig[[1]];cc=resultorig[[2]];
chooseresult=result;
Print["2result=",chooseresult];
ferr0=ferr0/Abs[rho]//.chooseresult;
ferr1=(ferr1/Max[Abs[u//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferr2=(ferr2/Max[Abs[u//.chooseresult],Abs[Er//.chooseresult]])//.chooseresult;
ferrtotal=Join[{ferr0},ferr1,ferr2];
ferrabs=Sqrt[Re[ferrtotal].Re[ferrtotal]];
ferrabsim=Sqrt[Im[ferrtotal].Im[ferrtotal]];
Print["2ferr=",ferrtotal,"ferrabs=",ferrabs,"ferrabsim=",ferrabsim];
If[ferrabs==0 || ferrabs<10^(-8) && ferrabs>10^8*ferrabsim,resulttype="Good",resulttype="Bad"];
Print["2",resulttype," ",CForm[ferrabs]," ",myj," ",failtype," ",myid," ",failnum, " cc=",cc];
Print["2UU ",rhou[[1]]//.chooseresult, " ",Rud[[1]]//.chooseresult," ",Tud[[1]]//.chooseresult];
];

(* OTHERS *)
If[0,
(* no-evolve M1 *)
dtcold=0;
ferr0=rhou[[1]]-rho0;
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dtcold*Gd[[ii]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dtcold*Gd[[ii]],{ii,1,4}];
eqns={ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[2]]==0,ferr2[[3]]==0,ferr2[[4]]==0};
Print["2FindRoot"];
result=FindRoot[eqns,{{rho,rhoi},{u,ui},{uu1,uu1i},{uu2,uu2i},{uu3,uu3i},{Er,Eri},{uru1,uru1i},{uru2,uru2i},{uru3,uru3i}},WorkingPrecision->40,MaxIterations->10000,AccuracyGoal->14,PrecisionGoal->14];
Print["2result=",result];
Print["2ferr0=",(ferr0/rhoi)//.result];
Print["2ferr1=",(ferr1/Max[ui,Eri])//.result];
Print["2ferr2=",(ferr2/Max[ui,Eri])//.result];


(* COLD M1 *)
ferr0=rhou[[1]]-rho0;
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dtcold*Gd[[ii]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dtcold*Gd[[ii]],{ii,1,4}];
eqns={ferr0==0,ferr1[[1]]==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[3]]==0,ferr2[[4]]==0}//.{u->0};
Print["2FindRoot"];
result=FindRoot[eqns,{{rho,rhoi},{uu1,uu1i},{uu2,uu2i},{uu3,uu3i},{Er,Eri},{uru1,uru1i},{uru2,uru2i},{uru3,uru3i}},WorkingPrecision->40,MaxIterations->10000,AccuracyGoal->20,PrecisionGoal->20];
Print["2result=",result];
Print["2ferr0=",(ferr0/rhoi)//.result];
Print["2ferr1=",(ferr1/Max[ui,Eri])//.result];
Print["2ferr2=",(ferr2/Max[ui,Eri])//.result];

(* COLD COLD M1 *)
dtcold=0;
ferr0=rhou[[1]]-rho0;
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dtcold*Gd[[ii]],{ii,1,4}];
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dtcold*Gd[[ii]],{ii,1,4}];
eqns={ferr0==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[3]]==0,ferr2[[4]]==0}//.{u->0,Er->10^(-10)};
Print["3FindRoot"];
result=FindRoot[eqns,{{rho,rhoi},{uu1,uu1i},{uu2,uu2i},{uu3,uu3i},{uru1,uru1i},{uru2,uru2i},{uru3,uru3i}},WorkingPrecision->40,MaxIterations->10000,AccuracyGoal->20,PrecisionGoal->20];
Print["3result=",result];
Print["3ferr0=",(ferr0/rhoi)//.result];
Print["3ferr1=",(ferr1/Max[ui,Eri])//.result];
Print["3ferr2=",(ferr2/Max[ui,Eri])//.result];

(* COLD COLD  LIKE CODE M1*)
gammamax=1000;
mysolsuru1=Solve[uru0==gammamax,uru1];
mysolsuru1//.consts;
choosesolsuru1=mysolsuru1[[2,1,2]];
mysolsuru1;
ferr0=rhou[[1]]-rho0;
ferr1=Table[(Rud[[1,ii]]-Rud0[[ii]])+dtcold*Gd[[ii]],{ii,1,4}];
ferr1[[1]]=choosesolsuru1==uru1;
ferr2=Table[(Tud[[1,ii]]-Tud0[[ii]])-dtcold*Gd[[ii]],{ii,1,4}];
eqns={ferr0==0,ferr1[[2]]==0,ferr1[[3]]==0,ferr1[[4]]==0,ferr2[[1]]==0,ferr2[[3]]==0,ferr2[[4]]==0}//.{u->0,Er->10^(-10)};
Print["4FindRoot"];
result=FindRoot[eqns,{{rho,rhoi},{uu1,uu1i},{uu2,uu2i},{uu3,uu3i},{uru1,uru1i},{uru2,uru2i},{uru3,uru3i}},WorkingPrecision->40,MaxIterations->10000,AccuracyGoal->20,PrecisionGoal->20];
Print["4result=",result];
Print["4ferr0=",(ferr0/rhoi)//.result];
Print["4ferr1=",(ferr1/Max[ui,Eri])//.result];
Print["4ferr2=",(ferr2/Max[ui,Eri])//.result];
];
];













