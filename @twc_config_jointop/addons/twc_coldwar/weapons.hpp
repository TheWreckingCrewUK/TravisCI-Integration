class cfgWeapons
{
	class UK3CB_BAF_L1A1_Wood;
	class tf47_m3maaws;
	
	class twc_L1A1_SUIT:UK3CB_BAF_L1A1_Wood
	{
		scope = 1;
		author = "jayman";
		class LinkedItems
		{
			class LinkedItemsOptic
			{
				slot = "CowsSlot";
				item= "UK3CB_BAF_SUIT";
			};
		};
	};
	
	class TWC_Carl_Gustav:tf47_m3maaws
	{
		scope = 1;
		author="FakeMatty";
		class LinkedItems
		{
			class LinkedItemsOptic
			{
				slot="CowsSlot";
				item="tf47_optic_m3maaws";
			};
		};
	};
};