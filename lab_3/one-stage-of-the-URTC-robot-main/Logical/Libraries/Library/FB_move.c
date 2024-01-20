
#include <bur/plctypes.h>
#ifdef __cplusplus
	extern "C"
	{
#endif
	#include "Library.h"
#ifdef __cplusplus
	};
#endif
/* TODO: Add your comment here */
void FB_move(struct FB_move* inst)
{
	switch (inst->State)
	{
		case Idle_move:
			{
				if(inst->enable)
				{
					inst->Move.Done = 0;
					inst->done = 0;
					inst->State = Move;
				}
			
				break;
			}
		case Move:
			{
				inst->Move.Axis = inst->Axis;
				inst->Move.Execute = 1;
				inst->Move.Distance = inst->length;
				inst->Move.Velocity = 3000;
				inst->Move.Acceleration = 6000;
				inst->Move.Deceleration = 6000;
				
				if(inst->Move.Done)
				{
					inst->State = Done_move;
				}
			
				break;
			}
		case Done_move:
			{				
				inst->done = 1;
				if(inst->done)
				{
					inst->Move.Execute = 0;
					inst->length = 0;
					inst->enable = 0;
					inst->State = Idle_move;
				}
			
				break;
			}
	}
	MC_MoveAdditive(&inst->Move);
}
// все√ќ хороше√ќ