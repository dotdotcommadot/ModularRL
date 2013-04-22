package com.dotdotcommadot.modularrl.shared.controller.commands
{
	import com.dotdotcommadot.modularrl.shared.model.LogModel;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class AddLogCommand extends Command
	{
		[Inject] public var log : String;
		[Inject] public var logModel : LogModel;
		
		override public function execute() : void
		{
			logModel.log += log + "\n";
		}
	}
}