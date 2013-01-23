package com.dotdotcommadot.modularrl.view.modules.moduleone.config
{
	import com.dotdotcommadot.modularrl.controller.commands.LoadStuffCommand;
	import com.dotdotcommadot.modularrl.controller.events.StuffEvent;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.controller.commands.DoStuffCommand;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.controller.events.DoStuffEvent;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.model.ISubViewModel;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.model.SubviewModel;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.view.subviewone.SubViewOne;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.view.subviewone.SubViewOneMediator;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class ModuleOneConfig implements IConfig
	{
		[Inject]
		public var mediatorMap : IMediatorMap;
		
		[Inject]
		public var commandMap : IEventCommandMap;

		[Inject]
		public var injector : Injector;
		
		public function configure():void
		{
			mediatorMap.map( SubViewOne ).toMediator( SubViewOneMediator );
			
			commandMap.map( StuffEvent.LOAD, StuffEvent ).toCommand( LoadStuffCommand );
			commandMap.map( DoStuffEvent.DO_THINGS, DoStuffEvent ).toCommand( DoStuffCommand );
			
			injector.map( ISubViewModel ).toSingleton( SubviewModel );
		}
	}
}