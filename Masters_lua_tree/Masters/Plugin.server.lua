
local Km,Jf=Nb['game']['GetService'](Nb['game'],'RunService'),
{
  ['Build']=102,['BypassId']='',['SpecialId']=''
}
if not(Km['IsEdit'](Km))then else if not(Nb['game']['PlaceId']==0)then else local G=Nb['script']['Parent']['Prepublish']['Clone'](Nb['script']['Parent']['Prepublish']);;
G['Parent']=Nb['game']['CoreGui'];;
G['Frame']['Collapse']['MouseButton1Click']['Connect'](G['Frame']['Collapse']['MouseButton1Click'],function()G['Destroy'](G)end)return end Nb['warn']('Masters is initiating...')local xp,_h,Bf=Nb['game']['GetService'](Nb['game'],'GroupService'),Nb['game']['GetService'](Nb['game'],'HttpService'),
{
  ['ApiUrl']='https://whitelist.parcelroblox.com/v1/check',['HubID']='66f85dbac3f0524c26ef088b',['ProductID']='x743uojc6edrsk0yysioxn2gdqgw'
}
local function Mn()local sk,vf,ql,Ki,S,Rm,wa,Sg,wo,jl;;
Rm,ql=function(gl,bn,Nc)ql[gl]=ih(Nc,49241)-ih(bn,19640)return ql[gl]end,
{
}
;;
jl=ql[18960]or Rm(18960,14611,98510)repeat if jl>27025 then if jl<=47425 then if(sk>=0 and vf>Ki)or((sk<0 or sk~=sk)and vf<Ki)then jl=ql[4355]or Rm(4355,16399,41487)else jl=19381 end else wo,wa='Masters_'..Nb['game']['GameId']..'_'..Nb['game']['CreatorId']..'_'..Nb['os']['time'](),
{
}
;;
jl,Ki,sk,vf=ql[-28681]or Rm(-28681,19122,44994),(#wo)+152,1,153 end elseif jl>=21919 then if jl<=21919 then return Nb['table']['concat'](wa)else Sg=vf if Ki~=Ki then jl=21919 else jl=47425 end end elseif jl>6551 then S=Nb['string']['byte'](wo,(Sg-152));;
Nb['table']['insert'](wa,Nb['string']['char'](S+7));;
jl=ql[-18994]or Rm(-18994,983,43359)else vf=vf+sk;;
Sg=vf if vf~=vf then jl=ql[18533]or Rm(18533,60700,14106)else jl=47425 end end until jl==31983 end local function s_(tn,Xo)local lm,Wp,ch,ko,gq,Fj,qm,Ob,sp;;
Ob,lm=function(m,mn,oh)lm[mn]=ih(oh,63620)-ih(m,16776)return lm[mn]end,
{
}
;;
Wp=lm[26760]or Ob(21551,26760,20582)while Wp~=28431 do if Wp>37691 then if Wp<64823 then if Wp<=56458 then Fj=Nb['table']['concat'](sp)if not(Xo)then Wp=lm[864]or Ob(42513,864,72788)continue else Wp=lm[-21608]or Ob(36399,-21608,124501)continue end Wp=2762 else Fj=Fj+ko;;
gq=Fj if Fj~=Fj then Wp=lm[-22383]or Ob(38250,-22383,84456)else Wp=21905 end end elseif Wp<=64823 then ch=Nb['string']['split'](Fj,'_')return
{
  ['Product']=ch[1],['GameId']=Nb['tonumber'](ch[2]),['CreatorId']=Nb['tonumber'](ch[3]),['Timestamp']=Nb['tonumber'](ch[4])
}
else gq=Fj if ch~=ch then Wp=56458 else Wp=21905 end end elseif Wp<20266 then if Wp>2762 then qm=Nb['string']['byte'](tn,(gq-164));;
Nb['table']['insert'](sp,Nb['string']['char'](qm-7));;
Wp=lm[-1617]or Ob(42661,-1617,81915)else Wp=lm[10856]or Ob(29203,10856,23086)continue end elseif Wp>21905 then sp=
{
}
;;
ch,Wp,ko,Fj=(#tn)+164,lm[-23170]or Ob(65149,-23170,83910),1,165 elseif Wp>20266 then if(ko>=0 and Fj>ch)or((ko<0 or ko~=ko)and Fj<ch)then Wp=lm[15283]or Ob(58908,15283,97434)else Wp=lm[-3888]or Ob(33113,-3888,2010)end else ch=Nb['string']['split'](Fj,Xo)return ch end end end local function td()local me;;
me=Mn();;
Nb['workspace']['SetAttribute'](Nb['workspace'],'Masters',me)end local function jn()local Ih,Ck,Qk,gh,ri;;
Ih,Ck=function(kf,Nk,lq)Ck[Nk]=ih(lq,16071)-ih(kf,29724)return Ck[Nk]end,
{
}
;;
ri=Ck[-26188]or Ih(6187,-26188,40217)repeat if ri>=24823 then if ri>38373 then ri=Ck[-1659]or Ih(4385,-1659,96338)continue elseif ri>24823 then if Nb['game']['GameId']==Qk['GameId']and Nb['game']['CreatorId']==Qk['CreatorId']and Nb['workspace']['GetAttribute'](Nb['workspace'],'Masters')==gh and(Nb['os']['time']()-Qk['Timestamp']<259200)and Qk['Product']=='Masters'then ri=Ck[29232]or Ih(393,29232,59467)continue else ri=Ck[-6330]or Ih(61844,-6330,43995)continue end ri=Ck[-22967]or Ih(1453,-22967,90115)else return true end elseif ri>=12480 then if ri<=12480 then return else gh=Mn();;
Qk=s_(gh)if not(Qk)then ri=Ck[436]or Ih(61689,436,35682)continue else ri=Ck[18331]or Ih(39502,18331,113392)continue end ri=Ck[-2176]or Ih(9144,-2176,96880)end else return end until ri==57688 end local function Ta()Nb['workspace']['SetAttribute'](Nb['workspace'],'Masters',nil)end local function Jh()local _f,wp,eo,zc;;
eo,zc=
{
}
,function(jc,Rb,Fn)eo[Fn]=ih(jc,39782)-ih(Rb,23696)return eo[Fn]end;;
wp=eo[-27646]or zc(27308,670,-27646)while wp~=23467 do if wp>37820 then return Nb['game']['CreatorId']elseif wp>31090 then if Nb['game']['CreatorType']==Nb['Enum']['CreatorType']['Group']then wp=eo[17018]or zc(104808,46209,17018)continue elseif not(Nb['game']['CreatorType']==Nb['Enum']['CreatorType']['User'])then wp=eo[-14166]or zc(108508,40920,-14166)continue else wp=eo[-30806]or zc(28086,21341,-30806)continue end wp=31090 elseif wp<=6653 then _f=xp['GetGroupInfoAsync'](xp,Nb['game']['CreatorId'])return _f['Owner']['Id']else wp=eo[15352]or zc(5071,28782,15352)continue end end end local function Cm()local db,pj,ea,Ao,tm,Tp,in_,Ie;;
db,Ao=
{
}
,function(yj,Vd,Xj)db[yj]=ih(Vd,40988)-ih(Xj,47394)return db[yj]end;;
in_=db[2220]or Ao(2220,63511,35066)repeat if in_>28052 then if in_>52877 then return false elseif in_<=50053 then if not ea['Success']then in_=db[-30526]or Ao(-30526,108387,33232)continue end in_=15344 else return false end elseif in_>=12612 then if in_<15344 then return elseif in_<=15344 then tm=_h['JSONDecode'](_h,ea['Body'])return tm['details']['owned']else Tp=Bf['ApiUrl']..'?hubID='.._h['UrlEncode'](_h,Bf['HubID'])..'&productID='.._h['UrlEncode'](_h,Bf['ProductID'])..'&robloxID='..Ie;;
pj,ea=Nb['pcall'](_h['RequestAsync'],_h,
{
  ['Url']=Tp
}
)if pj then in_=db[-18794]or Ao(-18794,129393,11466)continue else in_=db[-22694]or Ao(-22694,121591,6949)continue end in_=db[10993]or Ao(10993,65479,64868)end elseif in_<=7061 then in_=db[-21956]or Ao(-21956,6962,49603)continue else Ie=Jh()if not Ie then in_=db[-18408]or Ao(-18408,61611,42577)continue end in_=db[-1489]or Ao(-1489,1181,36815)end until in_==16973 end local function ae()local Zo,so,Gl,Qo,ee;;
ee,Qo=function(ta,ab,r_)Qo[r_]=ih(ta,47166)-ih(ab,14807)return Qo[r_]end,
{
}
;;
so=Qo[-30397]or ee(98624,25052,-30397)repeat if so>39415 then if so<=47602 then if so>42200 then Ta();;
Gl,Zo,so=Cm(),0,Qo[1493]or ee(105041,34588,1493)elseif so<=39710 then Ta();;
Nb['warn']('Masters: Failed to load. (Network or Ownership Failure)');;
so=Qo[-6760]or ee(6932,32759,-6760)else Zo=Zo+1;;
Nb['task']['wait']();;
so,Gl=Qo[-25864]or ee(63991,1600,-25864),Cm()end elseif so<=57715 then if not(jn())then so=Qo[8236]or ee(113746,29613,8236)continue else so=Qo[-6940]or ee(5527,7818,-6940)continue end so=8069 else Nb['warn']('Masters: Initiated Successfully');;
td();;
so=Qo[-1004]or ee(22108,43151,-1004)end elseif so<23818 then if so>=8069 then if so<=8069 then so=Qo[-24339]or ee(124662,49263,-24339)continue else if Gl then so=Qo[12190]or ee(124303,16511,12190)continue else so=Qo[-31567]or ee(107506,47481,-31567)continue end so=Qo[-26935]or ee(55518,14849,-26935)end else if Zo>=10 or Gl then so=Qo[31331]or ee(36223,15986,31331)else so=Qo[-29064]or ee(49683,12126,-29064)end end elseif so<34380 then if so>23818 then if not(Gl)then so=Qo[11141]or ee(81525,55460,11141)continue else so=Qo[7121]or ee(9381,15219,7121)continue end so=42200 else return Gl end elseif so>34380 then so=Qo[30968]or ee(15342,28643,30968)continue else Nb['warn']('Masters: Intiated Successfully')return true end until so==25872 end ae()local Fd,Wg,vm,b_,Do,ue,aj,_k,hi,V,pf,Im,xd,ce,Eh,ej,Xb=Nb['game']['GetService'](Nb['game'],'CoreGui'),Nb['game']['GetService'](Nb['game'],'DataStoreService'),Nb['game']['GetService'](Nb['game'],'UserInputService'),Nb['game']['GetService'](Nb['game'],'MarketplaceService'),Nb['game']['GetService'](Nb['game'],'TweenService'),Nb['game']['GetService'](Nb['game'],'Players'),Nb['game']['GetService'](Nb['game'],'ReplicatedStorage'),Nb['game']['GetService'](Nb['game'],'ServerScriptService'),Nb['TweenInfo']['new'](0.5,Nb['Enum']['EasingStyle']['Exponential']),Nb['TweenInfo']['new'](0.80000000000000004,Nb['Enum']['EasingStyle']['Exponential']),Nb['TweenInfo']['new'](0.29999999999999999,Nb['Enum']['EasingStyle']['Exponential']),Nb['TweenInfo']['new'](1,Nb['Enum']['EasingStyle']['Exponential']),Nb['TweenInfo']['new'](2,Nb['Enum']['EasingStyle']['Exponential']),Nb['TweenInfo']['new'](5,Nb['Enum']['EasingStyle']['Sine']),Nb['TweenInfo']['new'](1,Nb['Enum']['EasingStyle']['Linear'],Nb['Enum']['EasingDirection']['Out'],-1,false),Nb['TweenInfo']['new'](5,Nb['Enum']['EasingStyle']['Sine'],Nb['Enum']['EasingDirection']['InOut'],-1,true),Nb['script']['Parent']local Wh,se_,Zh=Xb['MainFile'],Xb['Modules'],Xb['Onboarding']local Ip,yk,n_,Fg,Xe,u_,If,jd=Zh['Interface']['Frame']['Pages'],Nb['require'](se_['Alerts']),Nb['require'](se_['ContextMenu']),Nb['require'](se_['DataManagement']),Nb['require'](se_['Sounds']),Nb['require'](se_['Utilities']),false,
{
  ['DataSheets']='AIzaSyAZkUG43dtTWV1L0kKZxyb_PeT9x5RlDsY',['RequestUrl']='https://sheets.googleapis.com/v4/spreadsheets/%s%s',['SpreadsheetId']='1iJRuAArdm2fSobb0R1T4pLdaEKyyseqSsRhpyD9D7cA'
}
;;
Nb['GetInSheets']=function(ip)local nh=('/values/%s?key=%s')['format'](('/values/%s?key=%s'),ip,jd['DataSheets'])local qc=Nb['string']['format'](jd['RequestUrl'],jd['SpreadsheetId'],nh)local Te,Lh,xq,Dn,Qh;;
Qh,Te=
{
}
,function(fa_,da,le)Qh[fa_]=ih(le,25950)-ih(da,8758)return Qh[fa_]end;;
Dn=Qh[-883]or Te(-883,41463,77869)repeat if Dn>=63423 then if Dn>63423 then Nb['warn']('Masters: Failed to get from database. ('..xq..')')return else return _h['JSONDecode'](_h,xq)end elseif Dn<=49903 then Dn=Qh[18811]or Te(18811,62905,123543)continue else Lh,xq=Nb['pcall'](function()return _h['GetAsync'](_h,qc)end)if not(Lh)then Dn=Qh[-32256]or Te(-32256,755,96947)continue else Dn=Qh[-31074]or Te(-31074,12557,94116)continue end Dn=Qh[-14482]or Te(-14482,64256,129403)end until Dn==45114 end local Gc=
{
  ['BaseUrl']='https://flare-studio.online/masters/counter.php',['SecretKey']='AEqJ4GPHxJuyKhDsOdfKnwkxlQgLTMGL'
}
local function Eb()local Vb,Hb,_p,ca,gk,sa;;
_p,gk=
{
}
,function(vj,cd,Na)_p[vj]=ih(Na,713)-ih(cd,39499)return _p[vj]end;;
sa=_p[29918]or gk(29918,64811,73287)while sa~=54358 do if sa<=50787 then if sa<46382 then Hb=_h['JSONDecode'](_h,ca)return Hb['downloads']elseif sa<=46382 then Vb,ca=Nb['pcall'](function()return _h['GetAsync'](_h,Gc['BaseUrl'])end)if Vb then sa=_p[-26843]or gk(-26843,29423,72808)continue else sa=_p[-2680]or gk(-2680,9754,100082)continue end sa=_p[29534]or gk(29534,7206,85529)else sa=_p[-21853]or gk(-21853,36962,56502)continue end else return end end end local function Ym()local bp=Gc['BaseUrl']..'?key='..Gc['SecretKey']local Vn,R,fj,Am,Xp,ln;;
Xp,ln=
{
}
,function(Fi,lf,cq)Xp[cq]=ih(lf,51210)-ih(Fi,48464)return Xp[cq]end;;
R=Xp[25752]or ln(2848,13710,25752)while R~=43360 do if R<54876 then if R>18196 then fj=_h['JSONDecode'](_h,Vn)return fj['downloads']else Am,Vn=Nb['pcall'](function()return _h['PostAsync'](_h,bp,'')end)if Am then R=Xp[-18299]or ln(25461,124895,-18299)continue else R=Xp[31983]or ln(53302,106142,31983)continue end R=54876 end elseif R>54876 then return else R=Xp[-26724]or ln(31945,107251,-26724)continue end end end local function Jg(Vj)local um=Gc['BaseUrl']..'?key='..Gc['SecretKey']..'&set='..Vj local Ai,Ea,Ub,gf,We,em;;
em,Ai=function(dp,c,Nl)Ai[c]=ih(dp,20174)-ih(Nl,7185)return Ai[c]end,
{
}
;;
We=Ai[-18928]or em(53955,-18928,14144)repeat if We>=59988 then if We>59988 then gf=_h['JSONDecode'](_h,Ea)return gf['downloads']else return end elseif We<=9211 then We=Ai[-14226]or em(55182,-14226,40122)continue else Ub,Ea=Nb['pcall'](function()return _h['PostAsync'](_h,um,'')end)if not(Ub)then We=Ai[26507]or em(74901,26507,39958)continue else We=Ai[15752]or em(68408,15752,22171)continue end We=9211 end until We==6293 end Nb['InstallMasters']=function()local af,Ce;;
Ce,af=Wh['Masters(Server)']['Clone'](Wh['Masters(Server)']),Wh['Masters(Storage)']['Clone'](Wh['Masters(Storage)']);;
Ce['Handlers']['Manager']['Enabled']=true;;
Ce['Parent']=_k;;
af['Parent']=aj;;
Ym()end;;
Nb['UninstallMasters']=function()local Cd,Jl,Kk,Mf;;
Kk,Cd=function(Mk,ei,Sk)Cd[ei]=ih(Mk,63571)-ih(Sk,47619)return Cd[ei]end,
{
}
;;
Jl=Cd[-10119]or Kk(18141,-10119,683)while Jl~=17028 do if Jl<8601 then Mf=Nb['IsMastersInstalled']()if not Mf then Jl=Cd[-7255]or Kk(130848,-7255,24537)continue end Jl=11919 elseif Jl>8601 then Mf['Server']['Destroy'](Mf['Server']);;
Mf['Replicated']['Destroy'](Mf['Replicated']);;
Jl=Cd[-19194]or Kk(121585,-19194,23069)continue else return end end end;;
Nb['UpdateMasters']=function()Nb['UninstallMasters']();;
Nb['InstallMasters']()end;;
Nb['SetScripts']=function(ph,Wl,im)local fm,rk,Pb,il,zd,tb,Dg,rg,Rc;;
zd,rg=function(Wi,yh,Mp)rg[yh]=ih(Wi,1694)-ih(Mp,12903)return rg[yh]end,
{
}
;;
tb=rg[-28414]or zd(56531,-28414,16423)repeat if tb<=39819 then if tb>26637 then if tb>=35435 then if tb>35435 then rk,Dg=fm(Pb,Rc);;
Rc=rk if Rc==nil then tb=rg[26196]or zd(130405,26196,53229)else tb=35435 end else if Dg['IsA'](Dg,'LocalScript')or Dg['IsA'](Dg,'Script')then tb=rg[27269]or zd(48246,27269,13773)continue end tb=rg[-25297]or zd(100646,-25297,50762)end else fm,Pb,Rc=ph['GetDescendants'](ph)if not(rd(fm)~='function')then tb=rg[4430]or zd(94922,4430,60078)continue else tb=rg[-31101]or zd(90113,-31101,63489)continue end tb=rg[-9349]or zd(98089,-9349,60491)end elseif tb>=12080 then if tb>12080 then if not ph then tb=rg[2804]or zd(80232,2804,19060)continue end tb=rg[21670]or zd(55558,21670,17461)else fm,Pb,Rc=of(fm);;
tb=rg[2784]or zd(95962,2784,59102)end elseif tb>2920 then fm,Pb,Rc=il['__iter'](fm);;
tb=rg[16674]or zd(41938,16674,15270)else if not Dg['HasTag'](Dg,im)then tb=rg[-22694]or zd(109592,-22694,56392)continue end tb=rg[-31028]or zd(73060,-31028,45576)end elseif tb<=48973 then if tb>=48215 then if tb<=48215 then Dg['Enabled'],tb=Wl,rg[10072]or zd(99416,10072,54620)else tb,Dg['Enabled']=rg[32284]or zd(43436,32284,8640),Wl end elseif tb>39993 then if im then tb=rg[23832]or zd(65530,23832,57243)continue else tb=rg[-2135]or zd(88148,-2135,44314)continue end tb=rg[-26589]or zd(70855,-26589,17577)else il=Xm(fm)if il~=nil and il['__iter']~=nil then tb=rg[18483]or zd(62119,18483,54331)continue elseif rd(fm)=='table'then tb=rg[29436]or zd(53920,29436,38761)continue end tb=rg[-13041]or zd(101317,-13041,50103)end elseif tb>51171 then tb=rg[-12299]or zd(17573,-12299,952)continue else return end until tb==4188 end;;
Nb['ResetScroll']=function(Sl)local Gd,ge,Zg,cf,Jk,xl,e_,hh,yc;;
Gd,ge=
{
}
,function(w_,zg,z)Gd[w_]=ih(zg,30936)-ih(z,18731)return Gd[w_]end;;
cf=Gd[-4562]or ge(-4562,86710,46069)while cf~=16643 do if cf<22964 then if cf>=7767 then if cf>=12176 then if cf<=12176 then if not Sl then cf=Gd[21616]or ge(21616,91487,35576)continue end cf=3454 else xl,hh,Jk=of(xl);;
cf=Gd[10699]or ge(10699,42830,8909)end else Zg=Xm(xl)if Zg~=nil and Zg['__iter']~=nil then cf=Gd[5916]or ge(5916,121019,65175)continue elseif rd(xl)=='table'then cf=Gd[-10779]or ge(-10779,86250,42972)continue end cf=Gd[8962]or ge(8962,87945,62090)end elseif cf<=3454 then xl,hh,Jk=Sl['GetDescendants'](Sl)if rd(xl)~='function'then cf=Gd[20969]or ge(20969,50176,55210)continue end cf=Gd[-25731]or ge(-25731,41703,12196)else yc['CanvasPosition'],cf=Nb['Vector2']['new'](0,0),Gd[653]or ge(653,59190,25877)end elseif cf>=31751 then if cf<46077 then cf=Gd[3324]or ge(3324,7315,27235)continue elseif cf>46077 then xl,hh,Jk=Zg['__iter'](xl);;
cf=Gd[31585]or ge(31585,41843,11984)else if yc['IsA'](yc,'ScrollingFrame')then cf=Gd[-18646]or ge(-18646,96039,46081)continue end cf=Gd[13509]or ge(13509,56605,31550)end elseif cf>22964 then e_,yc=xl(hh,Jk);;
Jk=e_ if Jk==nil then cf=Gd[28446]or ge(28446,43511,7171)else cf=46077 end else return end end end;;
Nb['IsMastersInstalled']=function()local Rg,Cg,Zi,Cb,jg;;
Cb,Cg=
{
}
,function(mg,yi,xc)Cb[yi]=ih(xc,58806)-ih(mg,17217)return Cb[yi]end;;
jg=Cb[-6824]or Cg(43108,-6824,67026)repeat if jg>41494 then Zi,Rg=_k['FindFirstChild'](_k,'Masters(Server)'),aj['FindFirstChild'](aj,'Masters(Storage)')if Zi and Rg then jg=Cb[-710]or Cg(63088,-710,24571)continue else jg=Cb[5541]or Cg(47581,5541,96516)continue end jg=9682 elseif jg>9682 then return elseif jg<=1308 then return
{
  ['Server']=Zi,['Replicated']=Rg
}
else jg=Cb[-31045]or Cg(2136,-31045,115379)continue end until jg==56300 end;;
Nb['ConvertBoolean']=function(Pc)return(Pc=='Yes')end;;
Nb['AbbreviateNumber']=function(J)local oc,Dh,zk,g,bj,Le,Fc,Hn,Yb,v,Di,H,ij,Tb;;
v,Dh=function(Fb,T,tl)Dh[tl]=ih(Fb,61997)-ih(T,57826)return Dh[tl]end,
{
}
;;
ij=Dh[-6441]or v(48907,55065,-6441)while ij~=62672 do if ij>40800 then if ij>60799 then return Nb['string']['format']('%.1f%s',Di/bj,Yb)elseif ij>=50728 then if ij>50728 then return Nb['tostring'](Di)else Fc,Le=Nb['math']['abs'](Di),
{
  {
    1000000000000,'t'
  }
  ,
  {
    1000000000,'b'
  }
  ,
  {
    1000000,'m'
  }
  ,
  {
    1000,'k'
  }
}
;;
oc,zk,Hn=Le if rd(oc)~='function'then ij=Dh[-5084]or v(36319,37534,-5084)continue end ij=Dh[-17587]or v(28353,53507,-17587)end else oc,zk,Hn=of(oc);;
ij=Dh[24886]or v(129215,32613,24886)end elseif ij>27915 then if ij<=33264 then oc,zk,Hn=Tb['__iter'](oc);;
ij=Dh[-16952]or v(30842,65454,-16952)else bj,Yb=Nb['unpack'](g)if Fc>=bj then ij=Dh[8861]or v(85776,9157,8861)continue end ij=Dh[1928]or v(2606,27162,1928)end elseif ij>=27659 then if ij<=27659 then H,g=oc(zk,Hn);;
Hn=H if Hn==nil then ij=Dh[-1514]or v(3829,61115,-1514)else ij=Dh[797]or v(17855,63952,797)end else return end elseif ij<=3190 then Tb=Xm(oc)if Tb~=nil and Tb['__iter']~=nil then ij=Dh[23673]or v(130464,27775,23673)continue elseif rd(oc)=='table'then ij=Dh[-1695]or v(128967,45666,-1695)continue end ij=Dh[-9173]or v(118669,12407,-9173)else Di=Nb['tonumber'](J)if not(not Di)then ij=Dh[-17728]or v(114578,26229,-17728)continue else ij=Dh[-14481]or v(6094,39226,-14481)continue end ij=Dh[12767]or v(101428,22035,12767)end end end local Qf;;
Nb['SetPage']=function(ob,ld,Dp)local fg,Xi,Hk,Qd,Pa,B,Dj,Fh,dl,_c;;
B,Dj=
{
}
,function(_a,od,Ti)B[_a]=ih(Ti,22286)-ih(od,14569)return B[_a]end;;
Qd=B[-13756]or Dj(-13756,45202,49051)while Qd~=20799 do if Qd<30038 then if Qd<=21302 then if Qd<19432 then if Qd>2631 then return else Hk['Visible'],Qd=Hk==Xi,B[2784]or Dj(2784,51594,120987)end elseif Qd<20275 then if Nb['GetPage']()==Xi then Qd=B[32050]or Dj(32050,33468,45483)continue end Qd=38325 elseif Qd<=20275 then if not(Hk['HasTag'](Hk,'MastersOnboardingPage'))then Qd=B[17885]or Dj(17885,21071,90070)continue else Qd=B[6763]or Dj(6763,62832,33006)continue end Qd=B[14197]or Dj(14197,6902,38751)else if not(rd(dl)=='table')then Qd=B[-10884]or Dj(-10884,7615,38022)continue else Qd=B[-13720]or Dj(-13720,53219,78523)continue end Qd=B[18710]or Dj(18710,35156,71905)end elseif Qd>=26860 then if Qd<=26860 then Ip['padding']['PaddingTop']=Nb['UDim']['new'](1,0);;
Do['Create'](Do,Ip['padding'],hi,
{
  ['PaddingTop']=Nb['UDim']['new'](0,0)
}
)['Play'](Do['Create'](Do,Ip['padding'],hi,
{
  ['PaddingTop']=Nb['UDim']['new'](0,0)
}
));;
Qd=B[-10822]or Dj(-10822,36159,67528)else dl,fg,Fh=of(dl);;
Qd=B[14891]or Dj(14891,50472,118013)end else Xi=Ip['FindFirstChild'](Ip,ob)if not Xi then Qd=B[-23045]or Dj(-23045,58239,78470)continue end Qd=19432 end elseif Qd<=38325 then if Qd<32969 then if Qd<=30038 then dl,fg,Fh=_c['__iter'](dl);;
Qd=B[-17503]or Dj(-17503,54006,122719)else dl,fg,Fh=Ip['GetChildren'](Ip)if not(rd(dl)~='function')then Qd=B[-19973]or Dj(-19973,58242,77459)continue else Qd=B[11628]or Dj(11628,17401,44247)continue end Qd=B[-27504]or Dj(-27504,11455,58758)end elseif Qd<=35314 then if Qd>32969 then return else _c=Xm(dl)if not(_c~=nil and _c['__iter']~=nil)then Qd=B[-8276]or Dj(-8276,39288,41929)continue else Qd=B[-24105]or Dj(-24105,64841,93688)continue end Qd=B[8129]or Dj(8129,57119,119078)end else Qf=Nb['GetPage']()if not Dp then Qd=B[-2238]or Dj(-2238,47839,75692)continue end Qd=B[-11356]or Dj(-11356,25682,36460)end elseif Qd>=60214 then if Qd<=60214 then if not(not ld)then Qd=B[-25164]or Dj(-25164,51086,118105)continue else Qd=B[11117]or Dj(11117,65236,96295)continue end Qd=B[23300]or Dj(23300,5059,37140)else Nb['ResetScroll'](Xi);;
Qd=B[-12197]or Dj(-12197,34719,92947)end elseif Qd>39664 then Pa,Hk=dl(fg,Fh);;
Fh=Pa if Fh==nil then Qd=60214 else Qd=B[12801]or Dj(12801,9283,15571)end else Qd=B[7267]or Dj(7267,15076,1090)continue end end end;;
Nb['BackPage']=function()local uf,He,ic;;
uf,He=
{
}
,function(h,Df,i_)uf[i_]=ih(h,13376)-ih(Df,50342)return uf[i_]end;;
ic=uf[1844]or He(23634,55444,1844)while ic~=32815 do if ic>=20697 then if ic>20697 then ic=uf[-10730]or He(86624,8535,-10730)continue else Nb['SetPage'](Qf['Name']);;
ic=uf[10636]or He(93968,2501,10636)end else if not(Qf)then ic=uf[-8454]or He(61097,34906,-8454)continue else ic=uf[12299]or He(34331,42276,12299)continue end ic=36333 end end end;;
Nb['GetPage']=function()local qd,Jp,Ok,kq,bm,fb,Sj,Xh,wk;;
wk,Xh=function(Xk,Qn,cp)Xh[cp]=ih(Xk,58552)-ih(Qn,44705)return Xh[cp]end,
{
}
;;
bm=Xh[-28702]or wk(11310,12105,-28702)repeat if bm<53237 then if bm>=30323 then if bm<44157 then Sj=Xm(fb)if not(Sj~=nil and Sj['__iter']~=nil)then bm=Xh[16661]or wk(115151,54875,16661)continue else bm=Xh[-10652]or wk(77509,21545,-10652)continue end bm=Xh[-13782]or wk(94674,25910,-13782)elseif bm>44157 then Ok,Jp=fb(kq,qd);;
qd=Ok if qd==nil then bm=Xh[-11396]or wk(79791,30669,-11396)else bm=Xh[20335]or wk(98371,54657,20335)end else if rd(fb)=='table'then bm=Xh[6607]or wk(112233,21423,6607)continue end bm=Xh[24699]or wk(109208,10988,24699)end elseif bm<=18094 then fb,kq,qd=Ip['GetChildren'](Ip)if not(rd(fb)~='function')then bm=Xh[-26435]or wk(83186,30934,-26435)continue else bm=Xh[-26119]or wk(24706,41830,-26119)continue end bm=Xh[17577]or wk(107092,54200,17577)else fb,kq,qd=of(fb);;
bm=Xh[-23438]or wk(122953,38335,-23438)end elseif bm>=58939 then if bm<59867 then return Jp elseif bm>59867 then bm=Xh[12368]or wk(123860,29707,12368)continue else if not(Jp['HasTag'](Jp,'MastersOnboardingPage'))then bm=Xh[25790]or wk(119478,49818,25790)continue else bm=Xh[-22364]or wk(111256,53430,-22364)continue end bm=Xh[-17633]or wk(110733,9411,-17633)end elseif bm>53237 then if Jp['Visible']then bm=Xh[5966]or wk(82612,4464,5966)continue end bm=Xh[28342]or wk(128081,59831,28342)else fb,kq,qd=Sj['__iter'](fb);;
bm=Xh[26963]or wk(82556,29264,26963)end until bm==11458 end;;
Nb['PromptProcess']=function(Qp)local Sa,qf,Gg;;
qf,Gg=function(Li,Pf,Mg)Gg[Li]=ih(Mg,42150)-ih(Pf,21996)return Gg[Li]end,
{
}
;;
Sa=Gg[-5849]or qf(-5849,33457,124102)while Sa~=8572 do if Sa<36206 then if Sa<=23197 then Sa=Gg[21759]or qf(21759,59877,31011)continue else if Qp then Sa=Gg[447]or qf(447,25264,110573)continue else Sa=Gg[13461]or qf(13461,12970,20498)continue end Sa=23197 end elseif Sa>36206 then Zh['Interface']['Frame']['Pages']['Interactable']=false;;
Zh['Interface']['Frame']['Process']['Interactable']=true;;
Do['Create'](Do,Zh['Interface']['Frame']['Process'],hi,
{
  ['BackgroundTransparency']=0
}
)['Play'](Do['Create'](Do,Zh['Interface']['Frame']['Process'],hi,
{
  ['BackgroundTransparency']=0
}
));;
Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['Icon'],hi,
{
  ['ImageTransparency']=0
}
)['Play'](Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['Icon'],hi,
{
  ['ImageTransparency']=0
}
));;
Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['scale'],hi,
{
  ['Scale']=1
}
)['Play'](Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['scale'],hi,
{
  ['Scale']=1
}
));;
Sa=Gg[-8210]or qf(-8210,40659,98682)else Zh['Interface']['Frame']['Pages']['Interactable']=true;;
Zh['Interface']['Frame']['Process']['Interactable']=false;;
Do['Create'](Do,Zh['Interface']['Frame']['Process'],hi,
{
  ['BackgroundTransparency']=1
}
)['Play'](Do['Create'](Do,Zh['Interface']['Frame']['Process'],hi,
{
  ['BackgroundTransparency']=1
}
));;
Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['Icon'],hi,
{
  ['ImageTransparency']=1
}
)['Play'](Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['Icon'],hi,
{
  ['ImageTransparency']=1
}
));;
Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['scale'],hi,
{
  ['Scale']=0.80000000000000004
}
)['Play'](Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['scale'],hi,
{
  ['Scale']=0.80000000000000004
}
));;
Sa=Gg[-26603]or qf(-26603,14768,25183)end end end;;
Nb['AnimateGetStarted']=function()Nb['task']['spawn'](function()Ip['GetStarted']['Content']['Container']['Logo']['ImageTransparency']=1;;
Ip['GetStarted']['Content']['Container']['Logo']['scale']['Scale']=0.80000000000000004;;
Ip['GetStarted']['Content']['Container']['Masters']['Position']=Nb['UDim2']['new'](0.5,0,0,5);;
Ip['GetStarted']['Content']['Container']['Masters']['ImageTransparency']=1;;
Ip['GetStarted']['Content']['Container']['HomeRender']['Position']=Nb['UDim2']['new'](0.5,0,1,100);;
Ip['GetStarted']['Content']['Container']['HomeRender']['ImageColor3']=Nb['Color3']['fromRGB'](0,0,0);;
Ip['GetStarted']['Content']['Container']['Blur']['ImageTransparency']=0.90000000000000002;;
Ip['GetStarted']['Content']['Container']['FlareStudio']['Position']=Nb['UDim2']['new'](0.5,0,0,-20);;
Ip['GetStarted']['Content']['Container']['FlareStudio']['ImageTransparency']=1;;
Ip['GetStarted']['Content']['Actions']['GetStarted']['Visible']=true;;
Ip['GetStarted']['Content']['Actions']['GetStarted']['Transparency']=1;;
Do['Create'](Do,Ip['GetStarted']['Content']['Container']['HomeRender'],xd,
{
  ['Position']=Nb['UDim2']['new'](0.5,0,1,30),['ImageColor3']=Nb['Color3']['fromRGB'](255,255,255)
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Container']['HomeRender'],xd,
{
  ['Position']=Nb['UDim2']['new'](0.5,0,1,30),['ImageColor3']=Nb['Color3']['fromRGB'](255,255,255)
}
));;
Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Blur'],xd,
{
  ['ImageTransparency']=0
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Blur'],xd,
{
  ['ImageTransparency']=0
}
));;
Nb['task']['wait'](1);;
Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Logo'],xd,
{
  ['ImageTransparency']=0.97999999999999998
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Logo'],xd,
{
  ['ImageTransparency']=0.97999999999999998
}
));;
Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Logo']['scale'],xd,
{
  ['Scale']=1
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Logo']['scale'],xd,
{
  ['Scale']=1
}
));;
Do['Create'](Do,Ip['GetStarted']['Content']['Container']['FlareStudio'],V,
{
  ['Position']=Nb['UDim2']['new'](0.5,0,0,0),['ImageTransparency']=0
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Container']['FlareStudio'],V,
{
  ['Position']=Nb['UDim2']['new'](0.5,0,0,0),['ImageTransparency']=0
}
));;
Nb['task']['wait'](0.10000000000000001);;
Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Masters'],V,
{
  ['Position']=Nb['UDim2']['new'](0.5,0,0,25),['ImageTransparency']=0
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Masters'],V,
{
  ['Position']=Nb['UDim2']['new'](0.5,0,0,25),['ImageTransparency']=0
}
));;
Nb['task']['wait'](0.10000000000000001);;
Do['Create'](Do,Ip['GetStarted']['Content']['Actions']['GetStarted'],hi,
{
  ['Transparency']=0
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Actions']['GetStarted'],hi,
{
  ['Transparency']=0
}
))end)end;;
Nb['FetchBuild']=function(Rl)local ze,gi,ja,ym,uq,uo;;
gi,ym=function(fo_,Ke,ki)ym[fo_]=ih(Ke,43985)-ih(ki,52341)return ym[fo_]end,
{
}
;;
uo=ym[-3901]or gi(-3901,28125,27006)repeat if uo>=29726 then if uo<56299 then if uo<=29726 then uq['Installed'],uo=ja['Server']['GetAttribute'](ja['Server'],'Id'),ym[-10093]or gi(-10093,21576,7104)else uo,uq['Online']=ym[-22626]or gi(-22626,124587,8270),Nb['tonumber'](ze['values'][1][1])end elseif uo<=56299 then uo,uq['Plugin']=ym[-21208]or gi(-21208,91865,8829),Jf['Build']else return uq end elseif uo>=10713 then if uo>10713 then if ja then uo=ym[-5338]or gi(-5338,55066,50392)continue end uo=ym[12967]or gi(12967,17338,3314)else ze=Nb['GetInSheets']('B10')if ze then uo=ym[-14810]or gi(-14810,79453,15440)continue end uo=ym[30739]or gi(30739,127175,13730)end elseif uo<=8449 then uq,ja=
{
  ['Online']=0,['Installed']=0,['Plugin']=0
}
,Nb['IsMastersInstalled']()if not Rl then uo=ym[4084]or gi(4084,111797,14846)continue end uo=24895 else if not(Wh)then uo=ym[1376]or gi(1376,79858,29014)continue else uo=ym[20111]or gi(20111,103655,44862)continue end uo=ym[-3825]or gi(-3825,113121,65349)end until uo==53793 end local Gi=false;;
Nb['IsGamePrepared']=function(zb)local E,lg,Pd,Lk,Vf,vn;;
lg,Pd=function(eq,Jb,ef)Pd[Jb]=ih(eq,5972)-ih(ef,28048)return Pd[Jb]end,
{
}
;;
vn=Pd[-24916]or lg(26292,-24916,25045)repeat if vn>=26011 then if vn>=41041 then if vn>41041 then return false else return true end else E=_h['HttpEnabled'];;
Lk,Vf=Nb['pcall'](function()Wg['GetDataStore'](Wg,'____PS')['SetAsync'](Wg['GetDataStore'](Wg,'____PS'),'____PS',Nb['os']['time']())end)if zb then vn=Pd[-22299]or lg(39421,-22299,57846)continue end vn=Pd[11800]or lg(78323,11800,39779)end elseif vn>=12212 then if vn<=12212 then if E and Lk and Nb['game']['PlaceId']~=0 then vn=Pd[-21461]or lg(83687,-21461,56562)continue else vn=Pd[16775]or lg(63461,16775,16511)continue end vn=Pd[-32346]or lg(63837,-32346,52932)else vn=Pd[-6572]or lg(54148,-6572,50232)continue end else return
{
  ['HttpRequests']=E,['APIAccess']=Lk,['Published']=Nb['game']['PlaceId']~=0
}
end until vn==6952 end;;
Nb['AnalyzeIssues']=function()local Jo,ro,Uc,io,ol,Re,xk;;
io,Uc=function(ha,mi,rp)Uc[ha]=ih(mi,50671)-ih(rp,11265)return Uc[ha]end,
{
}
;;
Jo=Uc[-30201]or io(-30201,118721,7965)repeat if Jo<=43286 then if Jo<=32523 then if Jo<=16582 then if Jo>5226 then Ip['Failure']['Content']['Checklist']['APIServices']['stroke']['Enabled']=false;;
Ip['Failure']['Content']['Checklist']['APIServices']['Container']['Info']['Sublabel']['Text'],Jo='This game allows Studio to access API Services.',Uc[-1795]or io(-1795,128468,65141)elseif Jo>4052 then if not(ol['APIAccess'])then Jo=Uc[28069]or io(28069,120167,19315)continue else Jo=Uc[-29778]or io(-29778,23054,29466)continue end Jo=24007 elseif Jo>1379 then Ip['Failure']['Content']['Checklist']['GameOwner']['stroke']['Enabled']=true;;
Jo,Ip['Failure']['Content']['Checklist']['GameOwner']['Container']['Info']['Detail']['Text']=Uc[4343]or io(4343,129649,16402),'HTTP Requests are disabled. No data fetched.'else return end elseif Jo<24007 then Nb['SetPage']('Installation');;
Jo=Uc[26330]or io(26330,105120,34165)elseif Jo<=24007 then if not(ol['HttpRequests'])then Jo=Uc[-26528]or io(-26528,21744,15893)continue else Jo=Uc[16553]or io(16553,99175,28732)continue end Jo=Uc[17697]or io(17697,123218,45287)else Ip['Failure']['Content']['Checklist']['HttpRequests']['stroke']['Enabled']=true;;
Jo,Ip['Failure']['Content']['Checklist']['HttpRequests']['Container']['Info']['Sublabel']['Text']=Uc[-12012]or io(-12012,7474,32007),'Check Game Settings to turn this setting on.'end elseif Jo>37164 then if Jo<=43069 then return else Ip['Failure']['Content']['Checklist']['APIServices']['stroke']['Enabled']=true;;
Ip['Failure']['Content']['Checklist']['APIServices']['Container']['Info']['Sublabel']['Text'],Jo='Check Game Settings to turn this setting on.',Uc[28918]or io(28918,10189,43098)end elseif Jo<=34775 then if Jo<=34554 then Ip['Failure']['Content']['Checklist']['Game']['stroke']['Enabled']=true;;
Jo,Ip['Failure']['Content']['Checklist']['Game']['Container']['Info']['Sublabel']['Text']=Uc[10482]or io(10482,47732,18224),'This game hasn\'t been published.'else if xk and ol['Published']and ol['APIAccess']and ol['HttpRequests']then Jo=Uc[-13467]or io(-13467,44863,2864)continue end Jo=Uc[-31507]or io(-31507,14590,27447)end else Re,ro=Nb['pcall'](function()return ue['GetNameFromUserIdAsync'](ue,Jh())end)if not Re then Jo=Uc[-1861]or io(-1861,9194,52387)continue end Jo=63305 end elseif Jo>=56486 then if Jo<=61890 then if Jo<59979 then if Jo<=56486 then Ip['Failure']['Content']['Checklist']['Game']['stroke']['Enabled']=false;;
Ip['Failure']['Content']['Checklist']['Game']['Container']['Info']['Sublabel']['Text'],Jo='This game has been published.',Uc[329]or io(329,42798,25174)else Ip['Failure']['Content']['Checklist']['GameOwner']['stroke']['Enabled']=false;;
Jo,Ip['Failure']['Content']['Checklist']['GameOwner']['Container']['Info']['Detail']['Text']=Uc[17295]or io(17295,107388,48905),'The owner of this game owns Masters.'end elseif Jo>59979 then Gi=true;;
ol,xk=Nb['IsGamePrepared'](true),Cm()if not ol then Jo=Uc[26496]or io(26496,107022,37797)continue end Jo=37164 else Ip['Failure']['Content']['Checklist']['HttpRequests']['stroke']['Enabled']=false;;
Ip['Failure']['Content']['Checklist']['HttpRequests']['Container']['Info']['Sublabel']['Text'],Jo='This game allows Http Requests.',Uc[6747]or io(6747,121297,47206)end elseif Jo<=63305 then Ip['Failure']['Content']['Checklist']['GameOwner']['Container']['Info']['Username']['Text']='@'..ro;;
Ip['Failure']['Content']['Checklist']['GameOwner']['Container']['Profile']['Image']=u_['GetPlayerThumbnail'](Jh())if xk then Jo=Uc[7441]or io(7441,14870,3461)continue else Jo=Uc[-7672]or io(-7672,5986,11023)continue end Jo=54155 else return end elseif Jo>52095 then if Jo>54155 then if Gi then Jo=Uc[-14084]or io(-14084,73296,52821)continue end Jo=Uc[1700]or io(1700,125057,6061)else if ol['Published']then Jo=Uc[21436]or io(21436,15068,3724)continue else Jo=Uc[-19546]or io(-19546,116609,22389)continue end Jo=Uc[18044]or io(18044,117755,54699)end elseif Jo>=51679 then if Jo<=51679 then Ip['Failure']['Content']['Checklist']['GameOwner']['stroke']['Enabled']=true;;
Jo,Ip['Failure']['Content']['Checklist']['GameOwner']['Container']['Info']['Detail']['Text']=Uc[23005]or io(23005,83853,33494),'The owner of this game doesn\'t own Masters.'else if ol['HttpRequests']then Jo=Uc[24876]or io(24876,125310,20147)continue else Jo=Uc[-23210]or io(-23210,33274,6208)continue end Jo=Uc[-25927]or io(-25927,117207,5292)end else Gi,Jo=false,Uc[12589]or io(12589,107960,37449)continue end until Jo==41487 end;;
Nb['CheckForNewVersion']=function(k,Ug)local Un,x,jm,xi;;
Un,x=
{
}
,function(vo,li,Mo)Un[Mo]=ih(li,47796)-ih(vo,2966)return Un[Mo]end;;
xi=Un[-5083]or x(17458,28824,-5083)while xi~=57022 do if xi<31810 then if xi<=25214 then if xi>=13931 then if xi>13931 then yk['BannerNotify']
{
  ['Header']=Ug['Header'],['Description']=Ug['Description'],['Icon']=Ug['Icon']
}
;;
xi=Un[13814]or x(925,27653,13814)else if not k or not Ug then xi=Un[2202]or x(3515,37046,2202)continue end xi=38187 end else return end elseif xi>26326 then if not k then xi=Un[-26428]or x(9464,11504,-26428)continue end xi=Un[15882]or x(57713,75136,15882)else xi,k=Un[-30630]or x(28305,107488,-30630),Nb['FetchBuild']()end elseif xi>=46157 then if xi>51152 then xi=Un[-11872]or x(36857,121241,-11872)continue elseif xi<=46157 then if not(not Ug)then xi=Un[10738]or x(63929,102958,10738)continue else xi=Un[12703]or x(47363,103523,12703)continue end xi=13931 else if k['Online']~=k['Installed']then xi=Un[18662]or x(63599,126147,18662)continue end xi=Un[7564]or x(9977,18081,7564)end elseif xi>31810 then if Nb['IsMastersInstalled']()then xi=Un[6877]or x(48086,115364,6877)continue end xi=Un[-29845]or x(60141,68245,-29845)else jm=Nb['GetInSheets']('B20:B22');;
xi,Ug=Un[-32445]or x(37482,27347,-32445),
{
  ['Header']=jm[1][1],['Description']=jm[2][1],['Icon']=jm[1][3]
}
end end end local Eo=false;;
Nb['LoadInfos']=function(ka)local Mb,_d,Bn,ci,un_,Bb;;
_d,Mb=
{
}
,function(ug,Ak,dg)_d[dg]=ih(ug,18807)-ih(Ak,30791)return _d[dg]end;;
un_=_d[14183]or Mb(95492,52497,14183)repeat if un_>33812 then if un_<52604 then if un_>=39775 then if un_>=42740 then if un_<=43941 then if un_<=42740 then return else Eo=false if ka then un_=_d[-32435]or Mb(117264,56650,-32435)continue end un_=1121 end else Nb['CheckForNewVersion'](ci,
{
  ['Header']=Bb['values'][20][1],['Description']=Bb['values'][21][1],['Icon']=Bb['values'][22][1]
}
)if Bb['values'][14][1]~=Jf['BypassId']then un_=_d[14110]or Mb(127463,45324,14110)continue end un_=10573 end elseif un_<=39775 then if Bn then un_=_d[17217]or Mb(89382,63576,17217)continue else un_=_d[-28420]or Mb(93518,39005,-28420)continue end un_=43941 else Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['OnlineStations']['Info']['Warning']['Visible']=true;;
un_,Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['Warning']['Visible']=_d[26449]or Mb(69776,62508,26449),true end elseif un_<35426 then if un_<=34589 then if Eo then un_=_d[5061]or Mb(40472,53622,5061)continue end un_=_d[-3067]or Mb(72368,992,-3067)else Ip['Installation']['Content']['Actions']['Stations']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Configuration']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Instruction']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Uninstall']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Install']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Update']['Visible']=false;;
un_,Ip['Installation']['Content']['Actions']['Install']['Text']=_d[-11614]or Mb(47752,8423,-11614),'Install Anyway'end elseif un_<=35426 then Nb['PromptProcess'](false);;
un_=_d[19240]or Mb(47161,37171,19240)else Ip['Installation']['Content']['Scroll']['MoreDetails']['Downloads']['Label']['Text'],un_=Nb['AbbreviateNumber'](Bn),_d[19597]or Mb(91722,64479,19597)end elseif un_>58514 then if un_>64267 then Ip['Installation']['Content']['Actions']['Stations']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Configuration']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Instruction']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Uninstall']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Install']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Update']['Visible'],un_=false,_d[-7314]or Mb(43072,2160,-7314)elseif un_<=61753 then if un_>61253 then if ci['Plugin']==ci['Online']then un_=_d[6055]or Mb(40353,31523,6055)continue else un_=_d[2894]or Mb(119574,57993,2894)continue end un_=_d[-20104]or Mb(89296,56544,-20104)else if Nb['ConvertBoolean'](Bb['values'][16][1])then un_=_d[2266]or Mb(40840,3491,2266)continue else un_=_d[26471]or Mb(91194,42661,26471)continue end un_=_d[4284]or Mb(82982,40003,4284)end else if ci['Plugin']==ci['Online']then un_=_d[14068]or Mb(3987,24220,14068)continue else un_=_d[10794]or Mb(78337,35672,10794)continue end un_=_d[-12295]or Mb(76892,45451,-12295)end elseif un_>=56922 then if un_>57963 then Eo=true;;
Bb,ci,Bn=Nb['GetInSheets']('B1:B22'),Nb['FetchBuild'](),Eb()if not(not Bb)then un_=_d[-31973]or Mb(40302,23328,-31973)continue else un_=_d[-13872]or Mb(86862,43677,-13872)continue end un_=45234 elseif un_<=56922 then Nb['PromptProcess'](false);;
un_=_d[14465]or Mb(8879,7984,14465)else if ci['Installed']~=ci['Online']then un_=_d[-6241]or Mb(124449,50778,-6241)continue else un_=_d[23273]or Mb(85475,41947,23273)continue end un_=_d[15403]or Mb(61254,19830,15403)end elseif un_<=53618 then if un_<=52604 then Ip['Installation']['Utils']['Visual']['Banner']['Image']=Bb['values'][5][1];;
Ip['Installation']['Content']['Scroll']['About']['Label']['Text']=Bb['values'][7][1];;
Ip['Installation']['Content']['Scroll']['Info']['Details']['ProductName']['Text']=Bb['values'][2][1];;
Ip['Installation']['Content']['Scroll']['Info']['Details']['ProductTag']['Text']=Bb['values'][3][1];;
Ip['Installation']['Content']['Scroll']['Info']['Details']['PluginBuild']['Text']='Build '..Bb['values'][10][1];;
Ip['Installation']['Content']['Scroll']['Info']['Icon']['Photo']['Image']=Bb['values'][4][1];;
Ip['Installation']['Content']['Scroll']['Update']['Header']['Build']['Text']='Build '..Bb['values'][10][1];;
Ip['Installation']['Content']['Scroll']['Update']['Label']['Text']=Bb['values'][11][1];;
Ip['Installation']['Content']['Scroll']['MoreDetails']['ParcelRatings']['Label']['Text']=Bb['values'][6][1]if not(Nb['IsMastersInstalled']())then un_=_d[-21628]or Mb(68099,12334,-21628)continue else un_=_d[-2656]or Mb(90993,16348,-2656)continue end un_=39775 else Ip['Installation']['Content']['Actions']['Stations']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Configuration']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Instruction']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Uninstall']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Install']['Visible']=false;;
un_,Ip['Installation']['Content']['Actions']['Update']['Visible']=_d[16608]or Mb(39402,10202,16608),true end else if not(ka)then un_=_d[-25436]or Mb(128695,41833,-25436)continue else un_=_d[-8416]or Mb(35853,55487,-8416)continue end un_=_d[32041]or Mb(119627,52717,32041)end elseif un_>18271 then if un_>24859 then if un_>=31453 then if un_>31453 then Zh['Interface']['Interactable']=true;;
Zh['Interface']['Frame']['Inactive']['Visible']=false;;
Zh['Interface']['Frame']['OutOfAccess']['Visible'],un_=false,_d[25973]or Mb(72599,38593,25973)else Nb['PromptProcess'](false);;
un_=_d[28848]or Mb(58113,31685,28848)end elseif un_<=25690 then if Nb['ConvertBoolean'](Bb['values'][17][1])then un_=_d[-25491]or Mb(49303,15918,-25491)continue else un_=_d[27488]or Mb(93685,61490,27488)continue end un_=52604 else Ip['Installation']['Content']['Actions']['Install']['Text'],un_='Install',_d[1010]or Mb(60984,29623,1010)end elseif un_<21532 then if un_>20075 then Nb['PromptProcess'](false);;
un_=_d[4529]or Mb(84023,54503,4529)else Zh['Interface']['Interactable']=false;;
Zh['Interface']['Frame']['Inactive']['Visible']=true;;
Zh['Interface']['Frame']['OutOfAccess']['Visible']=false;;
Eo=false if ka then un_=_d[27643]or Mb(42676,7462,27643)continue end un_=_d[3895]or Mb(16749,30727,3895)end elseif un_<=21664 then if un_<=21532 then Zh['Interface']['Interactable']=false;;
Zh['Interface']['Frame']['Inactive']['Visible']=false;;
Zh['Interface']['Frame']['OutOfAccess']['Visible']=true;;
Eo=false if not(ka)then un_=_d[4891]or Mb(36875,64667,4891)continue else un_=_d[-31551]or Mb(48246,55911,-31551)continue end un_=21664 else return end else Zh['Interface']['Interactable']=true;;
Zh['Interface']['Frame']['Inactive']['Visible']=false;;
Zh['Interface']['Frame']['OutOfAccess']['Visible'],un_=false,_d[8775]or Mb(26562,32047,8775)end elseif un_<10573 then if un_>=8201 then if un_<9346 then Ip['Installation']['Content']['Actions']['Stations']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Configuration']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Instruction']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Uninstall']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Install']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Update']['Visible']=false;;
un_,Ip['Installation']['Content']['Actions']['Install']['Text']=_d[-32581]or Mb(85165,4668,-32581),'Install'elseif un_<=9346 then Nb['PromptProcess'](true);;
un_=_d[8692]or Mb(103782,36664,8692)else Ip['Installation']['Content']['Actions']['Stations']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Configuration']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Instruction']['Visible']=false;;
Ip['Installation']['Content']['Actions']['Uninstall']['Visible']=true;;
Ip['Installation']['Content']['Actions']['Install']['Visible']=false;;
un_,Ip['Installation']['Content']['Actions']['Update']['Visible']=_d[-16519]or Mb(51864,27304,-16519),false end elseif un_<=1121 then un_=_d[-22413]or Mb(80339,56248,-22413)continue else return end elseif un_<=17271 then if un_<16813 then if un_<=10573 then if not(Jf['SpecialId']~='')then un_=_d[-1422]or Mb(64244,14190,-1422)continue else un_=_d[12229]or Mb(84605,47386,12229)continue end un_=_d[26040]or Mb(54379,16517,26040)else return end elseif un_>16813 then Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['OnlineStations']['Info']['Warning']['Visible']=false;;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['Warning']['Visible'],un_=false,_d[27018]or Mb(101658,36534,27018)else if not(Jf['SpecialId']==Bb['values'][15][1])then un_=_d[-10206]or Mb(95574,36930,-10206)continue else un_=_d[10118]or Mb(117056,33892,10118)continue end un_=_d[-27492]or Mb(50641,20491,-27492)end elseif un_>17439 then Eo=false if ka then un_=_d[-5740]or Mb(55857,24622,-5740)continue end un_=_d[-20058]or Mb(93912,63740,-20058)else un_,Ip['Installation']['Content']['Scroll']['MoreDetails']['Downloads']['Label']['Text']=_d[32254]or Mb(44083,16856,32254),'Unknown'end until un_==52389 end;;
Nb['SwitchToggle']=function(kn,En)local p,Yj,ai;;
p,ai=
{
}
,function(zh,De,Hm)p[Hm]=ih(zh,43694)-ih(De,40440)return p[Hm]end;;
Yj=p[-21177]or ai(99258,5165,-21177)repeat if Yj<40767 then if Yj>17815 then Do['Create'](Do,kn,hi,
{
  ['ImageColor3']=Nb['Color3']['fromRGB'](34,34,34)
}
)['Play'](Do['Create'](Do,kn,hi,
{
  ['ImageColor3']=Nb['Color3']['fromRGB'](34,34,34)
}
));;
Do['Create'](Do,kn['Knob'],hi,
{
  ['Position']=Nb['UDim2']['fromScale'](0,0.5),['ImageColor3']=Nb['Color3']['fromRGB'](12,12,12)
}
)['Play'](Do['Create'](Do,kn['Knob'],hi,
{
  ['Position']=Nb['UDim2']['fromScale'](0,0.5),['ImageColor3']=Nb['Color3']['fromRGB'](12,12,12)
}
));;
Yj=p[12423]or ai(23255,54297,12423)else Do['Create'](Do,kn,hi,
{
  ['ImageColor3']=Nb['Color3']['fromRGB'](0,185,62)
}
)['Play'](Do['Create'](Do,kn,hi,
{
  ['ImageColor3']=Nb['Color3']['fromRGB'](0,185,62)
}
));;
Do['Create'](Do,kn['Knob'],hi,
{
  ['Position']=Nb['UDim2']['fromScale'](1,0.5),['ImageColor3']=Nb['Color3']['fromRGB'](0,85,28)
}
)['Play'](Do['Create'](Do,kn['Knob'],hi,
{
  ['Position']=Nb['UDim2']['fromScale'](1,0.5),['ImageColor3']=Nb['Color3']['fromRGB'](0,85,28)
}
));;
Yj=p[-189]or ai(22200,51334,-189)end elseif Yj>40767 then Yj=p[-12922]or ai(57269,43155,-12922)continue else if En then Yj=p[-28486]or ai(104991,30434,-28486)continue else Yj=p[-16368]or ai(15308,35444,-16368)continue end Yj=42648 end until Yj==16304 end local Aj=
{
  ['Booting']=false,['Booted']=false,['Connected']=false
}
local function Yc()if not(Aj['Booting'])then else return end if not Wh then return end if#Wh['GetChildren'](Wh)~=2 then return end if not(Zh['Enabled'])then Zh['Enabled']=true;;
Zh['WaitForChild'](Zh,'Interface')['Visible']=false if not If then local jj,ah,Zk;;
jj,Zk=function(Rd,pb,qp)Zk[pb]=ih(Rd,29314)-ih(qp,6492)return Zk[pb]end,
{
}
;;
ah=Zk[-24211]or jj(85951,-24211,18837)repeat if ah>=50697 then if ah<=50697 then ah=Zk[17418]or jj(34056,17418,24614)continue else Nb['task']['wait']();;
ah=Zk[-20615]or jj(66656,-20615,60593)end else if not Zh['ViewportSizeWarning']['Visible']then ah=50697 else ah=60532 end end until ah==32272 end Zh['Interface']['Visible']=true;;
Zh['Interface']['ImageTransparency']=1;;
Zh['Interface']['Size']=Nb['UDim2']['fromOffset'](600,0);;
Do['Create'](Do,Zh['Interface'],V,
{
  ['Size']=Nb['UDim2']['fromOffset'](600,530),['ImageTransparency']=0
}
)['Play'](Do['Create'](Do,Zh['Interface'],V,
{
  ['Size']=Nb['UDim2']['fromOffset'](600,530),['ImageTransparency']=0
}
))if Aj['Booted']then Nb['LoadInfos'](true)else Aj['Booting']=true;;
Ip['OnboardingTag']['Visible']=false;;
Nb['SetPage']('Startup',true);;
Do['Create'](Do,Ip['Startup']['FlareStudio'],Im,
{
  ['ImageTransparency']=0
}
)['Play'](Do['Create'](Do,Ip['Startup']['FlareStudio'],Im,
{
  ['ImageTransparency']=0
}
));;
Do['Create'](Do,Ip['Startup']['Masters'],Im,
{
  ['ImageTransparency']=1
}
)['Play'](Do['Create'](Do,Ip['Startup']['Masters'],Im,
{
  ['ImageTransparency']=1
}
));;
Nb['task']['wait'](2);;
Do['Create'](Do,Ip['Startup']['FlareStudio'],Im,
{
  ['ImageTransparency']=1
}
)['Play'](Do['Create'](Do,Ip['Startup']['FlareStudio'],Im,
{
  ['ImageTransparency']=1
}
));;
Do['Create'](Do,Ip['Startup']['Masters'],Im,
{
  ['ImageTransparency']=0
}
)['Play'](Do['Create'](Do,Ip['Startup']['Masters'],Im,
{
  ['ImageTransparency']=0
}
));;
Nb['task']['wait'](2);;
Nb['LoadInfos'](true);;
Xe['PlaySound'](78123227809350);;
Nb['AnimateGetStarted']();;
Aj['Booting']=false;;
Aj['Booted']=true;;
Ip['OnboardingTag']['Visible']=true end Nb['SetPage']('GetStarted',true)if Aj['Connected']then return end Aj['Connected']=true;;
Ip['Agreement']['Header']['Actions']['Back']['MouseButton1Click']['Connect'](Ip['Agreement']['Header']['Actions']['Back']['MouseButton1Click'],Nb['BackPage']);;
Ip['Installation']['Content']['Actions']['Instruction']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Actions']['Instruction']['MouseButton1Click'],function()Nb['SetPage']('UpdateInstructions')end);;
Ip['Installation']['Content']['Scroll']['External']['Instructions']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Scroll']['External']['Instructions']['MouseButton1Click'],function()Nb['SetPage']('UpdateInstructions')end);;
Ip['Installation']['Content']['Scroll']['External']['LicenseAgreement']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Scroll']['External']['LicenseAgreement']['MouseButton1Click'],function()Nb['SetPage']('Agreement')end)for Ab,ve in Ip['Installation']['Content']['Scroll']['External']['GetChildren'](Ip['Installation']['Content']['Scroll']['External'])do if not(ve['IsA'](ve,'ImageButton')and ve['HasTag'](ve,'MastersExternalButton'))then else local ml=ve['Label']['Text'];;
ve['MouseButton1Down']['Connect'](ve['MouseButton1Down'],function()ve['Label']['TextTransparency']=0.5;;
ve['Icon']['ImageTransparency']=0.5 end);;
ve['MouseEnter']['Connect'](ve['MouseEnter'],function()ve['Label']['Text']='<u>'..ml..'</u>'end);;
ve['InputEnded']['Connect'](ve['InputEnded'],function()ve['Label']['Text']=ml;;
ve['Label']['TextTransparency']=0;;
ve['Icon']['ImageTransparency']=0 end)end end local rh=
{
  ['HasChanged']=false,['Loading']=false,['CurrentlyLoaded']=nil,['LoadedStations']=nil
}
local function kp()rh['HasChanged']=false;;
rh['CurrentlyLoaded']=nil;;
Ip['Configuration']['Content']['Actions']['Visible']=false end local function Zc()local Bj,Hl,zi,lo_;;
Bj,Hl=
{
}
,function(dk,kh,Pn)Bj[Pn]=ih(dk,15788)-ih(kh,44186)return Bj[Pn]end;;
zi=Bj[-10512]or Hl(88232,4032,-10512)repeat if zi>=38171 then if zi<56285 then if zi>38171 then if rh['Loading']then zi=Bj[-32556]or Hl(79110,6529,-32556)continue end zi=Bj[7132]or Hl(100814,29727,7132)else if not rh['HasChanged']then zi=Bj[-22840]or Hl(85591,55607,-22840)continue end zi=9444 end elseif zi<64180 then if not(not rh['CurrentlyLoaded'])then zi=Bj[-27152]or Hl(93785,4672,-27152)continue else zi=Bj[29077]or Hl(66640,6853,29077)continue end zi=38171 elseif zi<=64180 then yk['BannerNotify']
{
  ['Header']='Successfully Saved',['Description']='Configurations are saved successfully.',['Icon']='rbxassetid://11419719540'
}
;;
rh['HasChanged']=false;;
zi,Ip['Configuration']['Content']['Actions']['Visible']=Bj[-7607]or Hl(26639,59915,-7607),false else return end elseif zi>21391 then if zi<=33693 then return else yk['BannerNotify']
{
  ['Header']='Failed to Save',['Description']='An error occurred upon saving Configurations.',['Icon']='rbxassetid://11419713314'
}
;;
zi=Bj[15247]or Hl(7725,47349,15247)end elseif zi>=9444 then if zi>9444 then return else Nb['PromptProcess'](true);;
lo_=Fg['SetConfigurationAsync'](rh['CurrentlyLoaded'])if not(lo_)then zi=Bj[-1865]or Hl(83566,19020,-1865)continue else zi=Bj[-20933]or Hl(114381,9271,-20933)continue end zi=Bj[-5293]or Hl(53871,19499,-5293)end else Nb['PromptProcess'](false);;
zi=Bj[4478]or Hl(79772,34771,4478)continue end until zi==57063 end local function K()local Zf,N,ff,cg,th_,Zm,No,sj,iq,jf,F,Nj;;
No,Nj=function(El,Bi,wn)Nj[wn]=ih(Bi,14632)-ih(El,63053)return Nj[wn]end,
{
}
;;
cg=Nj[-32027]or No(48893,51673,-32027)repeat if cg>32272 then if cg>=51615 then if cg>59404 then if cg<=62412 then Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Autostart']['Dropdown']['StationSelected']['Text'],cg=Zm or 'None Selected',Nj[-16764]or No(6597,119221,-16764)else u_['SwitchToggle'](Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['OnlineStations']['Switch'],ff['Stations']['OnlineStations']);;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['SubtextDisabled']['Visible']=not ff['Stations']['OnlineStations'];;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['SubtextEnabled']['Visible']=ff['Stations']['OnlineStations'];;
rh['Loading'],cg=false,Nj[-10359]or No(64251,64926,-10359)continue end elseif cg>=58729 then if cg<=58729 then cg,Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Autostart']['Dropdown']['StationSelected']['Text']=Nj[-32205]or No(45413,96533,-32205),'None Selected'else for zj,La in ff['Access']['LinkPasses']do local Cf,mc=b_['GetProductInfoAsync'](b_,La,Nb['Enum']['InfoType']['GamePass']),Zh['Storage']['Items']['PassItem']['Clone'](Zh['Storage']['Items']['PassItem']);;
mc['Name']=La;;
mc['Profile']['Image']=u_['AssetToTexture'](Cf['IconImageAssetId']);;
mc['PassName']['Text']=Cf['Name'];;
mc['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Content'];;
mc['Unlink']['MouseButton1Click']['Connect'](mc['Unlink']['MouseButton1Click'],function()local Ji,dj,mp,Tj;;
Ji,dj=
{
}
,function(la,ag,Xn)Ji[la]=ih(Xn,7579)-ih(ag,16852)return Ji[la]end;;
mp=Ji[31716]or dj(31716,16649,33714)repeat if mp<=52932 then if mp<=40268 then if mp<=17630 then Nb['table']['remove'](rh['CurrentlyLoaded']['Access']['LinkPasses'],Tj);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
mc['Destroy'](mc);;
yk['BannerNotify']
{
  ['Header']='Successfully Unlinked',['Description']='You\'ve unlinked '..Cf['Name']..'.',['Icon']='rbxassetid://11422930594'
}
;;
mp=Ji[-11496]or dj(-11496,56357,91582)else Tj=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkPasses'],La)if Tj then mp=Ji[18997]or dj(18997,21216,17801)continue else mp=Ji[-32350]or dj(-32350,7281,78322)continue end mp=Ji[-18188]or dj(-18188,4658,78721)end else yk['BannerNotify']
{
  ['Header']='Failed to Unlink',['Description']='An error occurred upon unlinking pass.',['Icon']='rbxassetid://11419713314'
}
;;
mp=Ji[10228]or dj(10228,51260,96647)end else mp=Ji[2808]or dj(2808,49269,63705)continue end until mp==25505 end)end for Gp,In in ff['Access']['LinkGroups']do local pi,Vi=xp['GetGroupInfoAsync'](xp,Gp),Zh['Storage']['Items']['GroupItem']['Clone'](Zh['Storage']['Items']['GroupItem']);;
Vi['Name']=Gp;;
Vi['MainGroup']['Profile']['Image']=pi['EmblemUrl'];;
Vi['MainGroup']['GroupName']['Text']=pi['Name'];;
Vi['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Content'];;
Vi['MainGroup']['AddRank']['MouseButton1Click']['Connect'](Vi['MainGroup']['AddRank']['MouseButton1Click'],function()local jh=
{
}
for Qi,sl in pi['Roles']do if Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp],sl['Rank'])then continue end Nb['table']['insert'](jh,
{
  ['Name']=sl['Name']..' (Rank: '..sl['Rank']..')',['Icon']='',['ExtraData']=sl['Rank']
}
)end if#jh==0 then yk['BannerNotify']
{
  ['Header']='Failed to Add Rank',['Description']='All ranks have been added. None remain.',['Icon']='rbxassetid://11419713314'
}
return end local qn,Ul=n_['PromptOptions']
{
  ['Options']=jh
}
if not(qn~=nil)then else local qq=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp],Ul)if qq then yk['BannerNotify']
{
  ['Header']='Failed to Add Rank',['Description']='This rank is already added.',['Icon']='rbxassetid://11419713314'
}
return else Nb['table']['insert'](rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp],Ul)end local pa=Zh['Storage']['Items']['RankItem']['Clone'](Zh['Storage']['Items']['RankItem']);;
pa['Name']=Ul;;
pa['LayoutOrder']=-Ul;;
pa['RankName']['Text']=qn;;
pa['Parent']=Vi;;
pa['Unlink']['MouseButton1Click']['Connect'](pa['Unlink']['MouseButton1Click'],function()local Tf,ga,Sc,Tg;;
Tf,Sc=function(ii,fl,fi)Sc[fl]=ih(ii,58736)-ih(fi,3758)return Sc[fl]end,
{
}
;;
Tg=Sc[-20903]or Tf(20303,-20903,30770)while Tg~=21503 do if Tg<=33834 then if Tg<33427 then ga=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp],Ul)if not(ga)then Tg=Sc[-4392]or Tf(12430,-4392,24005)continue else Tg=Sc[9018]or Tf(1817,9018,20625)continue end Tg=61126 elseif Tg>33427 then Nb['table']['remove'](rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp],ga);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
pa['Destroy'](pa);;
yk['BannerNotify']
{
  ['Header']='Successfully Removed',['Description']='You\'ve removed '..qn..' from the group.',['Icon']='rbxassetid://11326877488'
}
;;
Tg=Sc[28245]or Tf(86072,28245,51244)else yk['BannerNotify']
{
  ['Header']='Failed to Remove',['Description']='An error occurred upon removing rank.',['Icon']='rbxassetid://11419713314'
}
;;
Tg=Sc[11301]or Tf(89138,11301,50386)end else Tg=Sc[-674]or Tf(5114,-674,44069)continue end end end)end end);;
Vi['MainGroup']['Unlink']['MouseButton1Click']['Connect'](Vi['MainGroup']['Unlink']['MouseButton1Click'],function()local Va,Hd,Rj,tq;;
Rj,tq=function(_b,O,Hj)tq[Hj]=ih(O,38580)-ih(_b,29942)return tq[Hj]end,
{
}
;;
Va=tq[20099]or Rj(2261,117829,20099)repeat if Va>45755 then Hd=rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp]if not(Hd)then Va=tq[-10546]or Rj(25461,23690,-10546)continue else Va=tq[-8125]or Rj(22937,41516,-8125)continue end Va=21790 elseif Va>=21790 then if Va>21790 then yk['BannerNotify']
{
  ['Header']='Failed to Unlink',['Description']='An error occurred upon unlinking pass.',['Icon']='rbxassetid://11419713314'
}
;;
Va=tq[10784]or Rj(33392,122128,10784)else Va=tq[26946]or Rj(53755,17464,26946)continue end else rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp]=nil;;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
Vi['Destroy'](Vi);;
yk['BannerNotify']
{
  ['Header']='Successfully Unlinked',['Description']='You\'ve unlinked '..pi['Name']..'.',['Icon']='rbxassetid://11422930594'
}
;;
Va=tq[1646]or Rj(42680,111064,1646)end until Va==11647 end)for Up,Wj in pi['Roles']do if not Nb['table']['find'](In,Wj['Rank'])then continue end local mk=Zh['Storage']['Items']['RankItem']['Clone'](Zh['Storage']['Items']['RankItem']);;
mk['Name']=Wj['Rank'];;
mk['LayoutOrder']=-Wj['Rank'];;
mk['RankName']['Text']=Wj['Name']..' (Rank: '..Wj['Rank']..')';;
mk['Parent']=Vi;;
mk['Unlink']['MouseButton1Click']['Connect'](mk['Unlink']['MouseButton1Click'],function()local om,gd,hk,va;;
om,va=
{
}
,function(pg,q,Ya)om[pg]=ih(q,47491)-ih(Ya,62759)return om[pg]end;;
hk=om[29899]or va(29899,100371,14420)while hk~=63774 do if hk<26508 then if hk>5761 then gd=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp],Wj['Rank'])if not(gd)then hk=om[-6122]or va(-6122,15867,39120)continue else hk=om[30751]or va(30751,127462,5630)continue end hk=32474 else yk['BannerNotify']
{
  ['Header']='Failed to Remove',['Description']='An error occurred upon removing rank.',['Icon']='rbxassetid://11419713314'
}
;;
hk=om[-10997]or va(-10997,3564,49330)end elseif hk<=26508 then Nb['table']['remove'](rh['CurrentlyLoaded']['Access']['LinkGroups'][Gp],gd);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
mk['Destroy'](mk);;
yk['BannerNotify']
{
  ['Header']='Successfully Removed',['Description']='You\'ve removed '..Wj['Name']..' (Rank:'..Wj['Rank']..') from the group.',['Icon']='rbxassetid://11326877488'
}
;;
hk=om[-1898]or va(-1898,121625,5863)else hk=om[8078]or va(8078,18165,62335)continue end end end)end end for ne,Lm in ff['Access']['LinkPlayers']do local vp,Lo=ue['GetNameFromUserIdAsync'](ue,Lm),Zh['Storage']['Items']['PlayerItem']['Clone'](Zh['Storage']['Items']['PlayerItem']);;
Lo['Name']=Lm;;
Lo['Profile']['Image']=u_['GetPlayerThumbnail'](Lm);;
Lo['Username']['Text']='@'..vp;;
Lo['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Content'];;
Lo['Unlink']['MouseButton1Click']['Connect'](Lo['Unlink']['MouseButton1Click'],function()local _g,Ka,sc,Ma;;
_g,Ka=
{
}
,function(sb,_e,if_)_g[if_]=ih(sb,17752)-ih(_e,48564)return _g[if_]end;;
Ma=_g[-18909]or Ka(14083,47920,-18909)while Ma~=33052 do if Ma<=28990 then if Ma>27607 then Nb['table']['remove'](rh['CurrentlyLoaded']['Access']['LinkPlayers'],sc);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
Lo['Destroy'](Lo);;
yk['BannerNotify']
{
  ['Header']='Successfully Unlinked',['Description']='You\'ve unlinked @'..vp..'.',['Icon']='rbxassetid://11422930594'
}
;;
Ma=_g[-23346]or Ka(36900,49758,-23346)elseif Ma<=21906 then Ma=_g[18701]or Ka(51301,45461,18701)continue else sc=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkPlayers'],Lm)if sc then Ma=_g[24979]or Ka(57609,36519,24979)continue else Ma=_g[20621]or Ka(51464,48656,20621)continue end Ma=21906 end else yk['BannerNotify']
{
  ['Header']='Failed to Unlink',['Description']='An error occurred upon unlinking player.',['Icon']='rbxassetid://11419713314'
}
;;
Ma=_g[27654]or Ka(46423,10185,27654)end end end)end for oq,aq in ff['CustomSections']do local pe=Zh['Storage']['Items']['SectionItem']['Clone'](Zh['Storage']['Items']['SectionItem']);;
pe['Name']=oq;;
pe['MainSection']['SectionName']['Text']=aq['Name'];;
pe['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content'];;
pe['MainSection']['Delete']['MouseButton1Click']['Connect'](pe['MainSection']['Delete']['MouseButton1Click'],function()local Ua,pp,xf,wc;;
xf,pp=function(Me,Gm,Mm)pp[Gm]=ih(Me,39499)-ih(Mm,42206)return pp[Gm]end,
{
}
;;
wc=pp[-11029]or xf(117203,-11029,20969)repeat if wc<24172 then if wc>10933 then Ua=rh['CurrentlyLoaded']['CustomSections'][oq]if Ua then wc=pp[-4499]or xf(55356,-4499,45852)continue else wc=pp[9262]or xf(126414,9262,14000)continue end wc=pp[14182]or xf(64565,14182,44236)else rh['CurrentlyLoaded']['CustomSections'][oq]=nil;;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
pe['Destroy'](pe);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted '..aq['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
wc=pp[-16576]or xf(118636,-16576,21093)end elseif wc<=24172 then wc=pp[6454]or xf(111372,6454,19998)continue else yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting this section.',['Icon']='rbxassetid://11419713314'
}
;;
wc=pp[-12221]or xf(30738,-12221,10035)end until wc==16007 end);;
pe['AddField']['Field']['FocusLost']['Connect'](pe['AddField']['Field']['FocusLost'],function(wi)if not(not wi)then else return end local dd=Nb['tonumber'](pe['AddField']['Field']['Text']);;
pe['AddField']['Field']['Text']=''if Nb['table']['find'](rh['CurrentlyLoaded']['CustomSections'][oq]['Songs'],dd)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The Song Id is already added.',['Icon']='rbxassetid://11419713314'
}
return end if not(#rh['CurrentlyLoaded']['CustomSections'][oq]['Songs']==30)then else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='You reached the maximum of 30 songs.',['Icon']='rbxassetid://11419713314'
}
return end if not(dd)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Song Id is invalid.',['Icon']='rbxassetid://11419713314'
}
else Nb['table']['insert'](rh['CurrentlyLoaded']['CustomSections'][oq]['Songs'],dd);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true local mo=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
mo['Name']=dd;;
mo['SongId']['Text']=dd;;
mo['Parent']=pe;;
mo['Delete']['MouseButton1Click']['Connect'](mo['Delete']['MouseButton1Click'],function()local sg,xo,Rf,pl;;
xo,sg=function(Qa,ke,Lf)sg[ke]=ih(Lf,4529)-ih(Qa,22258)return sg[ke]end,
{
}
;;
Rf=sg[-32331]or xo(14970,-32331,58303)while Rf~=55114 do if Rf>33317 then pl=Nb['table']['find'](rh['CurrentlyLoaded']['CustomSections'][oq]['Songs'],dd)if not(pl)then Rf=sg[-5846]or xo(17110,-5846,16907)continue else Rf=sg[4822]or xo(48804,4822,71240)continue end Rf=33317 elseif Rf<=16278 then if Rf<=8099 then Nb['table']['remove'](rh['CurrentlyLoaded']['CustomSections'][oq]['Songs'],pl);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
mo['Destroy'](mo);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..aq['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
Rf=sg[-28539]or xo(30399,-28539,46019)else yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
Rf=sg[15403]or xo(63878,15403,73768)end else Rf=sg[-26779]or xo(1592,-26779,80293)continue end end end)end end)for Zn,wj in aq['Songs']do local Ci=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
Ci['Name']=wj;;
Ci['SongId']['Text']=wj;;
Ci['Parent']=pe;;
Ci['Delete']['MouseButton1Click']['Connect'](Ci['Delete']['MouseButton1Click'],function()local Dm,Kh,Ri,Fl;;
Fl,Ri=function(pq,Cl,qb)Ri[pq]=ih(qb,13427)-ih(Cl,15368)return Ri[pq]end,
{
}
;;
Kh=Ri[-28633]or Fl(-28633,24336,45268)repeat if Kh<=24090 then if Kh>=11829 then if Kh<=11829 then Kh=Ri[13648]or Fl(13648,12550,43477)continue else Nb['table']['remove'](rh['CurrentlyLoaded']['CustomSections'][oq]['Songs'],Dm);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
Ci['Destroy'](Ci);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..aq['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
Kh=Ri[21397]or Fl(21397,43886,61928)end else Dm=Nb['table']['find'](rh['CurrentlyLoaded']['CustomSections'][oq]['Songs'],wj)if not(Dm)then Kh=Ri[26730]or Fl(26730,22692,91751)continue else Kh=Ri[13529]or Fl(13529,30449,40288)continue end Kh=11829 end else yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
Kh=Ri[-12550]or Fl(-12550,14226,3516)end until Kh==37016 end)end end if ff['Stations']['AutoStart']==''then cg=Nj[32718]or No(29128,87494,32718)continue else cg=Nj[-2878]or No(41399,44160,-2878)continue end cg=63765 end elseif cg>51615 then ff=Xm(N)if ff~=nil and ff['__iter']~=nil then cg=Nj[3589]or No(33550,52715,3589)continue elseif rd(N)=='table'then cg=Nj[-7274]or No(27076,69826,-7274)continue end cg=Nj[-28870]or No(37945,23896,-28870)else if not(sj['HasTag'](sj,'MastersOnboardingTemplate'))then cg=Nj[-28341]or No(46799,31574,-28341)continue else cg=Nj[-12207]or No(42223,17000,-12207)continue end cg=Nj[7036]or No(26499,43746,7036)end elseif cg>=35690 then if cg<=37318 then if cg<=35690 then ff,N=Fg['GetConfigurationAsync'](),Fg['GetStationsAsync']()if not ff or not N then cg=Nj[5488]or No(48350,61835,5488)continue end cg=Nj[1248]or No(20754,62860,1248)else Nb['SwitchToggle'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['PermitEveryone']['Switch'],true);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Visible']=false;;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Visible']=false;;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Visible'],cg=false,Nj[19286]or No(8239,100166,19286)end else if not(rh['Loading'])then cg=Nj[20373]or No(60701,27779,20373)continue else cg=Nj[-6133]or No(5650,81322,-6133)continue end cg=14939 end elseif cg<32640 then th_,sj,iq=of(th_);;
cg=Nj[-22876]or No(31133,52518,-22876)elseif cg<=32640 then N,Zm,jf=ff['__iter'](N);;
cg=Nj[-2401]or No(54654,7175,-2401)else N,Zm,jf=of(N);;
cg=Nj[-15406]or No(60217,9816,-15406)end elseif cg<15790 then if cg<=10398 then if cg>=9541 then if cg<=9541 then rh['CurrentlyLoaded']=ff;;
rh['LoadedStations']=N if not(ff['Access']['PermitEveryone'])then cg=Nj[-13185]or No(20528,74441,-13185)continue else cg=Nj[-20758]or No(41584,57131,-20758)continue end cg=Nj[-5020]or No(28310,113103,-5020)else sj['Destroy'](sj);;
cg=Nj[27872]or No(30149,48300,27872)end elseif cg>508 then return else th_,sj=N(Zm,jf);;
jf=th_ if jf==nil then cg=Nj[14813]or No(60405,36874,14813)else cg=51615 end end elseif cg<=12089 then jf=Xm(th_)if jf~=nil and jf['__iter']~=nil then cg=Nj[11429]or No(7789,66039,11429)continue elseif not(rd(th_)=='table')then cg=Nj[1339]or No(55877,43374,1339)continue else cg=Nj[-28727]or No(23726,69723,-28727)continue end cg=Nj[-22722]or No(24127,79256,-22722)else rh['Loading']=true;;
kp();;
N,Zm,jf=Ip['Configuration']['Content']['Scroll']['Content']['GetDescendants'](Ip['Configuration']['Content']['Scroll']['Content'])if rd(N)~='function'then cg=Nj[20210]or No(43644,66199,20210)continue end cg=Nj[-24699]or No(45308,29061,-24699)end elseif cg<24350 then if cg<18741 then th_,sj,iq=rh['LoadedStations']if rd(th_)~='function'then cg=Nj[-11655]or No(57922,31328,-11655)continue end cg=Nj[19143]or No(48293,38414,19143)elseif cg>18741 then th_,sj,iq=jf['__iter'](th_);;
cg=Nj[-14978]or No(62679,24560,-14978)else cg,Zm=Nj[-17537]or No(27779,112562,-17537),Zf['Name']continue end elseif cg>30052 then rh['Loading']=false return elseif cg>=25662 then if cg>25662 then Nb['SwitchToggle'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['PermitEveryone']['Switch'],false);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Visible']=true;;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Visible']=true;;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Visible'],cg=true,Nj[-23712]or No(51969,72816,-23712)else F,Zf=th_(sj,iq);;
iq=F if iq==nil then cg=62412 else cg=24350 end end else if not(Zf['StationId']==ff['Stations']['AutoStart'])then cg=Nj[-10718]or No(19416,71931,-10718)continue else cg=Nj[12211]or No(21552,53914,12211)continue end cg=Nj[384]or No(9363,69172,384)end until cg==47104 end Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['PermitEveryone']['MouseButton1Click']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['PermitEveryone']['MouseButton1Click'],function()local Ql,fc,Qj;;
Qj,fc=function(je,Yn,Kn)fc[Kn]=ih(Yn,41864)-ih(je,60827)return fc[Kn]end,
{
}
;;
Ql=fc[21654]or Qj(22861,118869,21654)while Ql~=36492 do if Ql<=50970 then if Ql>=48541 then if Ql>=48903 then if Ql<=48903 then if rh['Loading']then Ql=fc[-11300]or Qj(39555,129629,-11300)continue end Ql=fc[17531]or Qj(33416,123861,17531)else return end else rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true if rh['CurrentlyLoaded']['Access']['PermitEveryone']then Ql=fc[-4724]or Qj(52674,27543,-4724)continue else Ql=fc[-12507]or Qj(35131,130538,-12507)continue end Ql=21541 end elseif Ql<=21541 then Ql=fc[-23409]or Qj(33432,24071,-23409)continue else rh['CurrentlyLoaded']['Access']['PermitEveryone']=false;;
u_['SwitchToggle'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['PermitEveryone']['Switch'],false);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Visible']=true;;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Visible']=true;;
Ql,Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Visible']=fc[-26178]or Qj(22394,109710,-26178),true end elseif Ql>58045 then rh['CurrentlyLoaded']['Access']['PermitEveryone']=true;;
u_['SwitchToggle'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['PermitEveryone']['Switch'],true);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Visible']=false;;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Visible']=false;;
Ql,Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Visible']=fc[27300]or Qj(26277,31979,27300),false elseif Ql<=53578 then if not(not rh['CurrentlyLoaded'])then Ql=fc[16469]or Qj(27332,124788,16469)continue else Ql=fc[-29419]or Qj(55673,22644,-29419)continue end Ql=48541 else return end end end);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Content']['AddField']['Field']['FocusLost']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Content']['AddField']['Field']['FocusLost'],function(Hf)if not(not Hf)then else return end if rh['Loading']then return end if not(not rh['CurrentlyLoaded'])then else return end local to=Nb['tonumber'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Content']['AddField']['Field']['Text']);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Content']['AddField']['Field']['Text']=''if not(to)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Group Id is invalid.',['Icon']='rbxassetid://11419713314'
}
else if not(rh['CurrentlyLoaded']['Access']['LinkGroups'][to])then else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='This group is already added.',['Icon']='rbxassetid://11419713314'
}
return end local t_,_q=Nb['pcall'](function()return xp['GetGroupInfoAsync'](xp,to)end)if not(not t_)then else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Group Id is invalid.',['Icon']='rbxassetid://11419713314'
}
return end rh['CurrentlyLoaded']['Access']['LinkGroups'][to]=
{
}
;;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true local Vm=Zh['Storage']['Items']['GroupItem']['Clone'](Zh['Storage']['Items']['GroupItem']);;
Vm['Name']=to;;
Vm['MainGroup']['Profile']['Image']=_q['EmblemUrl'];;
Vm['MainGroup']['GroupName']['Text']=_q['Name'];;
Vm['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkGroups']['Content'];;
Vm['MainGroup']['AddRank']['MouseButton1Click']['Connect'](Vm['MainGroup']['AddRank']['MouseButton1Click'],function()local Xc=
{
}
for ua,co in _q['Roles']do if not(Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkGroups'][to],co['Rank']))then else continue end Nb['table']['insert'](Xc,
{
  ['Name']=co['Name']..' (Rank: '..co['Rank']..')',['Icon']='',['ExtraData']=co['Rank']
}
)end local ep,Pe=n_['PromptOptions']
{
  ['Options']=Xc
}
if not(ep~=nil)then else local gg=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkGroups'][to],Pe)if gg then yk['BannerNotify']
{
  ['Header']='Failed to Add Rank',['Description']='This rank is already added.',['Icon']='rbxassetid://11419713314'
}
return else Nb['table']['insert'](rh['CurrentlyLoaded']['Access']['LinkGroups'][to],Pe);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true end local bc=Zh['Storage']['Items']['RankItem']['Clone'](Zh['Storage']['Items']['RankItem']);;
bc['Name']=Pe;;
bc['LayoutOrder']=-Pe;;
bc['RankName']['Text']=ep;;
bc['Parent']=Vm;;
bc['Unlink']['MouseButton1Click']['Connect'](bc['Unlink']['MouseButton1Click'],function()local ia,cn,Vc,oj;;
cn,oj=
{
}
,function(Il,ni_,Qb)cn[ni_]=ih(Qb,22517)-ih(Il,58980)return cn[ni_]end;;
ia=cn[25296]or oj(58619,25296,20884)while ia~=59484 do if ia>53599 then Nb['table']['remove'](rh['CurrentlyLoaded']['Access']['LinkGroups'][to],Vc);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
bc['Destroy'](bc);;
yk['BannerNotify']
{
  ['Header']='Successfully Removed',['Description']='You\'ve removed '..ep..' from the group.',['Icon']='rbxassetid://11326877488'
}
;;
ia=cn[19354]or oj(64716,19354,30980)elseif ia<5193 then Vc=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkGroups'][to],Pe)if Vc then ia=cn[20058]or oj(60632,20058,48204)continue else ia=cn[-12403]or oj(20114,-12403,77216)continue end ia=cn[2627]or oj(22708,2627,34028)elseif ia<=5193 then ia=cn[12714]or oj(2646,12714,99195)continue else yk['BannerNotify']
{
  ['Header']='Failed to Remove',['Description']='An error occurred upon removing rank.',['Icon']='rbxassetid://11419713314'
}
;;
ia=cn[30938]or oj(57556,30938,19724)end end end)end end);;
Vm['MainGroup']['Unlink']['MouseButton1Click']['Connect'](Vm['MainGroup']['Unlink']['MouseButton1Click'],function()local Bd,Md,gb,uh;;
Md,Bd=
{
}
,function(yf,Qc,np)Md[yf]=ih(Qc,5198)-ih(np,57369)return Md[yf]end;;
gb=Md[19994]or Bd(19994,91553,3386)while gb~=44316 do if gb>=33996 then if gb<=33996 then uh=rh['CurrentlyLoaded']['Access']['LinkGroups'][to]if uh then gb=Md[6528]or Bd(6528,26683,34124)continue else gb=Md[30160]or Bd(30160,92512,30752)continue end gb=Md[10916]or Bd(10916,42332,38851)else yk['BannerNotify']
{
  ['Header']='Failed to Unlink',['Description']='An error occurred upon unlinking pass.',['Icon']='rbxassetid://11419713314'
}
;;
gb=Md[-4471]or Bd(-4471,36961,43758)end elseif gb<=5920 then rh['CurrentlyLoaded']['Access']['LinkGroups'][to]=nil;;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
Vm['Destroy'](Vm);;
yk['BannerNotify']
{
  ['Header']='Successfully Unlinked',['Description']='You\'ve unlinked '.._q['Name']..'.',['Icon']='rbxassetid://11422930594'
}
;;
gb=Md[-4355]or Bd(-4355,57289,29270)else gb=Md[863]or Bd(863,53142,52901)continue end end end)end end);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Content']['AddField']['Field']['FocusLost']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Content']['AddField']['Field']['FocusLost'],function(Bp)if not(not Bp)then else return end if rh['Loading']then return end if not(not rh['CurrentlyLoaded'])then else return end local rc=Nb['tonumber'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Content']['AddField']['Field']['Text']);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Content']['AddField']['Field']['Text']=''if rc then if not(Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkPasses'],rc))then else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='This pass is already added.',['Icon']='rbxassetid://11419713314'
}
return end local qk,Aa=Nb['pcall'](function()return b_['GetProductInfoAsync'](b_,rc,Nb['Enum']['InfoType']['GamePass'])end)if not(not qk)then else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Pass Id is invalid.',['Icon']='rbxassetid://11419713314'
}
return end Nb['table']['insert'](rh['CurrentlyLoaded']['Access']['LinkPasses'],rc);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true local al=Zh['Storage']['Items']['PassItem']['Clone'](Zh['Storage']['Items']['PassItem']);;
al['Name']=rc;;
al['Profile']['Image']=u_['AssetToTexture'](Aa['IconImageAssetId']);;
al['PassName']['Text']=Aa['Name'];;
al['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPasses']['Content'];;
al['Unlink']['MouseButton1Click']['Connect'](al['Unlink']['MouseButton1Click'],function()local lp,Qm,bd,lk;;
Qm,lk=function(vq,Dd,eg)lk[eg]=ih(vq,61671)-ih(Dd,47946)return lk[eg]end,
{
}
;;
lp=lk[-27284]or Qm(108831,5568,-27284)while lp~=12177 do if lp>45830 then yk['BannerNotify']
{
  ['Header']='Failed to Unlink',['Description']='An error occurred upon unlinking pass.',['Icon']='rbxassetid://11419713314'
}
;;
lp=lk[7664]or Qm(1480,22595,7664)elseif lp<43886 then lp=lk[-31796]or Qm(127176,27604,-31796)continue elseif lp>43886 then Nb['table']['remove'](rh['CurrentlyLoaded']['Access']['LinkPasses'],bd);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
al['Destroy'](al);;
yk['BannerNotify']
{
  ['Header']='Successfully Unlinked',['Description']='You\'ve unlinked '..Aa['Name']..'.',['Icon']='rbxassetid://11422930594'
}
;;
lp=lk[-5790]or Qm(15746,117,-5790)else bd=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkPasses'],rc)if not(bd)then lp=lk[26421]or Qm(4782,37242,26421)continue else lp=lk[2287]or Qm(125810,54213,2287)continue end lp=lk[-1680]or Qm(25615,14728,-1680)end end end)else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Pass Id is invalid.',['Icon']='rbxassetid://11419713314'
}
end end);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Content']['AddField']['Field']['FocusLost']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Content']['AddField']['Field']['FocusLost'],function(Yl)if not Yl then return end if rh['Loading']then return end if not rh['CurrentlyLoaded']then return end local D=Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Content']['AddField']['Field']['Text']local Oi,hm=Nb['pcall'](function()return ue['GetUserIdFromNameAsync'](ue,D)end);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Content']['AddField']['Field']['Text']=''if not Oi then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Username is invalid.',['Icon']='rbxassetid://11419713314'
}
return end if Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkPlayers'],hm)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='This player is already added.',['Icon']='rbxassetid://11419713314'
}
return end Nb['table']['insert'](rh['CurrentlyLoaded']['Access']['LinkPlayers'],hm);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true local Tk=Zh['Storage']['Items']['PlayerItem']['Clone'](Zh['Storage']['Items']['PlayerItem']);;
Tk['Name']=hm;;
Tk['Profile']['Image']=u_['GetPlayerThumbnail'](hm);;
Tk['Username']['Text']='@'..D;;
Tk['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['LinkPlayers']['Content'];;
Tk['Unlink']['MouseButton1Click']['Connect'](Tk['Unlink']['MouseButton1Click'],function()local ul,Em,Wo,rm;;
ul,rm=function(Ik,Pg,Ej)rm[Ik]=ih(Ej,24767)-ih(Pg,38174)return rm[Ik]end,
{
}
;;
Em=rm[4485]or ul(4485,56840,53482)repeat if Em>25919 then yk['BannerNotify']
{
  ['Header']='Failed to Unlink',['Description']='An error occurred upon unlinking player.',['Icon']='rbxassetid://11419713314'
}
;;
Em=rm[5701]or ul(5701,220,49535)elseif Em<=16998 then if Em>3070 then Nb['table']['remove'](rh['CurrentlyLoaded']['Access']['LinkPlayers'],Wo);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
Tk['Destroy'](Tk);;
yk['BannerNotify']
{
  ['Header']='Successfully Unlinked',['Description']='You\'ve unlinked @'..D..'.',['Icon']='rbxassetid://11422930594'
}
;;
Em=rm[-16540]or ul(-16540,14875,56252)else Em=rm[-8725]or ul(-8725,61571,36682)continue end else Wo=Nb['table']['find'](rh['CurrentlyLoaded']['Access']['LinkPlayers'],hm)if Wo then Em=rm[20516]or ul(20516,55998,62137)continue else Em=rm[8655]or ul(8655,18567,79921)continue end Em=3070 end until Em==35416 end)end);;
Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content']['AddField']['Field']['FocusLost']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content']['AddField']['Field']['FocusLost'],function(yd)if not yd then return end if rh['Loading']then return end if not rh['CurrentlyLoaded']then return end local eh=Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content']['AddField']['Field']['Text']if Nb['string']['len'](eh)<10 then yk['BannerNotify']
{
  ['Header']='Failed to Create Section.',['Description']='Section name must at least be 10 characters long',['Icon']='rbxassetid://11419713314'
}
return end local kg=Nb['tick']();;
Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content']['AddField']['Field']['Text']='';;
rh['CurrentlyLoaded']['CustomSections'][kg]=
{
  ['Name']=eh,['Songs']=
  {
  }
}
;;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true local rn=Zh['Storage']['Items']['SectionItem']['Clone'](Zh['Storage']['Items']['SectionItem']);;
rn['Name']=kg;;
rn['MainSection']['SectionName']['Text']=eh;;
rn['Parent']=Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content'];;
rn['MainSection']['Delete']['MouseButton1Click']['Connect'](rn['MainSection']['Delete']['MouseButton1Click'],function()local Wc,_j,Ol,Jn;;
Jn,Ol=function(rl,Gj,pn)Ol[pn]=ih(Gj,29890)-ih(rl,26658)return Ol[pn]end,
{
}
;;
Wc=Ol[10318]or Jn(10241,50997,10318)while Wc~=2908 do if Wc>41395 then yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting this section.',['Icon']='rbxassetid://11419713314'
}
;;
Wc=Ol[-32568]or Jn(43809,69748,-32568)elseif Wc>29652 then Wc=Ol[-31785]or Jn(59965,63929,-31785)continue elseif Wc<=8182 then rh['CurrentlyLoaded']['CustomSections'][kg]=nil;;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
rn['Destroy'](rn);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted '..eh..'.',['Icon']='rbxassetid://11326877488'
}
;;
Wc=Ol[4960]or Jn(35874,127345,4960)else _j=rh['CurrentlyLoaded']['CustomSections'][kg]if not(_j)then Wc=Ol[8671]or Jn(51719,126425,8671)continue else Wc=Ol[18777]or Jn(38873,92979,18777)continue end Wc=Ol[-14755]or Jn(33775,129346,-14755)end end end);;
rn['AddField']['Field']['FocusLost']['Connect'](rn['AddField']['Field']['FocusLost'],function(vd)if not(not vd)then else return end local di=Nb['tonumber'](rn['AddField']['Field']['Text']);;
rn['AddField']['Field']['Text']=''if Nb['table']['find'](rh['CurrentlyLoaded']['CustomSections'][kg]['Songs'],di)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The Song Id is already added.',['Icon']='rbxassetid://11419713314'
}
return end if#rh['CurrentlyLoaded']['CustomSections'][kg]['Songs']==30 then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='You reached the maximum of 30 songs.',['Icon']='rbxassetid://11419713314'
}
return end if not(di)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Song Id is invalid.',['Icon']='rbxassetid://11419713314'
}
else Nb['table']['insert'](rh['CurrentlyLoaded']['CustomSections'][kg]['Songs'],di);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true local ok=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
ok['Name']=di;;
ok['SongId']['Text']=di;;
ok['Parent']=rn;;
ok['Delete']['MouseButton1Click']['Connect'](ok['Delete']['MouseButton1Click'],function()local Y,jq,Zd,kj;;
Y,kj=
{
}
,function(Yf,wg,de)Y[Yf]=ih(de,38631)-ih(wg,25313)return Y[Yf]end;;
Zd=Y[19650]or kj(19650,33304,111966)while Zd~=43740 do if Zd>=11086 then if Zd<=11086 then Nb['table']['remove'](rh['CurrentlyLoaded']['CustomSections'][kg]['Songs'],jq);;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true;;
ok['Destroy'](ok);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..eh..'.',['Icon']='rbxassetid://11326877488'
}
;;
Zd=Y[21922]or kj(21922,7508,13429)else jq=Nb['table']['find'](rh['CurrentlyLoaded']['CustomSections'][kg]['Songs'],di)if not(jq)then Zd=Y[-8987]or kj(-8987,35890,103684)continue else Zd=Y[-12913]or kj(-12913,55702,28706)continue end Zd=Y[-14356]or kj(-14356,16437,54102)end elseif Zd<=5392 then yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
Zd=Y[-6157]or kj(-6157,27560,47809)else Zd=Y[-17231]or kj(-17231,41749,129591)continue end end end)end end)end);;
Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Autostart']['Dropdown']['More']['MouseButton1Click']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Autostart']['Dropdown']['More']['MouseButton1Click'],function()local Bo,Ud,Nm,W,Oa,Ml,Ap,dc,bi,Cp;;
W,Ml=
{
}
,function(Ac,wb,Ek)W[Ac]=ih(Ek,17440)-ih(wb,48594)return W[Ac]end;;
Ud=W[-13714]or Ml(-13714,42259,12824)repeat if Ud<=23927 then if Ud>15899 then if Ud>22380 then if not(rh['Loading'])then Ud=W[16656]or Ml(16656,30076,91194)continue else Ud=W[22548]or Ml(22548,10489,37041)continue end Ud=W[20154]or Ml(20154,13213,41371)elseif Ud<19315 then return elseif Ud<=19315 then Oa,dc=Ap(Bo,bi);;
bi=Oa if bi==nil then Ud=2853 else Ud=W[906]or Ml(906,35697,57643)end else if not rh['CurrentlyLoaded']then Ud=W[21344]or Ml(21344,49791,55320)continue end Ud=W[1462]or Ml(1462,13455,33624)end elseif Ud>=8378 then if Ud<13258 then Ap,Bo,bi=of(Ap);;
Ud=W[8333]or Ml(8333,39052,13553)elseif Ud<=13258 then Ud=W[26041]or Ml(26041,13820,80688)continue else if#rh['LoadedStations']==0 then Ud=W[13609]or Ml(13609,17191,126671)continue end Ud=W[-14623]or Ml(-14623,23029,116699)end elseif Ud>2853 then return else Cp,Ap=n_['PromptOptions']
{
  ['Options']=Nm
}
if not(Cp~=nil)then Ud=W[-15270]or Ml(-15270,58572,51400)continue else Ud=W[16815]or Ml(16815,3716,93847)continue end Ud=13258 end elseif Ud<=40916 then if Ud>30561 then Nm=
{
}
;;
Ap,Bo,bi=rh['LoadedStations']if rd(Ap)~='function'then Ud=W[32440]or Ml(32440,43659,84312)continue end Ud=W[-23028]or Ml(-23028,36966,15623)elseif Ud>28264 then rh['CurrentlyLoaded']['Stations']['AutoStart']=Ap['StationId'];;
Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Autostart']['Dropdown']['StationSelected']['Text']=Ap['Name'];;
rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible'],Ud=true,W[8215]or Ml(8215,44146,330)elseif Ud<=28106 then if rd(Ap)=='table'then Ud=W[-13105]or Ml(-13105,21818,85378)continue end Ud=W[-32142]or Ml(-32142,55958,63127)else Nb['table']['insert'](Nm,
{
  ['Name']=dc['Name'],['Icon']=dc['Cover'],['ExtraData']=dc
}
);;
Ud=W[29970]or Ml(29970,22204,94913)end elseif Ud<49191 then yk['BannerNotify']
{
  ['Header']='Failed to Load Stations',['Description']='You have no stations created or added.',['Icon']='rbxassetid://11419713314'
}
return elseif Ud<=49191 then Ap,Bo,bi=Cp['__iter'](Ap);;
Ud=W[30923]or Ml(30923,27063,89080)else Cp=Xm(Ap)if not(Cp~=nil and Cp['__iter']~=nil)then Ud=W[-11510]or Ml(-11510,55266,37850)continue else Ud=W[-25403]or Ml(-25403,16584,129377)continue end Ud=W[19847]or Ml(19847,49078,2551)end until Ud==63202 end);;
Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['OnlineStations']['MouseButton1Click']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['OnlineStations']['MouseButton1Click'],function()local Rk,vk,df;;
df,Rk=function(Ja,P,si)Rk[Ja]=ih(P,11670)-ih(si,13139)return Rk[Ja]end,
{
}
;;
vk=Rk[-28349]or df(-28349,106575,54237)while vk~=57887 do if vk>40132 then if vk<44363 then rh['CurrentlyLoaded']['Stations']['OnlineStations']=true;;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['SubtextDisabled']['Visible']=false;;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['SubtextEnabled']['Visible']=true;;
u_['SwitchToggle'](Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['OnlineStations']['Switch'],true);;
vk=Rk[3177]or df(3177,98211,16615)elseif vk<=44363 then if rh['Loading']then vk=Rk[-28770]or df(-28770,66843,57466)continue end vk=36556 else vk=Rk[9055]or df(9055,104332,58536)continue end elseif vk<=36556 then if vk>21860 then if not rh['CurrentlyLoaded']then vk=Rk[-11477]or df(-11477,58718,8023)continue end vk=39634 elseif vk<=10064 then rh['CurrentlyLoaded']['Stations']['OnlineStations']=false;;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['SubtextDisabled']['Visible']=true;;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['SubtextEnabled']['Visible']=false;;
u_['SwitchToggle'](Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['OnlineStations']['Switch'],false);;
vk=Rk[4549]or df(4549,65546,31816)else return end elseif vk<=39634 then rh['HasChanged']=true;;
Ip['Configuration']['Content']['Actions']['Visible']=true if not(rh['CurrentlyLoaded']['Stations']['OnlineStations'])then vk=Rk[-4385]or df(-4385,84055,35842)continue else vk=Rk[22422]or df(22422,62685,33448)continue end vk=Rk[-25979]or df(-25979,109687,36915)else return end end end);;
Ip['Configuration']['Content']['Scroll']['Content']['Access']['Header']['MouseButton1Click']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Access']['Header']['MouseButton1Click'],function()local a_,bk,I;;
bk,a_=
{
}
,function(Po,sm,Yd)bk[Yd]=ih(Po,3523)-ih(sm,33558)return bk[Yd]end;;
I=bk[-30015]or a_(51846,41542,-30015)while I~=26061 do if I<50373 then if I>2947 then if not(Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['Visible'])then I=bk[-17066]or a_(99970,17770,-17066)continue else I=bk[13158]or a_(113437,24939,13158)continue end I=bk[-29077]or a_(44207,5887,-29077)else I=bk[-5050]or a_(79146,20490,-5050)continue end elseif I>50373 then Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['Visible']=false;;
Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Access']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
)['Play'](Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Access']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
));;
I=bk[-2699]or a_(41232,8774,-2699)else Ip['Configuration']['Content']['Scroll']['Content']['Access']['Content']['Visible']=true;;
Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Access']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
)['Play'](Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Access']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
));;
I=bk[-739]or a_(10620,39466,-739)end end end);;
Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Header']['MouseButton1Click']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Header']['MouseButton1Click'],function()local fe,Yh,fp;;
fe,fp=function(gj,ap,sh)fp[ap]=ih(gj,38342)-ih(sh,54637)return fp[ap]end,
{
}
;;
Yh=fp[367]or fe(120654,367,29348)repeat if Yh<16071 then if Yh<=9029 then Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content']['Visible']=true;;
Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
)['Play'](Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
));;
Yh=fp[23920]or fe(7876,23920,39601)else Yh=fp[7685]or fe(58998,7685,63376)continue end elseif Yh>16071 then if not(Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content']['Visible'])then Yh=fp[11872]or fe(104504,11872,16340)continue else Yh=fp[-4792]or fe(13689,-4792,46229)continue end Yh=fp[14250]or fe(16936,14250,18853)else Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Content']['Visible']=false;;
Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
)['Play'](Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['CustomSections']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
));;
Yh=fp[-19946]or fe(107172,-19946,10577)end until Yh==20659 end);;
Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Header']['MouseButton1Click']['Connect'](Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Header']['MouseButton1Click'],function()local l_,he,kb;;
kb,he=
{
}
,function(Kc,xb,ie)kb[Kc]=ih(xb,20872)-ih(ie,49082)return kb[Kc]end;;
l_=kb[24176]or he(24176,92969,2075)repeat if l_>33597 then Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Visible']=true;;
Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
)['Play'](Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
));;
l_=kb[3668]or he(3668,34766,60595)elseif l_<=33536 then if l_<=24606 then Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Visible']=false;;
Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
)['Play'](Do['Create'](Do,Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
));;
l_=kb[-25574]or he(-25574,97810,5095)else if not(Ip['Configuration']['Content']['Scroll']['Content']['Stations']['Content']['Visible'])then l_=kb[23865]or he(23865,37312,38961)continue else l_=kb[31203]or he(31203,67350,18746)continue end l_=kb[19241]or he(19241,46761,56414)end else l_=kb[-30991]or he(-30991,27495,48655)continue end until l_==14650 end);;
Ip['Configuration']['Content']['Actions']['Save']['MouseButton1Click']['Connect'](Ip['Configuration']['Content']['Actions']['Save']['MouseButton1Click'],Zc);;
Ip['Installation']['Content']['Actions']['Configuration']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Actions']['Configuration']['MouseButton1Click'],function()Nb['PromptProcess'](true);;
Nb['SetPage']('Configuration');;
K();;
Nb['PromptProcess'](false)end);;
Ip['Configuration']['Header']['Actions']['Back']['MouseButton1Click']['Connect'](Ip['Configuration']['Header']['Actions']['Back']['MouseButton1Click'],function()local An,Vh,hj,Yk;;
Vh,Yk=function(lh,Oh,Nn)Yk[lh]=ih(Oh,36567)-ih(Nn,333)return Yk[lh]end,
{
}
;;
An=Yk[-26056]or Vh(-26056,3192,19683)repeat if An<=38021 then if An>=33027 then if An<=33027 then Zc();;
kp();;
Nb['BackPage']();;
An=Yk[-16459]or Vh(-16459,69027,42044)else kp();;
Nb['BackPage']();;
An=Yk[8431]or Vh(8431,31918,5435)end elseif An>9884 then if rh['HasChanged']then An=Yk[-6538]or Vh(-6538,118757,34068)continue else An=Yk[13956]or Vh(13956,15152,36358)continue end An=56835 else kp();;
Nb['BackPage']();;
An=Yk[6618]or Vh(6618,66993,44078)end elseif An>48345 then An=Yk[12956]or Vh(12956,99860,17111)continue else hj=n_['PromptOptions']
{
  ['Header']='You have some unsaved changes...',['Options']=
  {
    {
      ['Name']='Save Changes',['Icon']='rbxassetid://11419703493'
    }
    ,
    {
      ['Name']='Discard Changes',['Icon']='rbxassetid://11326877488'
    }
    ,'SEPARATOR',
    {
      ['Name']='Cancel',['Icon']='rbxassetid://11293981586'
    }
  }
}
if hj=='Save Changes'then An=Yk[-13409]or Vh(-13409,122875,53604)continue elseif not(hj=='Discard Changes')then An=Yk[-22442]or Vh(-22442,104371,14892)continue else An=Yk[18243]or Vh(18243,15566,7385)continue end An=Yk[-13925]or Vh(-13925,82216,61617)end until An==50473 end)local bf=
{
  ['Loading']=false,['HasChanged']=false,['CurrentlyLoaded']=nil
}
local function Ia()bf['HasChanged']=false;;
bf['CurrentlyLoaded']=nil;;
Ip['Stations']['Content']['Actions']['Visible']=false end local function Ng()local Sp,Hp,cc,Sm;;
Hp,Sp=
{
}
,function(yn,Vg,Kj)Hp[Vg]=ih(yn,37302)-ih(Kj,56413)return Hp[Vg]end;;
cc=Hp[28275]or Sp(110730,28275,2703)repeat if cc>41128 then if cc<=52990 then if cc<=47880 then if cc<=45867 then Nb['PromptProcess'](true);;
Sm=Fg['SetStationsAsync'](bf['CurrentlyLoaded'])if Sm then cc=Hp[-22540]or Sp(100342,-22540,23870)continue else cc=Hp[29160]or Sp(111476,29160,23336)continue end cc=Hp[19863]or Sp(104603,19863,10768)else if not(not bf['CurrentlyLoaded'])then cc=Hp[14054]or Sp(130390,14054,16831)continue else cc=Hp[-7085]or Sp(114259,-7085,37969)continue end cc=52990 end else if not(not bf['HasChanged'])then cc=Hp[-18580]or Sp(112200,-18580,43150)continue else cc=Hp[5182]or Sp(16073,5182,53898)continue end cc=45867 end else return end elseif cc<38109 then if cc>=6326 then if cc>6326 then if not(bf['Loading'])then cc=Hp[31232]or Sp(120438,31232,20709)continue else cc=Hp[24968]or Sp(4484,24968,47905)continue end cc=47880 else return end else Nb['PromptProcess'](false);;
cc=Hp[10402]or Sp(7247,10402,40588)continue end elseif cc>=39757 then if cc>39757 then return else yk['BannerNotify']
{
  ['Header']='Failed to Save',['Description']='An error occurred upon saving Stations.',['Icon']='rbxassetid://11419713314'
}
;;
cc=Hp[-151]or Sp(21090,-151,27817)end else yk['BannerNotify']
{
  ['Header']='Successfully Saved',['Description']='Stations are saved successfully.',['Icon']='rbxassetid://11419719540'
}
;;
bf['HasChanged']=false;;
cc,Ip['Stations']['Content']['Actions']['Visible']=Hp[-12125]or Sp(30596,-12125,3855),false end until cc==19240 end local function on(Mj,hg)local Sf,dm,Ln,f_,Pp,nb,Ha,Wm,oi,Td,_i;;
Ln,f_=function(ig,Ld,Oc)f_[Oc]=ih(ig,25667)-ih(Ld,8276)return f_[Oc]end,
{
}
;;
Sf=f_[2197]or Ln(77455,32773,2197)while Sf~=25752 do if Sf>=43643 then if Sf<50510 then if Sf<=43643 then _i,Td,nb=hg if not(rd(_i)~='function')then Sf=f_[-30388]or Ln(7598,18530,-30388)continue else Sf=f_[-26761]or Ln(96448,30561,-26761)continue end Sf=f_[276]or Ln(16158,27122,276)else return Pp,dm end elseif Sf<=50510 then Ha=Xm(_i)if Ha~=nil and Ha['__iter']~=nil then Sf=f_[13677]or Ln(41591,24001,13677)continue elseif rd(_i)=='table'then Sf=f_[-30560]or Ln(52400,30341,-30560)continue end Sf=f_[-29938]or Ln(57132,35308,-29938)else Pp=Wm;;
Sf,dm=f_[2012]or Ln(23889,1807,2012),oi end elseif Sf>=18591 then if Sf<=18591 then _i,Td,nb=Ha['__iter'](_i);;
Sf=f_[-6284]or Ln(22447,609,-6284)else _i,Td,nb=of(_i);;
Sf=f_[-1126]or Ln(19555,13885,-1126)end elseif Sf>4535 then if not(Wm['StationId']==Mj)then Sf=f_[6667]or Ln(32044,10220,6667)continue else Sf=f_[11607]or Ln(33213,14619,11607)continue end Sf=f_[10999]or Ln(198,29338,10999)else oi,Wm=_i(Td,nb);;
nb=oi if nb==nil then Sf=46173 else Sf=15292 end end end end local function _m()local nl,vc,Pi,no_,Bl,Tl,cm,xg,bl;;
Pi,bl=
{
}
,function(Ic,oa,dn)Pi[oa]=ih(Ic,35287)-ih(dn,17180)return Pi[oa]end;;
no_=Pi[15696]or bl(2539,15696,3620)while no_~=44239 do if no_<34879 then if no_>14614 then if no_>=22345 then if no_<=22345 then xg,vc,Tl=cm['__iter'](xg);;
no_=Pi[-8862]or bl(125633,-8862,47636)else nl,Bl=xg(vc,Tl);;
Tl=nl if Tl==nil then no_=Pi[23342]or bl(23983,23342,54736)else no_=42980 end end elseif no_<=15788 then cm,xg=Fg['GetStationsAsync'](),Fg['GetConfigurationAsync']()if not(not cm or not xg)then no_=Pi[21083]or bl(69493,21083,40794)continue else no_=Pi[24724]or bl(18041,24724,61566)continue end no_=43612 else bf['Loading']=true;;
Ia();;
xg,vc,Tl=Ip['Stations']['Content']['Scroll']['GetDescendants'](Ip['Stations']['Content']['Scroll'])if not(rd(xg)~='function')then no_=Pi[18658]or bl(114903,18658,40430)continue else no_=Pi[-14917]or bl(54458,-14917,26505)continue end no_=Pi[7371]or bl(29303,7371,53902)end elseif no_>=13060 then if no_>=14552 then if no_<=14552 then cm=Xm(xg)if cm~=nil and cm['__iter']~=nil then no_=Pi[2178]or bl(122317,2178,49101)continue elseif rd(xg)=='table'then no_=Pi[-12364]or bl(74598,-12364,38316)continue end no_=Pi[6177]or bl(29803,6177,53426)else vc=Nb['GetInSheets']('e2')if not(not vc)then no_=Pi[-24063]or bl(119428,-24063,59545)continue else no_=Pi[-31636]or bl(17664,-31636,30957)continue end no_=Pi[-17317]or bl(121635,-17317,57402)end else if bf['Loading']then no_=Pi[-22839]or bl(23728,-22839,59742)continue end no_=20650 end elseif no_>7244 then return else bf['Loading']=false return end elseif no_<42980 then if no_>36834 then bf['Loading']=false return elseif no_<35108 then bf['Loading'],no_=false,Pi[-24997]or bl(117265,-24997,54763)continue elseif no_<=35108 then Bl['Destroy'](Bl);;
no_=Pi[-11268]or bl(16731,-11268,7522)else for Ca,sd in Tl['values']do local Yo=_h['JSONDecode'](_h,sd[1])if not Yo then continue end local el_=Zh['Storage']['Items']['Station(Big)']['Clone'](Zh['Storage']['Items']['Station(Big)']);;
el_['Name']=Yo['StationId'];;
el_['Util']['Visuals']['Art']['Image']=Yo['Cover'];;
el_['Util']['Visuals']['Fade']['Image']=Yo['Cover'];;
el_['Content']['Description']['Text']=Yo['Description']or 'Station';;
el_['Content']['Title']['Text']=Yo['Name'];;
el_['Parent']=Ip['Stations']['Content']['Scroll']['OnlineStations']['Content'];;
el_['MouseButton1Click']['Connect'](el_['MouseButton1Click'],function()local Fk=n_['PromptOptions']
{
  ['Header']='Copy '..Yo['Name'],['Options']=
  {
    {
      ['Name']='Copy Station',['Icon']='rbxassetid://12974407511'
    }
    ,
    {
      ['Name']='Cancel',['Icon']='rbxassetid://11293981586'
    }
  }
}
if Fk=='Copy Station'then local pm=
{
  ['Name']=Yo['Name'],['Description']=Yo['Description'],['Cover']=Yo['Cover'],['StationId']='MSTATION'..Nb['tick'](),['Updated']=Nb['os']['time'](),['Songs']=Yo['Songs']
}
;;
Nb['table']['insert'](bf['CurrentlyLoaded'],pm);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true local Jm=Zh['Storage']['Items']['StationItem']['Clone'](Zh['Storage']['Items']['StationItem']);;
Jm['Name']=pm['StationId'];;
Jm['MainSection']['Cover']['Image']=pm['Cover'];;
Jm['MainSection']['StationName']['Text']=pm['Name'];;
Jm['Cover']['Field']['Text']=pm['Cover'];;
Jm['Description']['Field']['Text']=pm['Description'];;
Jm['StationName']['Field']['Text']=pm['Name'];;
Jm['Parent']=Ip['Stations']['Content']['Scroll']['CreatedStations']['Content'];;
Jm['MainSection']['Delete']['MouseButton1Click']['Connect'](Jm['MainSection']['Delete']['MouseButton1Click'],function()local Pk,Sb,_o,Xd,Sn;;
Sb,Sn=function(do_,zm,_l)Sn[zm]=ih(do_,20085)-ih(_l,28019)return Sn[zm]end,
{
}
;;
Xd=Sn[-25433]or Sb(102412,-25433,40866)while Xd~=41708 do if Xd>=50045 then if Xd<=50045 then Nb['table']['remove'](bf['CurrentlyLoaded'],_o);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Jm['Destroy'](Jm);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted '..pm['Name']..'.',['Icon']='rbxassetid://11422930594'
}
;;
Xd=Sn[-20552]or Sb(73310,-20552,49228)continue else Pk,_o=on(pm['StationId'],bf['CurrentlyLoaded'])if not(not Pk or not _o)then Xd=Sn[19412]or Sb(67827,19412,61050)continue else Xd=Sn[1585]or Sb(33285,1585,3760)continue end Xd=50045 end else bf['Loading']=false return end end end);;
Jm['Cover']['Field']['FocusLost']['Connect'](Jm['Cover']['Field']['FocusLost'],function(vg)local wh_,Fp,Hc,A,te,Og;;
A,wh_=
{
}
,function(yg,Zb,gp)A[yg]=ih(Zb,47532)-ih(gp,62687)return A[yg]end;;
Og=A[-30719]or wh_(-30719,16152,43536)while Og~=54600 do if Og>=33540 then if Og>47781 then Fp,Og='rbxassetid://'..Fp,A[9904]or wh_(9904,17332,1967)elseif Og>33540 then Og,Fp=A[-17357]or wh_(-17357,64436,53167),Jm['Cover']['Field']['Text']else if Fp then Og=A[5318]or wh_(5318,66324,4300)continue else Og=A[31649]or wh_(31649,129279,29297)continue end Og=1704 end elseif Og<10213 then Hc['Cover']=Fp;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Jm['Cover']['Field']['Text']=Fp;;
Og,Jm['MainSection']['Cover']['Image']=A[9252]or wh_(9252,129389,40870),Fp continue elseif Og<=10213 then Fp=Nb['tonumber'](Jm['Cover']['Field']['Text']);;
Hc,te=on(pm['StationId'],bf['CurrentlyLoaded'])if not Hc or not te then Og=A[-1864]or wh_(-1864,13862,46673)continue end Og=33540 else return end end end);;
Jm['Description']['Field']['FocusLost']['Connect'](Jm['Description']['Field']['FocusLost'],function(Uh)local jp,dq,Vk,xn,vb,Bm;;
dq,Vk=function(Uk,Ui,Xl)Vk[Xl]=ih(Ui,53541)-ih(Uk,9120)return Vk[Xl]end,
{
}
;;
vb=Vk[21199]or dq(13607,25960,21199)while vb~=51709 do if vb<=33944 then if vb<27310 then return elseif vb<=27310 then Bm=u_['TrimString'](Bm,30);;
jp['Description']=Bm;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Jm['Description']['Field']['Text'],vb=Bm,Vk[-11972]or dq(23334,103334,-11972)continue else yk['BannerNotify']
{
  ['Header']='Station Descriptions',['Description']='Station Descriptions must only be 30 characters or less.',['Icon']='rbxassetid://11419713314'
}
;;
vb=Vk[-27956]or dq(31447,5376,-27956)end elseif vb<=40390 then Bm=Jm['Description']['Field']['Text'];;
jp,xn=on(pm['StationId'],bf['CurrentlyLoaded'])if not(not jp or not xn)then vb=Vk[-25372]or dq(32054,129668,-25372)continue else vb=Vk[-895]or dq(32007,32728,-895)continue end vb=52491 else if Nb['string']['len'](Bm)>30 then vb=Vk[-24743]or dq(4664,26389,-24743)continue end vb=27310 end end end);;
Jm['StationName']['Field']['FocusLost']['Connect'](Jm['StationName']['Field']['FocusLost'],function(mm)local ek,Vl,ra,Ee,Ve,Cc;;
Ee,ra=
{
}
,function(Kg,Np,Vo)Ee[Vo]=ih(Np,40158)-ih(Kg,28821)return Ee[Vo]end;;
Vl=Ee[5668]or ra(1100,109077,5668)repeat if Vl>33330 then if Vl>49650 then Cc['Name']=Ve;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Jm['MainSection']['StationName']['Text']=Ve;;
Vl,Jm['StationName']['Field']['Text']=Ee[7667]or ra(42528,106911,7667),Ve continue else Ve=Jm['StationName']['Field']['Text'];;
Cc,ek=on(pm['StationId'],bf['CurrentlyLoaded'])if not(not Cc or not ek)then Vl=Ee[-29172]or ra(25233,42396,-29172)continue else Vl=Ee[5082]or ra(19390,8579,5082)continue end Vl=10046 end elseif Vl>27692 then return elseif Vl<=10046 then if not(Nb['string']['len'](Ve)<5)then Vl=Ee[-6463]or ra(14422,107068,-6463)continue else Vl=Ee[27634]or ra(3318,29777,27634)continue end Vl=63007 else yk['BannerNotify']
{
  ['Header']='Station Names',['Description']='Station Names must at least have 5 characters or more.',['Icon']='rbxassetid://11419713314'
}
return end until Vl==26252 end);;
Jm['AddField']['Field']['FocusLost']['Connect'](Jm['AddField']['Field']['FocusLost'],function(za)if not za then return end local fq=Nb['tonumber'](Jm['AddField']['Field']['Text'])local og,d_=on(pm['StationId'],bf['CurrentlyLoaded'])if not og or not d_ then return end Jm['AddField']['Field']['Text']=''if Nb['table']['find'](og['Songs'],fq)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The Song Id is already added.',['Icon']='rbxassetid://11419713314'
}
return end if not(#og['Songs']==30)then else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='You reached the maximum of 30 songs.',['Icon']='rbxassetid://11419713314'
}
return end if fq then Nb['table']['insert'](og['Songs'],fq);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true local Mi=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
Mi['Name']=fq;;
Mi['SongId']['Text']=fq;;
Mi['Parent']=Jm;;
Mi['Delete']['MouseButton1Click']['Connect'](Mi['Delete']['MouseButton1Click'],function()local Bh,qh,zo,Gh;;
Bh,qh=function(Um,Uo,Id)qh[Um]=ih(Uo,63594)-ih(Id,51036)return qh[Um]end,
{
}
;;
zo=qh[14414]or Bh(14414,14483,37848)repeat if zo>=54909 then if zo<55353 then zo=qh[-3441]or Bh(-3441,1000,44213)continue elseif zo<=55353 then Nb['table']['remove'](og['Songs'],Gh);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Mi['Destroy'](Mi);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..pm['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
zo=qh[19406]or Bh(19406,8717,50358)else yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
zo=qh[19203]or Bh(19203,117690,39439)end elseif zo>18036 then og,d_=on(pm['StationId'],bf['CurrentlyLoaded'])if not og or not d_ then zo=qh[-20689]or Bh(-20689,126294,2452)continue end zo=qh[7965]or Bh(7965,52709,58336)elseif zo<=4307 then Gh=Nb['table']['find'](og['Songs'],fq)if Gh then zo=qh[9129]or Bh(9129,116750,40823)continue else zo=qh[25348]or Bh(25348,105930,48813)continue end zo=qh[6233]or Bh(6233,83498,8351)else return end until zo==36761 end)else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Song Id is invalid.',['Icon']='rbxassetid://11419713314'
}
end end)for gn,Dl in pm['Songs']do local Qe=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
Qe['Name']=Dl;;
Qe['SongId']['Text']=Dl;;
Qe['Parent']=Jm;;
Qe['Delete']['MouseButton1Click']['Connect'](Qe['Delete']['MouseButton1Click'],function()local cb,tc,kl,Nh,Za,jb;;
Za,Nh=
{
}
,function(To,Nd,Kb)Za[To]=ih(Nd,51668)-ih(Kb,4040)return Za[To]end;;
tc=Za[-3511]or Nh(-3511,5387,42722)repeat if tc<18596 then if tc>2303 then kl,jb=on(pm['StationId'],bf['CurrentlyLoaded'])if not(not kl or not jb)then tc=Za[21371]or Nh(21371,42241,11257)continue else tc=Za[18950]or Nh(18950,36731,12920)continue end tc=Za[-7014]or Nh(-7014,48385,9209)elseif tc>890 then bf['Loading']=false return else Nb['table']['remove'](kl['Songs'],cb);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Qe['Destroy'](Qe);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..pm['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
tc=Za[-2385]or Nh(-2385,112874,31363)end elseif tc<=29466 then if tc<=18596 then cb=Nb['table']['find'](kl['Songs'],Dl)if not(cb)then tc=Za[18505]or Nh(18505,128672,50066)continue else tc=Za[20687]or Nh(20687,11900,60390)continue end tc=Za[32056]or Nh(32056,105278,22847)else yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
tc=Za[-13694]or Nh(-13694,92697,43026)end else tc=Za[-1008]or Nh(-1008,123450,20021)continue end until tc==59889 end)end end end)end no_=Pi[12046]or bl(109119,12046,55477)end elseif no_<=45006 then if no_<=43612 then if no_>42980 then bf['CurrentlyLoaded']=cm for Nf,Kp in cm do local Ph=Zh['Storage']['Items']['StationItem']['Clone'](Zh['Storage']['Items']['StationItem']);;
Ph['Name']=Kp['StationId'];;
Ph['MainSection']['Cover']['Image']=Kp['Cover'];;
Ph['MainSection']['StationName']['Text']=Kp['Name'];;
Ph['Cover']['Field']['Text']=Kp['Cover'];;
Ph['Description']['Field']['Text']=Kp['Description'];;
Ph['StationName']['Field']['Text']=Kp['Name'];;
Ph['Parent']=Ip['Stations']['Content']['Scroll']['CreatedStations']['Content'];;
Ph['MainSection']['Delete']['MouseButton1Click']['Connect'](Ph['MainSection']['Delete']['MouseButton1Click'],function()local Ge,ui,Gk,Tc,na;;
Ge,Tc=
{
}
,function(qj,re_,ed)Ge[re_]=ih(ed,39069)-ih(qj,61348)return Ge[re_]end;;
Gk=Ge[9090]or Tc(56619,9090,29930)repeat if Gk>=32857 then if Gk<=32857 then Nb['table']['remove'](bf['CurrentlyLoaded'],ui);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Ph['Destroy'](Ph);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted '..Kp['Name']..'.',['Icon']='rbxassetid://11422930594'
}
;;
Gk=Ge[25971]or Tc(30029,25971,119968)continue else na,ui=on(Kp['StationId'],bf['CurrentlyLoaded'])if not(not na or not ui)then Gk=Ge[27128]or Tc(57546,27128,5978)continue else Gk=Ge[12517]or Tc(45394,12517,7132)continue end Gk=Ge[18069]or Tc(34318,18069,29342)end else bf['Loading']=false return end until Gk==45396 end);;
Ph['Cover']['Field']['FocusLost']['Connect'](Ph['Cover']['Field']['FocusLost'],function(uj)local Ze,uc,Od,Xa,fn,Hi;;
fn,Ze=
{
}
,function(Ra,Qg,nn)fn[Ra]=ih(Qg,11654)-ih(nn,53698)return fn[Ra]end;;
uc=fn[25092]or Ze(25092,25980,49803)while uc~=52456 do if uc<=13745 then if uc<=12378 then if uc<=6252 then if uc>1065 then bf['Loading']=false return else Xa,uc='rbxassetid://'..Xa,fn[-11266]or Ze(-11266,40672,21198)end else Hi['Cover']=Xa;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Ph['Cover']['Field']['Text']=Xa;;
uc,Ph['MainSection']['Cover']['Image']=fn[-3122]or Ze(-3122,107744,28092),Xa continue end elseif uc<=13032 then uc,Xa=fn[27566]or Ze(27566,51352,25862),Ph['Cover']['Field']['Text']else if not uj then uc=fn[20947]or Ze(20947,76392,47695)continue end uc=19915 end elseif uc>40033 then if Xa then uc=fn[378]or Ze(378,4585,59780)continue else uc=fn[9150]or Ze(9150,22683,37879)continue end uc=12378 elseif uc<=19915 then Xa=Nb['tonumber'](Ph['Cover']['Field']['Text']);;
Hi,Od=on(Kp['StationId'],bf['CurrentlyLoaded'])if not(not Hi or not Od)then uc=fn[-11008]or Ze(-11008,76271,46102)continue else uc=fn[21520]or Ze(21520,394,49762)continue end uc=fn[24757]or Ze(24757,55987,35170)else return end end end);;
Ph['Description']['Field']['FocusLost']['Connect'](Ph['Description']['Field']['FocusLost'],function(hb)local Yg,ll,nm,Pj,Fa,Rh;;
Pj,Yg=function(L,gm,Se)Yg[Se]=ih(L,61672)-ih(gm,53813)return Yg[Se]end,
{
}
;;
Rh=Yg[3142]or Pj(18012,50409,3142)while Rh~=12787 do if Rh>=17752 then if Rh>=36686 then if Rh<=36686 then nm=u_['TrimString'](nm,30);;
Fa['Description']=nm;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Ph['Description']['Field']['Text'],Rh=nm,Yg[-20126]or Pj(48222,51446,-20126)continue else if not(not hb)then Rh=Yg[8091]or Pj(17288,38778,8091)continue else Rh=Yg[20600]or Pj(64016,56063,20600)continue end Rh=Yg[11233]or Pj(11180,48902,11233)end elseif Rh<=17752 then yk['BannerNotify']
{
  ['Header']='Station Descriptions',['Description']='Station Descriptions must only be 30 characters or less.',['Icon']='rbxassetid://11419713314'
}
;;
Rh=Yg[-15593]or Pj(7577,35862,-15593)else nm=Ph['Description']['Field']['Text'];;
Fa,ll=on(Kp['StationId'],bf['CurrentlyLoaded'])if not(not Fa or not ll)then Rh=Yg[11582]or Pj(42290,37084,11582)continue else Rh=Yg[-31823]or Pj(118908,13318,-31823)continue end Rh=Yg[17707]or Pj(29240,48618,17707)end elseif Rh<4849 then return elseif Rh>4849 then bf['Loading']=false return else if not(Nb['string']['len'](nm)>30)then Rh=Yg[-19479]or Pj(24609,54094,-19479)continue else Rh=Yg[-1459]or Pj(17857,48612,-1459)continue end Rh=Yg[3930]or Pj(117413,30922,3930)end end end);;
Ph['StationName']['Field']['FocusLost']['Connect'](Ph['StationName']['Field']['FocusLost'],function(Ei)local Tn,vl,up,xa,zn,Hg;;
zn,vl=function(ma,jo,ad)vl[jo]=ih(ma,5442)-ih(ad,6445)return vl[jo]end,
{
}
;;
Tn=vl[-19008]or zn(52902,-19008,19633)while Tn~=29369 do if Tn<34376 then if Tn<=6726 then if Tn>625 then yk['BannerNotify']
{
  ['Header']='Station Names',['Description']='Station Names must at least have 10 characters or more.',['Icon']='rbxassetid://11419713314'
}
return else xa['Name']=Hg;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
Ph['MainSection']['StationName']['Text']=Hg;;
Ph['StationName']['Field']['Text'],Tn=Hg,vl[-11900]or zn(69237,-11900,45395)continue end else bf['Loading']=false return end elseif Tn<47446 then if Tn>34376 then if not(Nb['string']['len'](Hg)<10)then Tn=vl[-20255]or zn(36439,-20255,33161)continue else Tn=vl[-1018]or zn(25968,-1018,19649)continue end Tn=625 else if not Ei then Tn=vl[-3706]or zn(104753,-3706,51760)continue end Tn=64727 end elseif Tn>47446 then Hg=Ph['StationName']['Field']['Text'];;
xa,up=on(Kp['StationId'],bf['CurrentlyLoaded'])if not xa or not up then Tn=vl[-17046]or zn(30884,-17046,9192)continue end Tn=vl[17139]or zn(104452,17139,59409)else return end end end);;
Ph['AddField']['Field']['FocusLost']['Connect'](Ph['AddField']['Field']['FocusLost'],function(pc)if not pc then return end local bo=Nb['tonumber'](Ph['AddField']['Field']['Text'])local Ah,rj=on(Kp['StationId'],bf['CurrentlyLoaded'])if not Ah or not rj then return end Ph['AddField']['Field']['Text']=''if Nb['table']['find'](Ah['Songs'],bo)then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The Song Id is already added.',['Icon']='rbxassetid://11419713314'
}
return end if#Ah['Songs']==30 then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='You reached the maximum of 30 songs.',['Icon']='rbxassetid://11419713314'
}
return end if bo then Nb['table']['insert'](Ah['Songs'],bo);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true local cj=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
cj['Name']=bo;;
cj['SongId']['Text']=bo;;
cj['Parent']=Ph;;
cj['Delete']['MouseButton1Click']['Connect'](cj['Delete']['MouseButton1Click'],function()local Lg,aa,vh,fh;;
aa,vh=function(Sh,ao,wm)vh[wm]=ih(Sh,50930)-ih(ao,44862)return vh[wm]end,
{
}
;;
fh=vh[-2998]or aa(29532,36910,-2998)while fh~=43912 do if fh<30366 then if fh<16879 then return elseif fh>16879 then Nb['table']['remove'](Ah['Songs'],Lg);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
cj['Destroy'](cj);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..Kp['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
fh=vh[-32410]or aa(114897,27402,-32410)else fh=vh[7967]or aa(122834,49830,7967)continue end elseif fh>39365 then yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
fh=vh[-13384]or aa(37474,48543,-13384)elseif fh<=30366 then Ah,rj=on(Kp['StationId'],bf['CurrentlyLoaded'])if not(not Ah or not rj)then fh=vh[-712]or aa(25635,42546,-712)continue else fh=vh[-7792]or aa(32911,60795,-7792)continue end fh=vh[8314]or aa(86301,20756,8314)else Lg=Nb['table']['find'](Ah['Songs'],bo)if not(Lg)then fh=vh[-29239]or aa(109884,9863,-29239)continue else fh=vh[9366]or aa(9166,56934,9366)continue end fh=16879 end end end)else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Song Id is invalid.',['Icon']='rbxassetid://11419713314'
}
end end)for Op,ba in Kp['Songs']do local oo=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
oo['Name']=ba;;
oo['SongId']['Text']=ba;;
oo['Parent']=Ph;;
oo['Delete']['MouseButton1Click']['Connect'](oo['Delete']['MouseButton1Click'],function()local Ll,Ue,Ig,po,be,hd;;
Ig,be=function(hl,wd,Mc)be[wd]=ih(Mc,27934)-ih(hl,49291)return be[wd]end,
{
}
;;
Ue=be[16856]or Ig(37735,16856,40325)while Ue~=50981 do if Ue<39905 then if Ue>=12316 then if Ue>12316 then po=Nb['table']['find'](Ll['Songs'],ba)if po then Ue=be[-7500]or Ig(26814,-7500,48773)continue else Ue=be[26845]or Ig(17269,26845,87824)continue end Ue=be[-16223]or Ig(9128,-16223,70170)else bf['Loading']=false return end else Nb['table']['remove'](Ll['Songs'],po);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
oo['Destroy'](oo);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..Kp['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
Ue=be[3524]or Ig(36243,3524,34279)end elseif Ue>40111 then yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
Ue=be[31481]or Ig(55018,31481,57180)elseif Ue<=39905 then Ue=be[-21645]or Ig(63081,-21645,37657)continue else Ll,hd=on(Kp['StationId'],bf['CurrentlyLoaded'])if not(not Ll or not hd)then Ue=be[-11836]or Ig(24591,-11836,96369)continue else Ue=be[-17494]or Ig(13777,-17494,84072)continue end Ue=29931 end end end)end end if not(xg['Stations']['OnlineStations'])then no_=Pi[-31826]or bl(18961,-31826,30875)continue else no_=Pi[-14775]or bl(12360,-14775,50069)continue end no_=Pi[12863]or bl(120814,12863,38630)else if not(Bl['HasTag'](Bl,'MastersOnboardingTemplate'))then no_=Pi[19385]or bl(28181,19385,16040)continue else no_=Pi[31603]or bl(125354,31603,37957)continue end no_=Pi[27736]or bl(17586,27736,8267)end else Tl=Nb['GetInSheets'](vc['values'][1][1])if not Tl then no_=Pi[20435]or bl(117415,20435,14411)continue end no_=36834 end elseif no_>51225 then xg,vc,Tl=of(xg);;
no_=Pi[15357]or bl(30927,15357,50198)else bf['Loading']=false return end end end Ip['Stations']['Content']['Scroll']['Content']['Add']['MouseButton1Click']['Connect'](Ip['Stations']['Content']['Scroll']['Content']['Add']['MouseButton1Click'],function()local Tm=
{
  ['Name']='New Station '..#bf['CurrentlyLoaded']+1,['Description']='',['Cover']='rbxassetid://74118540785733',['StationId']='MSTATION'..Nb['tick'](),['Updated']=Nb['os']['time'](),['Songs']=
  {
  }
}
;;
Nb['table']['insert'](bf['CurrentlyLoaded'],Tm);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true local nq=Zh['Storage']['Items']['StationItem']['Clone'](Zh['Storage']['Items']['StationItem']);;
nq['Name']=Tm['StationId'];;
nq['MainSection']['Cover']['Image']=Tm['Cover'];;
nq['MainSection']['StationName']['Text']=Tm['Name'];;
nq['Cover']['Field']['Text']=Tm['Cover'];;
nq['Description']['Field']['Text']=Tm['Description'];;
nq['StationName']['Field']['Text']=Tm['Name'];;
nq['Parent']=Ip['Stations']['Content']['Scroll']['CreatedStations']['Content'];;
nq['MainSection']['Delete']['MouseButton1Click']['Connect'](nq['MainSection']['Delete']['MouseButton1Click'],function()local sq,Ho,Be,wl,tf;;
Be,wl=
{
}
,function(nc,Ff,ub)Be[nc]=ih(ub,56411)-ih(Ff,40917)return Be[nc]end;;
Ho=Be[6197]or wl(6197,6558,23175)while Ho~=61305 do if Ho<=17929 then if Ho<=145 then sq,tf=on(Tm['StationId'],bf['CurrentlyLoaded'])if not sq or not tf then Ho=Be[-13738]or wl(-13738,197,14658)continue end Ho=Be[12037]or wl(12037,51417,130953)else bf['Loading']=false return end else Nb['table']['remove'](bf['CurrentlyLoaded'],tf);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
nq['Destroy'](nq);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted '..Tm['Name']..'.',['Icon']='rbxassetid://11422930594'
}
;;
Ho=Be[-5603]or wl(-5603,20504,90909)continue end end end);;
nq['Cover']['Field']['FocusLost']['Connect'](nq['Cover']['Field']['FocusLost'],function(ho)local Wd,ck,Af,pd,Zj,gc;;
pd,Wd=
{
}
,function(o_,Rn,yb)pd[yb]=ih(o_,16711)-ih(Rn,64776)return pd[yb]end;;
Af=pd[-18635]or Wd(4410,54327,-18635)repeat if Af>=40106 then if Af>49956 then return elseif Af>40106 then if not(Zj)then Af=pd[-14013]or Wd(58615,59146,-14013)continue else Af=pd[14456]or Wd(53170,31839,14456)continue end Af=pd[-20692]or Wd(42308,47697,-20692)else ck['Cover']=Zj;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
nq['Cover']['Field']['Text']=Zj;;
Af,nq['MainSection']['Cover']['Image']=pd[7673]or Wd(63783,17721,7673),Zj continue end elseif Af<10046 then Zj,Af='rbxassetid://'..Zj,pd[5299]or Wd(75260,13593,5299)elseif Af<=10046 then Zj=Nb['tonumber'](nq['Cover']['Field']['Text']);;
ck,gc=on(Tm['StationId'],bf['CurrentlyLoaded'])if not ck or not gc then Af=pd[23348]or Wd(103065,9140,23348)continue end Af=pd[28415]or Wd(76248,22643,28415)else Af,Zj=pd[23805]or Wd(71064,17725,23805),nq['Cover']['Field']['Text']end until Af==47 end);;
nq['Description']['Field']['FocusLost']['Connect'](nq['Description']['Field']['FocusLost'],function(Cn)local Eg,tk,go,vi,Ni,C;;
Ni,vi=function(Ro,Si,Ij)vi[Ro]=ih(Ij,31511)-ih(Si,29403)return vi[Ro]end,
{
}
;;
C=vi[20099]or Ni(20099,40004,111508)while C~=56780 do if C>12608 then if C<=16635 then if Nb['string']['len'](Eg)>30 then C=vi[-4879]or Ni(-4879,15668,10420)continue end C=vi[-32421]or Ni(-32421,37134,93698)else Eg=nq['Description']['Field']['Text'];;
go,tk=on(Tm['StationId'],bf['CurrentlyLoaded'])if not(not go or not tk)then C=vi[-9131]or Ni(-9131,54992,40465)continue else C=vi[11089]or Ni(11089,49859,48087)continue end C=16635 end elseif C<=4264 then if C<=948 then yk['BannerNotify']
{
  ['Header']='Station Descriptions',['Description']='Station Descriptions must only be 30 characters or less.',['Icon']='rbxassetid://11419713314'
}
;;
C=vi[-1045]or Ni(-1045,27226,13014)else return end else Eg=u_['TrimString'](Eg,30);;
go['Description']=Eg;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
nq['Description']['Field']['Text'],C=Eg,vi[-16255]or Ni(-16255,9488,85632)continue end end end);;
nq['StationName']['Field']['FocusLost']['Connect'](nq['StationName']['Field']['FocusLost'],function(ya)local op,id,Ii,ib,Fe,Yp;;
Fe,Yp=function(Ne,Oo,Lj)Yp[Oo]=ih(Lj,49259)-ih(Ne,5358)return Yp[Oo]end,
{
}
;;
id=Yp[-4794]or Fe(7431,-4794,14442)repeat if id<=51505 then if id>50427 then return elseif id>20628 then op['Name']=ib;;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
nq['MainSection']['StationName']['Text']=ib;;
nq['StationName']['Field']['Text'],id=ib,Yp[10811]or Fe(42507,10811,7263)continue else if not(Nb['string']['len'](ib)<5)then id=Yp[-30168]or Fe(18779,-30168,123611)continue else id=Yp[14440]or Fe(60576,14440,76384)continue end id=Yp[-3675]or Fe(13155,-3675,11491)end elseif id<=60952 then ib=nq['StationName']['Field']['Text'];;
op,Ii=on(Tm['StationId'],bf['CurrentlyLoaded'])if not op or not Ii then id=Yp[18339]or Fe(61108,18339,66528)continue end id=Yp[1611]or Fe(56200,1611,122769)else yk['BannerNotify']
{
  ['Header']='Station Names',['Description']='Station Names must at least have 5 characters or more.',['Icon']='rbxassetid://11419713314'
}
return end until id==10575 end);;
nq['AddField']['Field']['FocusLost']['Connect'](nq['AddField']['Field']['FocusLost'],function(fd)if not(not fd)then else return end local oe=Nb['tonumber'](nq['AddField']['Field']['Text'])local bh,hn=on(Tm['StationId'],bf['CurrentlyLoaded'])if not bh or not hn then return end nq['AddField']['Field']['Text']=''if not(Nb['table']['find'](bh['Songs'],oe))then else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The Song Id is already added.',['Icon']='rbxassetid://11419713314'
}
return end if#bh['Songs']==30 then yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='You reached the maximum of 30 songs.',['Icon']='rbxassetid://11419713314'
}
return end if oe then Nb['table']['insert'](bh['Songs'],oe);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true local ji=Zh['Storage']['Items']['SongItem']['Clone'](Zh['Storage']['Items']['SongItem']);;
ji['Name']=oe;;
ji['SongId']['Text']=oe;;
ji['Parent']=nq;;
ji['Delete']['MouseButton1Click']['Connect'](ji['Delete']['MouseButton1Click'],function()local Jd,Ib,j,xh;;
Jd,Ib=
{
}
,function(qi,Vp,Co)Jd[qi]=ih(Vp,5695)-ih(Co,22979)return Jd[qi]end;;
xh=Jd[11728]or Ib(11728,114068,35299)while xh~=46990 do if xh>50711 then if xh<=56203 then bh,hn=on(Tm['StationId'],bf['CurrentlyLoaded'])if not(not bh or not hn)then xh=Jd[378]or Ib(378,81682,15061)continue else xh=Jd[-22908]or Ib(-22908,65697,62822)continue end xh=Jd[-24776]or Ib(-24776,110395,43822)else Nb['table']['remove'](bh['Songs'],j);;
bf['HasChanged']=true;;
Ip['Stations']['Content']['Actions']['Visible']=true;;
ji['Destroy'](ji);;
yk['BannerNotify']
{
  ['Header']='Successfully Deleted',['Description']='You\'ve deleted a song from '..Tm['Name']..'.',['Icon']='rbxassetid://11326877488'
}
;;
xh=Jd[-1133]or Ib(-1133,83090,40058)end elseif xh<36084 then if xh<=19945 then yk['BannerNotify']
{
  ['Header']='Failed to Delete',['Description']='An error occurred upon deleting the song.',['Icon']='rbxassetid://11419713314'
}
;;
xh=Jd[-30090]or Ib(-30090,52549,5957)else return end elseif xh<=36084 then xh=Jd[-6166]or Ib(-6166,69986,5644)continue else j=Nb['table']['find'](bh['Songs'],oe)if j then xh=Jd[5580]or Ib(5580,129411,41122)continue else xh=Jd[-2954]or Ib(-2954,30688,18997)continue end xh=Jd[-2084]or Ib(-2084,81462,49878)end end end)else yk['BannerNotify']
{
  ['Header']='Failed to Add',['Description']='The provided Song Id is invalid.',['Icon']='rbxassetid://11419713314'
}
end end)end);;
Ip['Installation']['Content']['Actions']['Stations']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Actions']['Stations']['MouseButton1Click'],function()Nb['PromptProcess'](true);;
Nb['SetPage']('Stations');;
_m();;
Nb['PromptProcess'](false)end);;
Ip['Stations']['Content']['Actions']['Save']['MouseButton1Click']['Connect'](Ip['Stations']['Content']['Actions']['Save']['MouseButton1Click'],Ng);;
Ip['Stations']['Header']['Actions']['Back']['MouseButton1Click']['Connect'](Ip['Stations']['Header']['Actions']['Back']['MouseButton1Click'],function()local fk,ng,Th,Om;;
Om,ng=function(mj,Wk,bb)ng[Wk]=ih(bb,38252)-ih(mj,1980)return ng[Wk]end,
{
}
;;
Th=ng[17569]or Om(3432,17569,10784)repeat if Th<=17062 then if Th<=9199 then if Th>5731 then Th=ng[-23887]or Om(63067,-23887,112561)continue elseif Th<=4089 then Ia();;
Nb['BackPage']();;
Th=ng[27624]or Om(45262,27624,19981)else if not(fk=='Discard Changes')then Th=ng[-1534]or Om(30660,-1534,267)continue else Th=ng[18518]or Om(41648,18518,103460)continue end Th=ng[-1236]or Om(57231,-1236,26958)end else Ng();;
Ia();;
Nb['BackPage']();;
Th=ng[4008]or Om(33551,4008,15822)end elseif Th>23612 then if bf['HasChanged']then Th=ng[-21707]or Om(2937,-21707,61448)continue else Th=ng[-17543]or Om(33451,-17543,124)continue end Th=ng[18987]or Om(37893,18987,8900)elseif Th<=22687 then fk=n_['PromptOptions']
{
  ['Header']='You have some unsaved changes...',['Options']=
  {
    {
      ['Name']='Save Changes',['Icon']='rbxassetid://11419703493'
    }
    ,
    {
      ['Name']='Discard Changes',['Icon']='rbxassetid://11326877488'
    }
    ,'SEPARATOR',
    {
      ['Name']='Cancel',['Icon']='rbxassetid://11293981586'
    }
  }
}
if not(fk=='Save Changes')then Th=ng[19753]or Om(45573,19753,22896)continue else Th=ng[3523]or Om(44067,3523,31529)continue end Th=ng[-2716]or Om(15542,-2716,52117)else Ia();;
Nb['BackPage']();;
Th=ng[-12273]or Om(55415,-12273,104150)end until Th==12534 end);;
Ip['Stations']['Content']['Scroll']['CreatedStations']['Header']['MouseButton1Click']['Connect'](Ip['Stations']['Content']['Scroll']['CreatedStations']['Header']['MouseButton1Click'],function()local tg,kd,mf;;
kd,mf=function(lj,Lc,hf)mf[Lc]=ih(hf,61156)-ih(lj,14577)return mf[Lc]end,
{
}
;;
tg=mf[-17777]or kd(26300,-17777,36585)while tg~=52823 do if tg<=8352 then if tg<3273 then if Ip['Stations']['Content']['Scroll']['CreatedStations']['Content']['Visible']then tg=mf[10356]or kd(22607,10356,28602)continue else tg=mf[-15076]or kd(32473,-15076,48149)continue end tg=23876 elseif tg>3273 then Ip['Stations']['Content']['Scroll']['CreatedStations']['Content']['Visible']=false;;
Do['Create'](Do,Ip['Stations']['Content']['Scroll']['CreatedStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
)['Play'](Do['Create'](Do,Ip['Stations']['Content']['Scroll']['CreatedStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
));;
tg=mf[-23569]or kd(11369,-23569,40760)else Ip['Stations']['Content']['Scroll']['CreatedStations']['Content']['Visible']=true;;
Do['Create'](Do,Ip['Stations']['Content']['Scroll']['CreatedStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
)['Play'](Do['Create'](Do,Ip['Stations']['Content']['Scroll']['CreatedStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
));;
tg=mf[23731]or kd(28359,23731,23966)end else tg=mf[11664]or kd(62110,11664,95778)continue end end end);;
Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['MouseButton1Click']['Connect'](Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['MouseButton1Click'],function()local Gf,pk,Mh;;
Mh,pk=function(nd,Oe,Q)pk[Oe]=ih(nd,4625)-ih(Q,40783)return pk[Oe]end,
{
}
;;
Gf=pk[-30935]or Mh(43023,-30935,54610)while Gf~=4909 do if Gf>=41457 then if Gf>41457 then Ip['Stations']['Content']['Scroll']['OnlineStations']['Content']['Visible']=false;;
Do['Create'](Do,Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
)['Play'](Do['Create'](Do,Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=90
}
));;
Gf=pk[-26244]or Mh(42900,-26244,47135)else Ip['Stations']['Content']['Scroll']['OnlineStations']['Content']['Visible']=true;;
Do['Create'](Do,Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
)['Play'](Do['Create'](Do,Ip['Stations']['Content']['Scroll']['OnlineStations']['Header']['Chevron']['Icon'],hi,
{
  ['Rotation']=0
}
));;
Gf=pk[-19434]or Mh(71477,-19434,59808)end elseif Gf<=28673 then if not(Ip['Stations']['Content']['Scroll']['OnlineStations']['Content']['Visible'])then Gf=pk[9875]or Mh(54999,9875,48538)continue else Gf=pk[19065]or Mh(76563,19065,4747)continue end Gf=pk[30565]or Mh(96771,30565,18066)else Gf=pk[27878]or Mh(50471,27878,23366)continue end end end);;
Ip['UpdateInstructions']['Content']['Util']['ScrollArea']['MouseWheelForward']['Connect'](Ip['UpdateInstructions']['Content']['Util']['ScrollArea']['MouseWheelForward'],function()local Bc=Ip['UpdateInstructions']['Content']['Scroll']['CanvasPosition']['Y']-75;;
Do['Create'](Do,Ip['UpdateInstructions']['Content']['Scroll'],Im,
{
  ['CanvasPosition']=Nb['Vector2']['new'](0,Bc)
}
)['Play'](Do['Create'](Do,Ip['UpdateInstructions']['Content']['Scroll'],Im,
{
  ['CanvasPosition']=Nb['Vector2']['new'](0,Bc)
}
))end);;
Ip['UpdateInstructions']['Content']['Util']['ScrollArea']['MouseWheelBackward']['Connect'](Ip['UpdateInstructions']['Content']['Util']['ScrollArea']['MouseWheelBackward'],function()local Gb=Ip['UpdateInstructions']['Content']['Scroll']['CanvasPosition']['Y']+75;;
Do['Create'](Do,Ip['UpdateInstructions']['Content']['Scroll'],Im,
{
  ['CanvasPosition']=Nb['Vector2']['new'](0,Gb)
}
)['Play'](Do['Create'](Do,Ip['UpdateInstructions']['Content']['Scroll'],Im,
{
  ['CanvasPosition']=Nb['Vector2']['new'](0,Gb)
}
))end);;
Ip['UpdateInstructions']['Content']['Scroll']['GetPropertyChangedSignal'](Ip['UpdateInstructions']['Content']['Scroll'],'CanvasPosition')['Connect'](Ip['UpdateInstructions']['Content']['Scroll']['GetPropertyChangedSignal'](Ip['UpdateInstructions']['Content']['Scroll'],'CanvasPosition'),function()local On,_n,rb,Kd,ac,Hh,Kf,Zp,Dc;;
Kd,Kf=
{
}
,function(Lp,hq,ye)Kd[hq]=ih(ye,2912)-ih(Lp,43149)return Kd[hq]end;;
Hh=Kd[23200]or Kf(24496,23200,129576)repeat if Hh>=42253 then if Hh<56830 then if Hh>45690 then if Hh>47017 then Zp['Interactable']=false;;
Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
));;
Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
));;
Do['Create'](Do,Zp['Container']['Number'],hi,
{
  ['BackgroundTransparency']=1
}
)['Play'](Do['Create'](Do,Zp['Container']['Number'],hi,
{
  ['BackgroundTransparency']=1
}
));;
Do['Create'](Do,Zp['Container']['Number']['stroke'],hi,
{
  ['Thickness']=2,['Transparency']=0.5
}
)['Play'](Do['Create'](Do,Zp['Container']['Number']['stroke'],hi,
{
  ['Thickness']=2,['Transparency']=0.5
}
));;
Hh=Kd[31311]or Kf(64314,31311,52000)else if not(Zp['IsA'](Zp,'ImageButton')and Zp['HasTag'](Zp,'MastersUpdateStep'))then Hh=Kd[30223]or Kf(8954,30223,64608)continue else Hh=Kd[-27652]or Kf(42060,-27652,33776)continue end Hh=Kd[-23023]or Kf(57910,-23023,48164)end elseif Hh<44491 then if Zp['AbsolutePosition']['Y']<=(Nb['workspace']['Camera']['ViewportSize']['Y']/2)then Hh=Kd[1668]or Kf(30353,1668,105462)continue else Hh=Kd[9648]or Kf(8001,9648,52042)continue end Hh=Kd[-15803]or Kf(56473,-15803,51929)elseif Hh<=44491 then ac,_n,rb=of(ac);;
Hh=Kd[-18758]or Kf(60633,-18758,39577)else Zp['Interactable']=true;;
Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0
}
));;
Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.5
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.5
}
));;
Hh=Kd[-27886]or Kf(38431,-27886,34647)end elseif Hh>64011 then if Hh>64055 then if not(Zp['IsA'](Zp,'ImageButton')and Zp['HasTag'](Zp,'MastersUpdateSubstep'))then Hh=Kd[-6997]or Kf(15136,-6997,59954)continue else Hh=Kd[-7738]or Kf(64633,-7738,61793)continue end Hh=Kd[29467]or Kf(47553,29467,21905)else ac,_n,rb=Dc['__iter'](ac);;
Hh=Kd[-32158]or Kf(8197,-32158,56653)end elseif Hh<=59793 then if Hh<=56830 then Dc=Xm(ac)if not(Dc~=nil and Dc['__iter']~=nil)then Hh=Kd[879]or Kf(49921,879,89725)continue else Hh=Kd[-7637]or Kf(39339,-7637,73789)continue end Hh=Kd[26400]or Kf(18082,26400,78004)else if not(rd(ac)=='table')then Hh=Kd[-25543]or Kf(7776,-25543,69618)continue else Hh=Kd[31923]or Kf(54241,31923,74327)continue end Hh=Kd[-24618]or Kf(42996,-24618,22142)end else ac,_n,rb=Ip['UpdateInstructions']['Content']['Scroll']['Content']['GetChildren'](Ip['UpdateInstructions']['Content']['Scroll']['Content'])if not(rd(ac)~='function')then Hh=Kd[-15627]or Kf(60504,-15627,47678)continue else Hh=Kd[-11454]or Kf(14389,-11454,74256)continue end Hh=Kd[21758]or Kf(31311,21758,78891)end elseif Hh>27785 then if Hh>=34435 then if Hh>34435 then Dc=Xm(ac)if Dc~=nil and Dc['__iter']~=nil then Hh=Kd[2118]or Kf(36175,2118,28044)continue elseif not(rd(ac)=='table')then Hh=Kd[-2120]or Kf(6497,-2120,70933)continue else Hh=Kd[27252]or Kf(22461,27252,102099)continue end Hh=Kd[-23968]or Kf(31608,-23968,84766)else ac,_n,rb=of(ac);;
Hh=Kd[14998]or Kf(49656,14998,56990)end elseif Hh<=29306 then Zp['Interactable']=true;;
Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0
}
));;
Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.5
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.5
}
));;
Do['Create'](Do,Zp['Container']['Number'],hi,
{
  ['BackgroundTransparency']=0
}
)['Play'](Do['Create'](Do,Zp['Container']['Number'],hi,
{
  ['BackgroundTransparency']=0
}
));;
Do['Create'](Do,Zp['Container']['Number']['stroke'],hi,
{
  ['Thickness']=5,['Transparency']=1
}
)['Play'](Do['Create'](Do,Zp['Container']['Number']['stroke'],hi,
{
  ['Thickness']=5,['Transparency']=1
}
));;
Hh=Kd[-12734]or Kf(51895,-12734,50595)else if Zp['AbsolutePosition']['Y']<=(Nb['workspace']['Camera']['ViewportSize']['Y']/2)then Hh=Kd[-21959]or Kf(29870,-21959,83453)continue else Hh=Kd[-4142]or Kf(56607,-4142,89057)continue end Hh=Kd[22692]or Kf(2523,22692,67263)end elseif Hh<16682 then if Hh<12294 then Zp['Interactable']=false;;
Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Label'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
));;
Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
)['Play'](Do['Create'](Do,Zp['Container']['Info']['Sublabel'],hi,
{
  ['TextTransparency']=0.80000000000000004
}
));;
Hh=Kd[-32723]or Kf(34275,-32723,28787)elseif Hh>12294 then ac,_n,rb=Ip['UpdateInstructions']['Content']['Scroll']['Content']['GetChildren'](Ip['UpdateInstructions']['Content']['Scroll']['Content'])if rd(ac)~='function'then Hh=Kd[24689]or Kf(51157,24689,83510)continue end Hh=Kd[-3522]or Kf(23987,-3522,84355)else Hh=Kd[-24960]or Kf(51390,-24960,60423)continue end elseif Hh<=19877 then if Hh<=16682 then ac,_n,rb=Dc['__iter'](ac);;
Hh=Kd[5036]or Kf(22285,5036,92009)else On,Zp=ac(_n,rb);;
rb=On if rb==nil then Hh=Kd[29804]or Kf(18027,29804,71052)else Hh=64891 end end else On,Zp=ac(_n,rb);;
rb=On if rb==nil then Hh=13948 else Hh=47017 end end until Hh==34612 end);;
Ip['UpdateInstructions']['Header']['Actions']['Back']['MouseButton1Click']['Connect'](Ip['UpdateInstructions']['Header']['Actions']['Back']['MouseButton1Click'],Nb['BackPage'])else Zh['Enabled']=false end end for Da,uk in Fd['GetChildren'](Fd)do local Fo,Xg,So;;
So,Fo=
{
}
,function(sf,Pm,xm)So[xm]=ih(sf,36489)-ih(Pm,52622)return So[xm]end;;
Xg=So[-9243]or Fo(98833,21941,-9243)while Xg~=9441 do if Xg<29789 then uk['Destroy'](uk);;
Xg=So[15221]or Fo(128723,21453,15221)elseif Xg>29789 then Xg=So[14613]or Fo(54073,62785,14613)continue else if uk['HasTag'](uk,'MastersOnboarding')then Xg=So[-7988]or Fo(29606,2344,-7988)continue end Xg=So[19950]or Fo(118915,20093,19950)end end end local dh,zf=Nb['require'](se_['Toolbar']),
{
}
;;
zf['CombinerName']='Flare Studio';;
zf['ToolbarName']='Flare Studio';;
zf['ButtonName']='Masters';;
zf['ButtonIcon']='rbxassetid://93725590097433';;
zf['ButtonTooltip']='The Mastermind of Music.';;
zf['ClickedFn']=function()Yc()end;;
Zh['GetAttributeChangedSignal'](Zh,'Switch')['Connect'](Zh['GetAttributeChangedSignal'](Zh,'Switch'),function()local kc,mb,sn;;
kc,sn=function(lb,nk,Jc)sn[lb]=ih(nk,61716)-ih(Jc,41221)return sn[lb]end,
{
}
;;
mb=sn[15926]or kc(15926,387,14696)while mb~=46569 do if mb>=22570 then if mb>22570 then return else if Zh['Enabled']then mb=sn[16278]or kc(16278,126544,64249)continue end mb=2610 end else Yc();;
mb=sn[6985]or kc(6985,92057,16801)continue end end end);;
dh(Nb['plugin'],zf);;
Zh['Enabled']=false;;
Zh['Interface']['Visible']=false;;
Zh['Parent']=Fd;;
Ip['GetStarted']['Content']['Actions']['GetStarted']['MouseButton1Click']['Connect'](Ip['GetStarted']['Content']['Actions']['GetStarted']['MouseButton1Click'],function()local am,Fm,zl;;
Fm,zl=function(Sd,ec,ti)zl[ti]=ih(ec,58773)-ih(Sd,48877)return zl[ti]end,
{
}
;;
am=zl[17981]or Fm(57160,4333,17981)repeat if am>=31382 then if am<=31382 then Nb['task']['spawn'](function()Ip['Failure']['Content']['Retry']['Interactable']=false;;
Ip['Failure']['Content']['Retry']['ProgressBar']['Bar']['Size']=Nb['UDim2']['fromScale'](0,1);;
Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0.80000000000000004
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0.80000000000000004
}
));;
Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=0
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=0
}
));;
Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar']['Bar'],ce,
{
  ['Size']=Nb['UDim2']['fromScale'](1,1)
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar']['Bar'],ce,
{
  ['Size']=Nb['UDim2']['fromScale'](1,1)
}
));;
Nb['SetPage']('Failure');;
Nb['AnalyzeIssues']();;
Nb['PromptProcess'](false);;
Nb['task']['wait'](5);;
Ip['Failure']['Content']['Retry']['Interactable']=true;;
Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0
}
));;
Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=1
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=1
}
))end);;
yk['BannerNotify']
{
  ['Header']='Masters failed to load.',['Description']='Failed to load successfully. Troubleshoot options are shown instead.',['Icon']='rbxassetid://11963348339'
}
;;
am=zl[-24246]or Fm(4204,15803,-24246)else Nb['PromptProcess'](true)if not(Nb['IsGamePrepared'](false)and ae())then am=zl[-18956]or Fm(62365,11667,-18956)continue else am=zl[-24476]or Fm(36427,47897,-24476)continue end am=10669 end elseif am>10669 then Nb['SetPage']('Installation');;
Nb['PromptProcess'](false);;
am=zl[-23704]or Fm(20686,127557,-23704)else am=zl[29832]or Fm(20601,114442,29832)continue end until am==27659 end);;
Ip['Failure']['Content']['Retry']['MouseButton1Click']['Connect'](Ip['Failure']['Content']['Retry']['MouseButton1Click'],function()local Ae,ud,Ye;;
Ae,ud=
{
}
,function(Ec,Xf,yp)Ae[yp]=ih(Ec,8700)-ih(Xf,19369)return Ae[yp]end;;
Ye=Ae[19675]or ud(54316,10529,19675)while Ye~=30047 do if Ye<37704 then Ip['Failure']['Content']['Retry']['Interactable']=false;;
Ip['Failure']['Content']['Retry']['ProgressBar']['Bar']['Size']=Nb['UDim2']['fromScale'](0,1);;
Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0.80000000000000004
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0.80000000000000004
}
));;
Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=0
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=0
}
));;
Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar']['Bar'],ce,
{
  ['Size']=Nb['UDim2']['fromScale'](1,1)
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar']['Bar'],ce,
{
  ['Size']=Nb['UDim2']['fromScale'](1,1)
}
));;
Nb['AnalyzeIssues']();;
Nb['task']['wait'](5);;
Ip['Failure']['Content']['Retry']['Interactable']=true;;
Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry'],hi,
{
  ['Transparency']=0
}
));;
Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=1
}
)['Play'](Do['Create'](Do,Ip['Failure']['Content']['Retry']['ProgressBar'],hi,
{
  ['GroupTransparency']=1
}
));;
Ye=Ae[-22772]or ud(94218,38718,-22772)continue elseif Ye>37704 then return else if Gi then Ye=Ae[1631]or ud(69057,15104,1631)continue end Ye=Ae[27619]or ud(48685,22489,27619)end end end);;
Ip['Installation']['Content']['Actions']['Install']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Actions']['Install']['MouseButton1Click'],function()local Ko,rf,Ag;;
Ko,rf=
{
}
,function(Db,we,Oj)Ko[Oj]=ih(Db,12050)-ih(we,4685)return Ko[Oj]end;;
Ag=Ko[-22044]or rf(46732,13847,-22044)repeat if Ag>=30020 then if Ag>30020 then Ag=Ko[21286]or rf(74533,19103,21286)continue else if not Nb['IsMastersInstalled']()and Nb['IsGamePrepared']()then Ag=Ko[364]or rf(23992,6335,364)continue end Ag=Ko[-4389]or rf(117346,59016,-4389)end else Nb['PromptProcess'](true);;
Nb['InstallMasters']();;
Nb['LoadInfos']();;
Nb['PromptProcess'](false);;
Ag=Ko[29605]or rf(113722,45104,29605)end until Ag==45925 end);;
Ip['Installation']['Content']['Actions']['Uninstall']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Actions']['Uninstall']['MouseButton1Click'],function()local tp,Ga,Jj;;
Ga,Jj=
{
}
,function(nj,xj,qe)Ga[qe]=ih(xj,26932)-ih(nj,48838)return Ga[qe]end;;
tp=Ga[-23769]or Jj(19745,127473,-23769)while tp~=39321 do if tp<23997 then Nb['PromptProcess'](true);;
Nb['UninstallMasters']();;
Nb['LoadInfos']();;
Nb['PromptProcess'](false);;
tp=Ga[-3943]or Jj(19559,80234,-3943)elseif tp<=23997 then tp=Ga[-11714]or Jj(48636,62951,-11714)continue else if Nb['IsMastersInstalled']()and Nb['IsGamePrepared']()then tp=Ga[20547]or Jj(40219,13168,20547)continue end tp=23997 end end end);;
Ip['Installation']['Content']['Actions']['Update']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Actions']['Update']['MouseButton1Click'],function()local ak,rq,mh;;
ak,rq=
{
}
,function(Ep,bg,Uj)ak[Uj]=ih(Ep,4067)-ih(bg,141)return ak[Uj]end;;
mh=ak[-4731]or rq(71980,41616,-4731)repeat if mh<29011 then Nb['PromptProcess'](true);;
Nb['UpdateMasters']();;
Nb['LoadInfos']();;
Nb['PromptProcess'](false);;
mh=ak[-6945]or rq(53858,27811,-6945)elseif mh>29011 then if Nb['IsMastersInstalled']()and Nb['IsGamePrepared']()then mh=ak[11500]or rq(15596,7248,11500)continue end mh=ak[-14645]or rq(81101,49494,-14645)else mh=ak[-29075]or rq(126768,62080,-29075)continue end until mh==61126 end);;
Ip['Installation']['Content']['Actions']['Instruction']['MouseButton1Click']['Connect'](Ip['Installation']['Content']['Actions']['Instruction']['MouseButton1Click'],function()Nb['SetPage']('UpdateInstructions')end);;
Nb['ClosePlugin']=function()local eb,Uf,bq;;
bq,eb=
{
}
,function(Of,wf,Pl)bq[Pl]=ih(Of,12210)-ih(wf,1137)return bq[Pl]end;;
Uf=bq[-5853]or eb(95902,60712,-5853)repeat if Uf<=28627 then if Uf>25323 then if not(Aj['Booting'])then Uf=bq[6627]or eb(19290,1420,6627)continue else Uf=bq[-22019]or eb(35400,1720,-22019)continue end Uf=bq[-24459]or eb(19548,1394,-24459)else Uf,Zh['Enabled']=bq[-12434]or eb(51450,47812,-12434),false continue end else return end until Uf==10387 end;;
Ip['Agreement']['Header']['Close']['MouseButton1Click']['Connect'](Ip['Agreement']['Header']['Close']['MouseButton1Click'],Nb['ClosePlugin']);;
Ip['Failure']['Header']['Close']['MouseButton1Click']['Connect'](Ip['Failure']['Header']['Close']['MouseButton1Click'],Nb['ClosePlugin']);;
Ip['GetStarted']['Header']['Close']['MouseButton1Click']['Connect'](Ip['GetStarted']['Header']['Close']['MouseButton1Click'],Nb['ClosePlugin']);;
Ip['Installation']['Header']['Close']['MouseButton1Click']['Connect'](Ip['Installation']['Header']['Close']['MouseButton1Click'],Nb['ClosePlugin']);;
Ip['Configuration']['Header']['Close']['MouseButton1Click']['Connect'](Ip['Configuration']['Header']['Close']['MouseButton1Click'],Nb['ClosePlugin']);;
Ip['UpdateInstructions']['Header']['Close']['MouseButton1Click']['Connect'](Ip['UpdateInstructions']['Header']['Close']['MouseButton1Click'],Nb['ClosePlugin']);;
Ip['Stations']['Header']['Close']['MouseButton1Click']['Connect'](Ip['Stations']['Header']['Close']['MouseButton1Click'],Nb['ClosePlugin']);;
Zh['ViewportSizeWarning']['InputBegan']['Connect'](Zh['ViewportSizeWarning']['InputBegan'],function(qa)local xe,y,Bk;;
Bk,y=
{
}
,function(Wf,mq,Z)Bk[Wf]=ih(mq,19347)-ih(Z,45078)return Bk[Wf]end;;
xe=Bk[1529]or y(1529,85299,17430)while xe~=55963 do if xe>32369 then if xe>56926 then return elseif xe<=40345 then if not(not Zh['ViewportSizeWarning']['Visible'])then xe=Bk[-16665]or y(-16665,59905,37687)continue else xe=Bk[24613]or y(24613,101562,22749)continue end xe=Bk[-7674]or y(-7674,38739,61017)else return end elseif xe<=32041 then if xe>=26883 then if xe>26883 then xe=Bk[-17461]or y(-17461,127650,28288)continue else If=true;;
Zh['ViewportSizeWarning']['Visible'],xe=false,Bk[-9218]or y(-9218,68769,31263)end else if not(If)then xe=Bk[6069]or y(6069,122530,18318)continue else xe=Bk[9664]or y(9664,119794,2582)continue end xe=40345 end else if not(qa['KeyCode']==Nb['Enum']['KeyCode']['Escape'])then xe=Bk[-28089]or y(-28089,76895,23221)continue else xe=Bk[-16010]or y(-16010,75786,19072)continue end xe=Bk[-21377]or y(-21377,56944,43180)end end end);;
Zh['ViewportSizeWarning']['GetPropertyChangedSignal'](Zh['ViewportSizeWarning'],'AbsoluteSize')['Connect'](Zh['ViewportSizeWarning']['GetPropertyChangedSignal'](Zh['ViewportSizeWarning'],'AbsoluteSize'),function()local kk,Io,Gn;;
kk,Io=function(en_,Bg,md)Io[Bg]=ih(en_,65102)-ih(md,58410)return Io[Bg]end,
{
}
;;
Gn=Io[20408]or kk(124490,20408,53246)while Gn~=57168 do if Gn<26329 then if Gn>23760 then Gn=Io[18673]or kk(82088,18673,15292)continue elseif Gn<=8228 then Gn,Zh['ViewportSizeWarning']['Visible']=Io[5653]or kk(125330,5653,21775),true else if not(Nb['workspace']['Camera']['ViewportSize']['X']<Zh['Interface']['AbsoluteSize']['X']or Nb['workspace']['Camera']['ViewportSize']['Y']<Zh['Interface']['AbsoluteSize']['Y'])then Gn=Io[13491]or kk(97186,13491,19631)continue else Gn=Io[-17854]or kk(126445,-17854,5973)continue end Gn=Io[32548]or kk(38196,32548,57577)end elseif Gn>=56679 then if Gn<=56679 then Gn,Zh['ViewportSizeWarning']['Visible']=Io[-6176]or kk(38205,-6176,57494),false else if If then Gn=Io[25313]or kk(114552,25313,15991)continue end Gn=23760 end else return end end end);;
Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['Icon'],Eh,
{
  ['Rotation']=360
}
)['Play'](Do['Create'](Do,Zh['Interface']['Frame']['Process']['Loader']['Icon'],Eh,
{
  ['Rotation']=360
}
));;
Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Blur'],ej,
{
  ['Position']=Nb['UDim2']['new'](0.5,100,2,0)
}
)['Play'](Do['Create'](Do,Ip['GetStarted']['Content']['Container']['Blur'],ej,
{
  ['Position']=Nb['UDim2']['new'](0.5,100,2,0)
}
))end Nb['game']['GetPropertyChangedSignal'](Nb['game'],'PlaceId')['Connect'](Nb['game']['GetPropertyChangedSignal'](Nb['game'],'PlaceId'),function()if Nb['game']['PlaceId']==0 then return end local tj=Nb['script']['Parent']['Failsafe']['Clone'](Nb['script']['Parent']['Failsafe']);;
tj['Parent']=Nb['game']['CoreGui'];;
tj['Frame']['Collapse']['MouseButton1Click']['Connect'](tj['Frame']['Collapse']['MouseButton1Click'],function()tj['Destroy'](tj)end)end)
