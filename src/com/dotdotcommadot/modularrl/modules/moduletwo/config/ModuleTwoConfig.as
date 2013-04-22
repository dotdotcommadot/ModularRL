package com.dotdotcommadot.modularrl.modules.moduletwo.config
{
	import com.dotdotcommadot.modularrl.modules.moduletwo.view.main.ModuleTwoMainView;
	import com.dotdotcommadot.modularrl.modules.moduletwo.view.main.ModuleTwoMainViewMediator;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class ModuleTwoConfig implements IConfig
	{
		[Inject] public var mediatorMap : IMediatorMap;
		
		[Inject] public var commandMap : ISignalCommandMap;
		
		[Inject] public var injector : Injector;
		
		public function configure():void
		{
			//-----------------------------------
			// Views
			//-----------------------------------
			
			mediatorMap.map( ModuleTwoMainView ).toMediator( ModuleTwoMainViewMediator );
			
			//-----------------------------------
			// Commands
			//-----------------------------------
			
			//commandMap.map( AddLogSignal ).toCommand( AddLogCommand );
		}
	}
}