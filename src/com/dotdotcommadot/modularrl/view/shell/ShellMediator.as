package com.dotdotcommadot.modularrl.view.shell
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class ShellMediator extends Mediator
	{
		override public function initialize():void
		{
			trace( "/////", "initialize ShellMediator" );
		}
	}
}