package com.dotdotcommadot.modularrl.shell.config
{
	import com.dotdotcommadot.modularrl.shell.view.Shell;
	import com.dotdotcommadot.modularrl.shell.view.ShellMediator;
	
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
			mediatorMap.map( Shell ).toMediator( ShellMediator );
		}
	}
}