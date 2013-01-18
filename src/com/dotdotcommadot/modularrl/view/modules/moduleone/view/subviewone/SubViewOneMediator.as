package com.dotdotcommadot.modularrl.view.modules.moduleone.view.subviewone
{
	import com.dotdotcommadot.modularrl.controller.events.StuffEvent;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class SubViewOneMediator extends Mediator
	{
		override public function initialize():void
		{
			addViewListener( StuffEvent.LOAD, onLoadStuffRequest, StuffEvent );
			
			trace( "/////", "initialize SubViewOneMediator" );
		}
		
		protected function onLoadStuffRequest( event : StuffEvent ) : void
		{
			dispatch( event );
		}
	}
}