package com.dotdotcommadot.modularrl.model.vo
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.IFlexModuleFactory;
	import mx.core.IVisualElement;
	
	import spark.modules.Module;
	import spark.modules.ModuleLoader;

	public class ModuleDescriptor extends EventDispatcher
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// Path
		//-----------------------------------
		
		private var _path : String;

		[Bindable(event="pathChange")]
		public function get path():String
		{
			return _path;
		}

		public function set path(value:String):void
		{
			if( _path !== value)
			{
				_path = value;
				if( hasEventListener("pathChange") )
					dispatchEvent(new Event("pathChange"));
			}
		}
		
		//-----------------------------------
		// Module
		//-----------------------------------
		
		private var _module : IVisualElement;

		[Bindable(event="moduleChange")]
		public function get module() : IVisualElement
		{
			return _module;
		}

		public function set module( value : IVisualElement ):void
		{
			if( _module !== value)
			{
				_module = value;
				if( hasEventListener("moduleChange") )
					dispatchEvent(new Event("moduleChange"));
			}
		}
		
		//-----------------------------------
		// ModuleFactory
		//-----------------------------------
		
		private var _moduleFactory : IFlexModuleFactory;

		[Bindable(event="moduleFactoryChange")]
		public function get moduleFactory():IFlexModuleFactory
		{
			return _moduleFactory;
		}

		public function set moduleFactory(value:IFlexModuleFactory):void
		{
			if( _moduleFactory !== value)
			{
				_moduleFactory = value;
				if( hasEventListener("moduleFactoryChange") )
					dispatchEvent(new Event("moduleFactoryChange"));
			}
		}

		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function ModuleDescriptor()
		{
		}
	}
}