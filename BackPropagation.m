clear all
close all
clc

disp('IFPB/PB, Joao Pessoa, 22/04/2018.')
disp('PROJETO DE REDES NEURAIS SEM REALIMENTACÄO') 
disp('ARQUITETURA: REDE MLP - Multilayer Perceptron')
disp('CONFIGURACÄO: UMA CAMADA OCULTA - UM NEURÔNIO DE SAÍDA LINEAR')
disp('ALGORITMO: BackProgation')
disp('APLICACAO: Aproximaçäo de Funçöes')
disp('AUTOR: Mestrando Arthur Medeiros Guimarães')
disp(' ')
disp('Circuito RL')
disp('Fonte: 5 V')
disp('Resistencia: 10, 7.5 e 5 homs')
disp('Resistencia da generalização: 8.75 e 6.25 homs')
disp('Indutor: 1 Henry')
disp('Tempo da simulação do circuito RL: 0,5 seg')
disp(' ')
disp(' ')
disp('Pressione ENTER no command window do matlab para prosseguir!')
pause()

to=clock; epochmax=100000; epochexb=100; 
Ni=3; Nh=5; Ns=1; WMED=0.1; 
eta=1e-3;

load circuito_RL;  % xmax dmax xtreino dtreino par xteste


NP=length(par); N=length(dtreino); NC=N/NP;
X=xtreino(1:NC,1).*xmax; D=dtreino.*dmax;

grafico2D_dataset(xtreino(1:NC,1).*xmax,dtreino.*dmax);

Wji=randn(Nh,Ni).*WMED; Wkj=randn(Ns,Nh+1).*WMED;

save BP.mat Wji Wkj 

for epoca=1:epochmax
      E=[]; deltaWkj=0; deltaWji=0;
    
    for i=1:N
      xi=[-1 xtreino(i,:)]'; d=dtreino(i,:); netj=Wji*xi;  yj=tanh(netj');  
      NETkj=Wkj.*[-1 yj];
      z(i)=sum(NETkj);
      e=d-z(i);
      etae=-eta*e;  
      deltaWkj=deltaWkj-etae*[-1 yj];
	  %deltaWji=deltaWji-etae.*((yj.*(1-yj)).*(Wkj(:,2:Nh+1)))'*xi'; 
      deltaWji=deltaWji-etae.*(sech(netj').^2.*(Wkj(:,2:Nh+1)))'*xi'; 
      E(i)=0.5*e^2; 
    end

    Wkj=Wkj+deltaWkj;
    Wji=Wji+deltaWji;
  
    SSE(epoca)=sum(E)/N;   

    epoca
    if rem(epoca,epochexb)==0,  
     grafico2D_treino(X,D,z.*dmax,NC,NP,epoca,SSE(epoca));
    end
    
end


TDD=etime(clock,to)/60;	
%grafico_sse(SSE,TDD);
save mlp_bp.mat SSE Wji Wkj  
to=clock;


X1=xteste(1:NC,1).*xmax;

for n=1:length(xteste)
    xi=[-1 xteste(n,:)]';     
    netj=Wji*xi;     
    yj=tanh(netj');        
    zteste(n)=sum(Wkj.*[-1 yj]);
end

TDD1=etime(clock,to);
% figure()
% hold on
% plot(xtreino(:,1),dtreino,'*-b')
% plot(xtreino(:,1),z','k--')
% plot(xteste(:,1),zteste','d')
grafico2D_teste(X,D,z.*dmax,NC,NP,epoca,SSE(epoca),X1,zteste.*dmax)
 
save circuito_RL.mat dmax xmax dtreino par xtreino xteste