package com.dotdotcommadot.modularrl.service.impl
{
	import com.dotdotcommadot.modularrl.controller.events.ModuleLoaderEvent;
	import com.dotdotcommadot.modularrl.model.vo.ModuleDescriptor;
	import com.dotdotcommadot.modularrl.service.IModuleLoaderService;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;
	
	import mx.controls.Alert;
	import mx.core.IVisualElement;
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;
	
	import spark.modules.ModuleLoader;
	
	public class ModuleLoaderService extends EventDispatcher implements IModuleLoaderService
	{
		[Inject] 
		public var eventDispatcher : IEventDispatcher;
		
		private var moduleInfo : IModuleInfo;
		
		private var moduleDescriptor : ModuleDescriptor;

		public function ModuleLoaderService()
		{
		}
		
		public function load( moduleDescriptor : ModuleDescriptor ) : void
		{
			this.moduleDescriptor = moduleDescriptor;
			moduleInfo = ModuleManager.getModule( moduleDescriptor.path )
				
			moduleInfo.addEventListener( ModuleEvent.READY, onModuleLoaded, false, 0, true );
			moduleInfo.addEventListener( ModuleEvent.PROGRESS, onModuleLoadingProgress, false, 0, true );
			moduleInfo.addEventListener( ModuleEvent.ERROR, onModuleLoadingFailed, false, 0, true );
			
			moduleInfo.load( null, null, null, moduleDescriptor.moduleFactory );
		}
		
		protected function onModuleLoadingProgress( event : ModuleEvent ) : void
		{
			eventDispatcher.dispatchEvent( 
				new ModuleLoaderEvent( ModuleLoaderEvent.PROGRESS, 
					moduleDescriptor, "", event.bytesLoaded, event.bytesTotal ) );
		}
		
		protected function onModuleLoaded( event : ModuleEvent ) : void
		{
			moduleInfo.removeEventListener( ModuleEvent.READY, onModuleLoaded );
			moduleInfo.removeEventListener( ModuleEvent.PROGRESS, onModuleLoadingProgress );
			moduleInfo.removeEventListener( ModuleEvent.ERROR, onModuleLoadingFailed );
			
			moduleDescriptor.module = moduleInfo.factory.create() as IVisualElement;
			
			eventDispatcher.dispatchEvent( 
				new ModuleLoaderEvent( ModuleLoaderEvent.LOADED, moduleDescriptor ) );
			
			moduleInfo = null;
		}
		
		protected function onModuleLoadingFailed( event : ModuleEvent ) : void
		{
			moduleInfo.removeEventListener( ModuleEvent.READY, onModuleLoaded );
			moduleInfo.removeEventListener( ModuleEvent.PROGRESS, onModuleLoadingProgress );
			moduleInfo.removeEventListener( ModuleEvent.ERROR, onModuleLoadingFailed );
			
			eventDispatcher.dispatchEvent( 
				new ModuleLoaderEvent( ModuleLoaderEvent.FAILED, moduleDescriptor, event.errorText ) );
			
			Alert.show( event.errorText, "Loading Error" );
			
			moduleInfo = null;
		}
	}
}