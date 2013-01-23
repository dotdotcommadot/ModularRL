package com.dotdotcommadot.modularrl.controller.commands
{
	import com.dotdotcommadot.modularrl.controller.events.ModuleLoaderEvent;
	import com.dotdotcommadot.modularrl.service.IModuleLoaderService;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class LoadModuleCommand extends Command
	{
		[Inject]
		public var moduleLoaderService : IModuleLoaderService;

		[Inject]
		public var moduleLoaderEvent : ModuleLoaderEvent;
		
		override public function execute() : void
		{
			moduleLoaderService.load( moduleLoaderEvent.moduleDescriptor );
		}
	}
}