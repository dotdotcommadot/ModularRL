package com.dotdotcommadot.modularrl.config
{
	import com.dotdotcommadot.modularrl.controller.commands.LoadModuleCommand;
	import com.dotdotcommadot.modularrl.controller.events.ModuleLoaderEvent;
	import com.dotdotcommadot.modularrl.service.IModuleLoaderService;
	import com.dotdotcommadot.modularrl.service.impl.ModuleLoaderService;
	import com.dotdotcommadot.modularrl.view.shell.Shell;
	import com.dotdotcommadot.modularrl.view.shell.ShellMediator;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class AppConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap : IEventCommandMap;
		
		[Inject]
		public var injector : Injector;
		
		public function configure():void
		{
			mediatorMap.map( Shell ).toMediator( ShellMediator );
			
			commandMap.map( ModuleLoaderEvent.LOAD, ModuleLoaderEvent ).toCommand( LoadModuleCommand );
			
			injector.map( IModuleLoaderService ).toSingleton( ModuleLoaderService );
		}
	}
}