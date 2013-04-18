package com.dotdotcommadot.modularrl.shell.view
{
	import flash.events.Event;
	import flash.net.LocalConnection;
	import flash.system.ApplicationDomain;
	import flash.system.System;
	
	import spark.components.Button;
	import spark.components.SkinnableContainer;
	import spark.modules.ModuleLoader;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class Shell extends SkinnableContainer
	{
		//--------------------------------------------------------------------------
		//
		// Public Static Properties
		// 
		//--------------------------------------------------------------------------
		
		public static const MODULE_ONE_PATH : String = "com/dotdotcommadot/modularrl/modules/moduleone/ModuleOne.swf";

		public static const MODULE_TWO_PATH : String = "com/dotdotcommadot/modularrl/modules/moduletwo/ModuleTwo.swf";
		
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// SkinParts
		//-----------------------------------
		
		[SkinPart(required="true")]
		public var loadModuleOneButton : Button;
		
		[SkinPart(required="true")]
		public var loadModuleTwoButton : Button;

		[SkinPart(required="true")]
		public var moduleLoader : ModuleLoader;
		
		//-----------------------------------
		// General
		//-----------------------------------
		
		[Bindable] public var usedMemory : String;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function Shell()
		{
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		//--------------------------------------------------------------------------
		//
		// Public Methods
		// 
		//--------------------------------------------------------------------------
		
		public function loadModule( path : String ) : void
		{
			moduleLoader.applicationDomain = new ApplicationDomain( ApplicationDomain.currentDomain );
			moduleLoader.loadModule(path);
		}
		
		public function unloadModule() : void
		{
			moduleLoader.applicationDomain = null;
			moduleLoader.unloadModule();
			
			forceGC();
		}
		
		//--------------------------------------------------------------------------
		//
		// Private Methods
		// 
		//--------------------------------------------------------------------------
		
		private function onEnterFrame( event : Event ) : void
		{
			usedMemory = ( System.totalMemory / 1024 / 1024 ).toFixed(2);
		}
		
		/*
		Consider Forcing the Garbage Collector
		======================================
		This is an unsupported hack that forces the garbage collector in 
		most versions of Flash Player. It is not guaranteed to always have
		this effect in future versions of Flash Player. There is an 
		enhancement request to provide a supported API for forcing garbage 
		collection in the Adobe JIRA which you may choose to vote for.
		*/
		
		private function forceGC() : void
		{
			System.gc();
			
			try
			{
				new LocalConnection().connect( "something" );
				new LocalConnection().connect( "something" );
			}
			catch (e:Error) {} // ignore intentionally
		}
	}
}