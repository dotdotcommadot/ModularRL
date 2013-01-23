package com.dotdotcommadot.modularrl.view.modules.moduleone.controller.commands
{
	import com.dotdotcommadot.modularrl.view.modules.moduleone.model.SubviewModel;
	
	import mx.controls.Alert;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class DoStuffCommand extends Command
	{
		[Inject]
		public var subviewModel : SubviewModel;
		
		override public function execute() : void
		{
			Alert.show( subviewModel.name, subviewModel.name );
		}
	}
}