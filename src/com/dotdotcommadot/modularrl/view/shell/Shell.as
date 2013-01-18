package com.dotdotcommadot.modularrl.view.shell
{
	import mx.controls.Alert;
	import mx.core.IVisualElement;
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;
	
	import spark.components.Group;
	import spark.components.supportClasses.SkinnableComponent;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class Shell extends SkinnableComponent
	{
		[SkinPart(required="true")]
		public var moduleContainer : Group;
		
		private var moduleInfo : IModuleInfo;
		
		public function Shell()
		{
		}
		
		public function loadModuleOne() : void
		{
			moduleInfo = ModuleManager.getModule( "com/dotdotcommadot/modularrl/view/modules/moduleone/ModuleOne.swf" );
			
			moduleInfo.addEventListener( ModuleEvent.READY, onModuleLoaded);
			moduleInfo.addEventListener( ModuleEvent.ERROR, onModuleLoadError);
			
			moduleInfo.load( null, null, null, moduleFactory );
		}
		
		private function onModuleLoaded( event : ModuleEvent ) : void 
		{
			moduleInfo.removeEventListener( ModuleEvent.READY, onModuleLoaded);
			moduleInfo.removeEventListener( ModuleEvent.ERROR, onModuleLoadError);
			
			moduleContainer.addElement( moduleInfo.factory.create() as IVisualElement );
			
			moduleInfo = null;
		}
		
		private function onModuleLoadError( event : ModuleEvent ) : void 
		{
			moduleInfo.removeEventListener( ModuleEvent.READY, onModuleLoaded);
			moduleInfo.removeEventListener( ModuleEvent.ERROR, onModuleLoadError);
			moduleInfo = null;
			
			Alert.show( event.errorText, "Loading Error" );
		}
	}
}