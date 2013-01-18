package com.dotdotcommadot.modularrl.config
{
	import com.dotdotcommadot.modularrl.view.shell.Shell;
	import com.dotdotcommadot.modularrl.view.shell.ShellMediator;
	
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
		
		public function configure():void
		{
			mediatorMap.map( Shell ).toMediator( ShellMediator );
		}
	}
}