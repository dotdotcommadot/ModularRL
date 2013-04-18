package com.dotdotcommadot.modularrl.shell.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class ShellMediator extends Mediator
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// View
		//-----------------------------------
		
		[Inject] public var view : Shell;
		
		//--------------------------------------------------------------------------
		//
		// Public Methods
		// 
		//--------------------------------------------------------------------------
		
		override public function initialize():void
		{
		}
	}
}