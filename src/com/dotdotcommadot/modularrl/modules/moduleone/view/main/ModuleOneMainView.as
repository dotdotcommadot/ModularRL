package com.dotdotcommadot.modularrl.modules.moduleone.view.main
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.Button;
	import spark.components.DataGrid;
	import spark.components.NumericStepper;
	import spark.components.SkinnableContainer;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class ModuleOneMainView extends SkinnableContainer
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// SkinParts
		//-----------------------------------
		
		[SkinPart( required="true" )]
		public var numberOfUsersStepper : NumericStepper;

		[SkinPart( required="true" )]
		public var loadUsersButton : Button;

		[SkinPart( required="true" )]
		public var usersGrid : DataGrid;
		
		//-----------------------------------
		// Users
		//-----------------------------------
		
		private var _users : ArrayCollection;

		[Bindable(event="usersChange")]
		public function get users() : ArrayCollection
		{
			return _users;
		}

		public function set users( value : ArrayCollection ) : void
		{
			if( _users !== value )
			{
				_users = value;
				if( hasEventListener( "usersChange" ) )
					dispatchEvent( new Event( "usersChange" ) );
			}
		}

		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function ModuleOneMainView()
		{
		}
	}
}