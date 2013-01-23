package com.dotdotcommadot.modularrl.controller.events
{
	import com.dotdotcommadot.modularrl.model.vo.ModuleDescriptor;
	
	import flash.events.Event;
	
	public class ModuleLoaderEvent extends Event
	{
		public static const LOAD : String 		= "load";
		public static const LOADED : String 	= "loaded";
		public static const FAILED : String 	= "failed";
		public static const PROGRESS : String 	= "progress";
		
		public var moduleDescriptor : ModuleDescriptor;
		public var errorText : String;
		public var bytesLoaded : uint;
		public var bytesTotal : uint;
		
		public function ModuleLoaderEvent( type : String, 
										   moduleDescriptor : ModuleDescriptor = null,
										   errorText : String = null, 
										   bytesLoaded : uint = 0, 
										   bytesTotal : uint = 0 )
		{
			this.moduleDescriptor = moduleDescriptor;
			this.errorText = errorText;
			this.bytesLoaded = bytesLoaded;
			this.bytesTotal = bytesTotal;
			
			super( type, true, true );
		}
		
		override public function clone() : Event
		{
			return new ModuleLoaderEvent( this.type, this.moduleDescriptor );
		}
	}
}