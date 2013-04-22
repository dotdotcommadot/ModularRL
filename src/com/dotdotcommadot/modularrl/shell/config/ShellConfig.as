package com.dotdotcommadot.modularrl.shell.config
{
	import com.dotdotcommadot.modularrl.shared.controller.commands.AddLogCommand;
	import com.dotdotcommadot.modularrl.shared.controller.signals.AddLogSignal;
	import com.dotdotcommadot.modularrl.shared.model.LogModel;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class ShellConfig implements IConfig
	{
		[Inject] public var mediatorMap:IMediatorMap;
		
		[Inject] public var injector : Injector;
		
		[Inject] public var commandMap : ISignalCommandMap;
		
		public function configure():void
		{
			//-----------------------------------
			// Models
			//-----------------------------------
			
			// Intermodular communication workaround
			// On one side, you could say that this is actually in the wrong scope: 
			// the shell application shouldn't have to know about these.
			// on the other side: moduleTwo shouldn't have to know about the addLogCommand either I think,
			// so where else do you map the signal to the command, instead of in the shell?
			// Rework is in progress
			
			injector.map( LogModel ).asSingleton();
			
			commandMap.map( AddLogSignal ).toCommand( AddLogCommand );
		}
	}
}