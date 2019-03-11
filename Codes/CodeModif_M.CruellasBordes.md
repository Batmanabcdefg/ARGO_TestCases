## Modifications and adds made in the Argo plateform (February 2018 version)
For his Master thesis (February 2019), Marc Cruellas Bordes added and modified some part of the code in order to run his test cases correctly. 
Knowing that I am testing the effect of the DG-BR2 method on the exact **same meshes he used** (`in order to compare his results -> DG-IP + AV`), I decided to report here all the modifications he made in order to get the heat flux or to use some tools from DGFluid (not accessible by the VKI).

Hope it'll be usefull for the next VKI users!

### Modif 1 : Adding the calculation of the heat flux 

```markdown
### In Argo/DGLib/DGLib/conservationLaw.cc
// _______________________________________________________________________________ 
// **In function PerfectGas::addStateFunctionTags() add**:

  gradientFunctionTag["TestHeatFlux"] = std::make_pair(TESTHEATFLUX,VECTOR);

// _______________________________________________________________________________ 
// **In function PerfectGas::computeGradientFunction add in switch (tag)**:
  case TESTHEATFLUX:
    {
      computeTestHeatFlux(*visSol,visGra,xyz,t,fieldData,fun);
      fun *= (temperatureScale/lengthScale)*nonDim->conductivityScale();
      return true;break;
    }
// _______________________________________________________________________________  
// **Add this function**:
bool PerfectGas::computeTestHeatFlux(const DGMatrix& sol,
                                 const DGMatrix* grad,
                                 const DGMatrix& xyz,
                                 double t,
                                 const DGMatrixArray& data,
                                 DGMatrix& flux) const {

  for (size_t k=0;k<sol.size1();k++) {
    double muT,kaT;
    const DGVectorArray fd(data,k);
    const DGVector gradXYZ[3]={grad[0].seeRow(k),
                   grad[1].seeRow(k),
                   grad[2].seeRow(k)};
    computeDiffusivities(xyz.seeRow(k),t,DGVector(sol.seeRow(k)),gradXYZ,fd,muT,kaT);
    double gFEk[3];
    frame->computeFrameEnergyGradient(xyz.seeRowPtr(k),t,overEnergyScale,gFEk);
    double rho = softmax(minimumDensity,sol(k,0));
    double overRho = 1./sol(k,0);
    double kOverRhoCv = kaT * overRho;
    double u = sol(k,1) * overRho;
    double v = sol(k,2) * overRho;
    double Ek = u * u + v * v;
    double eMinus= sol(k,3) * overRho - Ek;
    
    // Added by Pierre Schrooyen
    flux(k,0) = kOverRhoCv*(grad[0](k,3) - eMinus*grad[0](k,0) - (grad[0](k,1)*u + grad[0](k,2)*v)+rho*gFEk[0]); 
    flux(k,1) = kOverRhoCv*(grad[1](k,3) - eMinus*grad[1](k,0) - (grad[1](k,1)*u + grad[1](k,2)*v)+rho*gFEk[1]); 
  }
  return true;
}
// _______________________________________________________________________________ 
// **In the function PerfectGas::dirichletBC, Put this part in comment as done here**:
  case SUPERSONICOUTWARD:
        break;
// Modif Marc (mis en commentaire)
// s'assurer que la outlet est supersonique ! 
      case SUBSONICOUTWARD:
       // for (size_t i=0;i<dim;i++) v2 += UL(i+1)*UL(i+1);
       // v2 /= rho; 
       // UR(energyIndex) = p / GM1  + (0.5* v2 - rho * fEk);
        break;
      case TANGENT:
      case SUBSONICINWARD:
       // for (size_t i=0;i<dim;i++) UR(i+1) = 0;
       // UR(energyIndex) = p / GM1  - rho * fEk;
        break;

 
 
### In Argo/DGLib/DGLib/conservationLaw.hh (don't forget to declare the function computeTestHeatFlux)
// _______________________________________________________________________________ 
// **Add**:
virtual bool computeTestHeatFlux(const DGMatrix&,const DGMatrix*,const DGMatrix&,double,const DGMatrixArray&,DGMatrix&) const;
```


### Modif 2: Pressure gradient

```markdown
### In Argo/DGLib/DGLib/auxProcessors.cc
// _______________________________________________________________________________ 
// **In the constructor DGArtificialViscosityAP::DGArtificialViscosityAP add**:
  pressureTag  = cLaw->getStateFunctionTag("Pressure",myVar);
// _______________________________________________________________________________ 
// **In the function DGArtificialViscosityAP::DGArtificialViscosityAP modif**:
    //---- compute Persson's paramters ------------------------------
    ...
    // Modif Marc : densityTag -> pressureTag
        cLaw->computeStateFunction(pressureTag,UPQP,coordQP,t,dummyFieldData,UPQP_sV);
        cLaw->computeStateFunction(pressureTag,UPM1QP,coordQP,t,dummyFieldData,UPM1QP_sV);

    
```

