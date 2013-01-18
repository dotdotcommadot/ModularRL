package com.dotdotcommadot.modularrl.view.modules.moduleone.view.subviewone
{
	import com.dotdotcommadot.modularrl.controller.events.StuffEvent;
	import com.dotdotcommadot.modularrl.model.vo.Stuff;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class SubViewOne extends SkinnableComponent
	{
		public function SubViewOne()
		{
		}
		
		public function loadStuff() : void
		{
			var stuff : Stuff = new Stuff();
			stuff.id = 666;
			stuff.name = "All Kinds of Stuff";
			var stuffEvent : StuffEvent = new StuffEvent( StuffEvent.LOAD, stuff );
			
			dispatchEvent( stuffEvent );
		}
	}
}