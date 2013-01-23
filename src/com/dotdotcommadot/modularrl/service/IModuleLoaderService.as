package com.dotdotcommadot.modularrl.service
{
	import com.dotdotcommadot.modularrl.model.vo.ModuleDescriptor;
	
	import mx.events.ModuleEvent;

	public interface IModuleLoaderService
	{
		function load( moduleDescriptor : ModuleDescriptor ) : void;
	}
}