package com.dotdotcommadot.modularrl.view.modules.moduleone.controller.events
{
	import com.dotdotcommadot.modularrl.model.vo.Stuff;
	
	import flash.events.Event;
	
	public class DoStuffEvent extends Event
	{
		public static const DO_THINGS : String = "doThings";
		
		public function DoStuffEvent( type:String )
		{
			super( type, true, true );
		}
		
		override public function clone() : Event
		{
			return new DoStuffEvent( this.type );
		}
	}
}