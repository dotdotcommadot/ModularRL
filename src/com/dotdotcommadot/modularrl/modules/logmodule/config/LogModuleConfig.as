package com.dotdotcommadot.modularrl.modules.logmodule.config
{
	import com.dotdotcommadot.modularrl.shared.controller.commands.AddLogCommand;
	import com.dotdotcommadot.modularrl.shared.controller.signals.AddLogSignal;
	import com.dotdotcommadot.modularrl.shared.model.LogModel;
	import com.dotdotcommadot.modularrl.modules.logmodule.view.main.LogModuleMainView;
	import com.dotdotcommadot.modularrl.modules.logmodule.view.main.LogModuleMainViewMediator;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class LogModuleConfig implements IConfig
	{
		[Inject] public var mediatorMap : IMediatorMap;
		
		[Inject] public var commandMap : ISignalCommandMap;
		
		[Inject] public var injector : Injector;
		
		public function configure() : void
		{
			//-----------------------------------
			// Models
			//-----------------------------------
			
			//injector.map( LogModel ).asSingleton();
			
			//-----------------------------------
			// Views
			//-----------------------------------
			
			mediatorMap.map( LogModuleMainView ).toMediator( LogModuleMainViewMediator );
			
			//-----------------------------------
			// Commands
			//-----------------------------------
			
			//commandMap.map( AddLogSignal ).toCommand( AddLogCommand );
		}
	}
}