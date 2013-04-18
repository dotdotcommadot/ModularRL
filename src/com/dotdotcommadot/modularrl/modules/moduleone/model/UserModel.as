package com.dotdotcommadot.modularrl.modules.moduleone.model
{
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.Signal;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class UserModel
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// Signals
		//-----------------------------------
		
		public var usersChanged : Signal = new Signal;
		
		//-----------------------------------
		// Users
		//-----------------------------------
		
		private var _users : ArrayCollection;

		public function get users():ArrayCollection
		{
			return _users;
		}

		public function set users( value:ArrayCollection ) : void
		{
			if( _users !== value )
			{
				_users = value;
				
				usersChanged.dispatch()
			}
		}

		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function UserModel()
		{
		}
	}
}