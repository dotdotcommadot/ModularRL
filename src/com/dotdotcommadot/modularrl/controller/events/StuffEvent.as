package com.dotdotcommadot.modularrl.controller.events
{
	import com.dotdotcommadot.modularrl.model.vo.Stuff;
	
	import flash.events.Event;
	
	public class StuffEvent extends Event
	{
		public static const LOAD : String = "load";
		
		public var stuff : Stuff;
		
		public function StuffEvent( type:String, stuff : Stuff )
		{
			this.stuff = stuff;
			
			super( type, true, true );
		}
		
		override public function clone() : Event
		{
			return new StuffEvent( this.type, this.stuff );
		}
	}
}