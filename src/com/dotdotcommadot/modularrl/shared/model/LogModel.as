package com.dotdotcommadot.modularrl.shared.model
{
	import flash.events.Event;
	
	import org.osflash.signals.Signal;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class LogModel
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// Signals
		//-----------------------------------
		
		public var logChanged : Signal = new Signal();
		
		//-----------------------------------
		// Log
		//-----------------------------------
		
		private var _log : String = "";

		public function get log():String
		{
			return _log;
		}

		public function set log( value:String ) : void
		{
			if( _log !== value )
			{
				_log = value;
				
				logChanged.dispatch();
			}
		}

		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function LogModel()
		{
		}
	}
}