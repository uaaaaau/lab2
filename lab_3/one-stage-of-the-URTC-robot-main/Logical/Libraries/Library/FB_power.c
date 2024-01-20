
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
void FB_power(struct FB_power* inst)
{
	switch (inst->State)
	{
		case Idle:
			{
				if(inst->enable)
				{
					inst->done = 0;
					inst->State = Power;
				}
			
				break;
			}
		case Power:
			{
				inst->Power.Axis = inst->Axis;
				inst->Power.Enable = 1;
				
				inst->State = Home;
			
				break;
			}
		case Home:
			{
				inst->Home.Axis = inst->Axis;
				inst->Home.Execute = 1;
				inst->Home.HomingMode = 1;
				inst->Home.Position = 0;
				if (inst->Home.Done)
				{
					inst->State = Done;
				}
			
				break;
			}
		case Done:
			{
				inst->done = 1;
				if(inst->done)
				{
					inst->Home.Done = 0;
					inst->enable = 0;
					inst->State = Idle;
				}
			
				break;
			}
	}
	MC_Power(&inst->Power);
	MC_Home(&inst->Home);
	
}
