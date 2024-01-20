
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
void FB_Trajectory(struct FB_Trajectory* inst)
{
	switch (inst->State)
	{
		case Idle_Trajectory :
			{
				if (inst->enable)
				{
					inst->done = 0;
					inst->State = PowerY;
				}
				break;
			}
		case PowerY : 
			{
				inst->Power_AxisY.Axis = inst->AxisY;
				inst->Power_AxisY.enable = 1;
				if(inst->Power_AxisY.done)
				{
					inst->State = PowerZ;
				}
				break;
			}
		case PowerZ : 
			{
				inst->Power_AxisZ.Axis = inst->AxisZ;
				inst->Power_AxisZ.enable = 1;
				if(inst->Power_AxisZ.done)
				{
					inst->State = side1;
				}
				break;
			}
		case side1 :
			{
				inst->Move_Axis.Axis = inst->AxisY;
				inst->Move_Axis.length = inst->lengthY*100;
				inst->Move_Axis.enable = 1;
				if(inst->Move_Axis.done)
				{
					inst->State = side2;
				}
				break;
			}
		case side2 :
			{
				inst->Move_Axis.Axis = inst->AxisZ;
				inst->Move_Axis.length = inst->lengthZ*100;
				inst->Move_Axis.enable = 1;
				if(inst->Move_Axis.done)
				{
					inst->State = side3;
				}
				break;
			}
		case side3 :
			{
				inst->Move_Axis.Axis = inst->AxisY;
				inst->Move_Axis.length = -inst->lengthY*100;
				inst->Move_Axis.enable = 1;
				if(inst->Move_Axis.done)
				{
					inst->State = side4;
				}
				break;
			}
		case side4 :
			{
				inst->Move_Axis.Axis = inst->AxisZ;
				inst->Move_Axis.length = -inst->lengthZ*100;
				inst->Move_Axis.enable = 1;
				if(inst->Move_Axis.done)
				{
					inst->State = Stop_Trajectory;
				}
				break;
			}
		case Stop_Trajectory :
			{
				inst->Power_AxisY.Power.Enable = 0;
				inst->Power_AxisZ.Power.Enable = 0;
				if (!inst->Power_AxisY.Power.Status && !inst->Power_AxisZ.Power.Status)
				{
					inst->State = Done_Trajectory;
				}
			}
		case Done_Trajectory :
			{
				inst->done = 1;
				if(inst->done)
				{
					inst->Move_Axis.done = 0;
					inst->Move_Axis.done = 0;
					inst->enable = 0;
					inst->State = Idle_Trajectory;
				}
				break;
			}
	}
	
	FB_move(&inst->Move_Axis);
	FB_power(&inst->Power_AxisY);
	FB_power(&inst->Power_AxisZ);
}
