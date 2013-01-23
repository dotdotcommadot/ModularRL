package com.dotdotcommadot.modularrl.view.modules.moduleone.view.subviewone
{
	import com.dotdotcommadot.modularrl.controller.events.StuffEvent;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.controller.events.DoStuffEvent;
	import com.dotdotcommadot.modularrl.view.modules.moduleone.model.ISubViewModel;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class SubViewOneMediator extends Mediator
	{
		[Inject]
		public var subViewModel : ISubViewModel;
		
		override public function initialize():void
		{
			addViewListener( StuffEvent.LOAD, onLoadStuffRequest, StuffEvent );
			
			trace( "/////", "initialize SubViewOneMediator", subViewModel.name );
		}
		
		protected function onLoadStuffRequest( event : StuffEvent ) : void
		{
			//dispatch( event );
			dispatch( new DoStuffEvent( DoStuffEvent.DO_THINGS ) );
		}
	}
}