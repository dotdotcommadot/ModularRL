package com.dotdotcommadot.modularrl.view.shell
{
	import com.dotdotcommadot.modularrl.controller.events.ModuleLoaderEvent;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class ShellMediator extends Mediator
	{
		[Inject]
		public var view : Shell;
		
		override public function initialize():void
		{
			addViewListener( ModuleLoaderEvent.LOAD, onLoadModuleRequest, ModuleLoaderEvent );
			eventMap.mapListener( eventDispatcher, ModuleLoaderEvent.LOADED, onModuleLoaded );
		}
		
		protected function onLoadModuleRequest( event : ModuleLoaderEvent ) : void
		{
			dispatch( event );
		}
		
		protected function onModuleLoaded( event : ModuleLoaderEvent ) : void
		{
			view.addModule( event.moduleDescriptor.module );
		}
	}
}