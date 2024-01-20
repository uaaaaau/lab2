
PROGRAM _CYCLIC

(* ### BEGIN gAxisTest ### *)
 
(* life counter emulation of digital inputs *)
 gAxisTest_DiDoIf.iLifeCntReference := gAxisTest_DiDoIf.iLifeCntReference + 1;
 gAxisTest_DiDoIf.iLifeCntNegHwEnd  := gAxisTest_DiDoIf.iLifeCntNegHwEnd  + 1;
 gAxisTest_DiDoIf.iLifeCntPosHwEnd  := gAxisTest_DiDoIf.iLifeCntPosHwEnd  + 1;
 
(* ### END gAxisTest ### *)


(* ### BEGIN gAxis03 ### *)
 
(* life counter emulation of digital inputs *)
 gAxis03_DiDoIf.iLifeCntReference := gAxis03_DiDoIf.iLifeCntReference + 1;
 gAxis03_DiDoIf.iLifeCntNegHwEnd  := gAxis03_DiDoIf.iLifeCntNegHwEnd  + 1;
 gAxis03_DiDoIf.iLifeCntPosHwEnd  := gAxis03_DiDoIf.iLifeCntPosHwEnd  + 1;
 
(* ### END gAxis03 ### *)


(* ### BEGIN gAxis04 ### *)
       
(* life counter emulation of digital inputs *)
       gAxis04_DiDoIf.iLifeCntReference := gAxis04_DiDoIf.iLifeCntReference + 1;
       gAxis04_DiDoIf.iLifeCntNegHwEnd  := gAxis04_DiDoIf.iLifeCntNegHwEnd  + 1;
       gAxis04_DiDoIf.iLifeCntPosHwEnd  := gAxis04_DiDoIf.iLifeCntPosHwEnd  + 1;
        
(* default function model of ACOPOSmicro: convert absolute steps to delta steps - overflow save delta calculation *)
       gAxis04_MotorStep0 := gAxis04_DrvIf.oSetPos - gAxis04_oSetPosOld;
       gAxis04_oSetPosOld := gAxis04_DrvIf.oSetPos;
        
(* ### END gAxis04 ### *)

END_PROGRAM

