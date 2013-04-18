package com.dotdotcommadot.modularrl.modules.moduleone.config
{
	import com.dotdotcommadot.modularrl.modules.moduleone.controller.commands.GetUsersCommand;
	import com.dotdotcommadot.modularrl.modules.moduleone.controller.signals.GetUsersSignal;
	import com.dotdotcommadot.modularrl.modules.moduleone.model.UserModel;
	import com.dotdotcommadot.modularrl.modules.moduleone.service.IUserService;
	import com.dotdotcommadot.modularrl.modules.moduleone.service.UserServiceMock;
	import com.dotdotcommadot.modularrl.modules.moduleone.view.main.ModuleOneMainView;
	import com.dotdotcommadot.modularrl.modules.moduleone.view.main.ModuleOneMainViewMediator;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class ModuleOneConfig implements IConfig
	{
		[Inject] public var mediatorMap : IMediatorMap;
		
		[Inject] public var commandMap : ISignalCommandMap;

		[Inject] public var injector : Injector;
		
		public function configure():void
		{
			//-----------------------------------
			// Models
			//-----------------------------------
			
			injector.map( UserModel ).asSingleton();
			
			//-----------------------------------
			// Views
			//-----------------------------------
			
			mediatorMap.map( ModuleOneMainView ).toMediator( ModuleOneMainViewMediator );
			
			//-----------------------------------
			// Commands
			//-----------------------------------
			
			commandMap.map( GetUsersSignal ).toCommand( GetUsersCommand );
			
			//-----------------------------------
			// Services
			//-----------------------------------
			
			injector.map( IUserService ).toSingleton( UserServiceMock );
		}
	}
}