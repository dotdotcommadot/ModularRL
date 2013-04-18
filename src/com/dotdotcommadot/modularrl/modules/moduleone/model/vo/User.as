package com.dotdotcommadot.modularrl.modules.moduleone.model.vo
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class User extends EventDispatcher
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// id
		//-----------------------------------
		
		private var _id : int;

		[Bindable(event="idChange")]
		public function get id():int
		{
			return _id;
		}

		public function set id( value:int ) : void
		{
			if( _id !== value )
			{
				_id = value;
				if( hasEventListener( "idChange" ) )
					dispatchEvent( new Event( "idChange" ) );
			}
		}
		
		//-----------------------------------
		// name
		//-----------------------------------
		
		private var _name : String;

		[Bindable(event="nameChange")]
		public function get name():String
		{
			return _name;
		}

		public function set name( value:String ) : void
		{
			if( _name !== value )
			{
				_name = value;
				if( hasEventListener( "nameChange" ) )
					dispatchEvent( new Event( "nameChange" ) );
			}	
		}

		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function User()
		{
		}
	}
}