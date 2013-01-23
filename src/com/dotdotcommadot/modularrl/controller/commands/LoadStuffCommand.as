package com.dotdotcommadot.modularrl.controller.commands
{
	import com.dotdotcommadot.modularrl.controller.events.StuffEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class LoadStuffCommand extends Command
	{
		[Inject]
		public var stuffEvent : StuffEvent;
		
		override public function execute() : void
		{
			Alert.show( stuffEvent.stuff.name, String( stuffEvent.stuff.id ), 4, null, null, null, 4, FlexGlobals.topLevelApplication.systemManager );
		}
	}
}