package com.dotdotcommadot.modularrl.view.modules.moduleone.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class SubviewModel extends EventDispatcher implements ISubViewModel
	{
		private var _name : String = "My Name";

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

		
		public function SubviewModel()
		{
		}
	}
}