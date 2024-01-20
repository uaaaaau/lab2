
PROGRAM _INIT

(* ### BEGIN gAxisTest ### *)
 
(* initialize variables *)
 gAxisTest_HW.DrvIf_Typ := ncSDC_DRVSERVO16;
 strcpy( ADR(gAxisTest_HW.DrvIf_Name[0]), ADR('gAxisTest_DrvIf') );
 gAxisTest_HW.DiDoIf_Typ := ncSDC_DIDO;
 strcpy( ADR(gAxisTest_HW.DiDoIf_Name[0]), ADR('gAxisTest_DiDoIf') );
  
(* force variable offset generation *)
 gAxisTest.size                      := gAxisTest.size;
 gAxisTest_DrvIf.iLifeCnt            := gAxisTest_DrvIf.iLifeCnt;
 gAxisTest_DiDoIf.iLifeCntDriveReady := gAxisTest_DiDoIf.iLifeCntDriveReady;
 gAxisTest_ModuleOk                  := gAxisTest_ModuleOk;
  
(* assign your hardware inputs here*)
 
(* gAxisTest_DiDoIf.iPosHwEnd  := gAxisTest_DiDoIf.iPosHwEnd;
 gAxisTest_DiDoIf.iNegHwEnd  := gAxisTest_DiDoIf.iNegHwEnd;
 gAxisTest_DiDoIf.iReference := gAxisTest_DiDoIf.iReference;
 *)
 
(* ### END gAxisTest ### *)


(* ### BEGIN gAxis03 ### *)
 
(* initialize variables *)
 gAxis03_HW.DrvIf_Typ := ncSDC_DRVSERVO16;
 strcpy( ADR(gAxis03_HW.DrvIf_Name[0]), ADR('gAxis03_DrvIf') );
 gAxis03_HW.DiDoIf_Typ := ncSDC_DIDO;
 strcpy( ADR(gAxis03_HW.DiDoIf_Name[0]), ADR('gAxis03_DiDoIf') );
  
(* force variable offset generation *)
 gAxis03.size                      := gAxis03.size;
 gAxis03_DrvIf.iLifeCnt            := gAxis03_DrvIf.iLifeCnt;
 gAxis03_DiDoIf.iLifeCntDriveReady := gAxis03_DiDoIf.iLifeCntDriveReady;
 gAxis03_ModuleOk                  := gAxis03_ModuleOk;
  
(* assign your hardware inputs here*)
 
(* gAxis03_DiDoIf.iPosHwEnd  := gAxis03_DiDoIf.iPosHwEnd;
 gAxis03_DiDoIf.iNegHwEnd  := gAxis03_DiDoIf.iNegHwEnd;
 gAxis03_DiDoIf.iReference := gAxis03_DiDoIf.iReference;
 *)
 
(* ### END gAxis03 ### *)


(* ### BEGIN gAxis04 ### *)
       
(* initialize general interfaces *)
       gAxis04.size := gAxis04.size;
       gAxis04_HW.DrvIf_Typ := ncSDC_DRVSM16;
       brsstrcpy( ADR(gAxis04_HW.DrvIf_Name[0]), ADR('gAxis04_DrvIf') );
       gAxis04_HW.DiDoIf_Typ := ncSDC_DIDO;
       brsstrcpy( ADR(gAxis04_HW.DiDoIf_Name[0]), ADR('gAxis04_DiDoIf') );
       gAxis04_HW.EncIf1_Typ := ncSDC_ENC16;
       brsstrcpy( ADR(gAxis04_HW.EncIf1_Name[0]), ADR('gAxis04_EncIf1') );
       gAxis04_EncIf1.iLifeCnt := gAxis04_EncIf1.iLifeCnt;
       
(* initialize old-value for delta step calculation *)
       gAxis04_oSetPosOld := gAxis04_DrvIf.oSetPos;
        
(* ### END gAxis04 ### *)

END_PROGRAM

