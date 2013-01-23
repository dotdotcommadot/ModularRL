package com.dotdotcommadot.modularrl.view.shell
{
	import com.dotdotcommadot.modularrl.controller.events.ModuleLoaderEvent;
	import com.dotdotcommadot.modularrl.model.vo.ModuleDescriptor;
	
	import mx.core.IVisualElement;
	
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
		
		public function Shell()
		{
		}
		
		public function loadModuleOne() : void
		{
			var moduleDescriptor : ModuleDescriptor = new ModuleDescriptor();
			moduleDescriptor.path = "com/dotdotcommadot/modularrl/view/modules/moduleone/ModuleOne.swf";
			moduleDescriptor.moduleFactory = moduleFactory;
			
			dispatchEvent( new ModuleLoaderEvent(
				ModuleLoaderEvent.LOAD, moduleDescriptor ) );
		}
		
		public function addModule( module : IVisualElement ) : void
		{
			moduleContainer.addElement( module );
		}
	}
}