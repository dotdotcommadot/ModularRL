package com.dotdotcommadot.modularrl.shared.controller.signals
{
	import org.osflash.signals.Signal;
	
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class AddLogSignal extends Signal
	{
		public function AddLogSignal()
		{
			super( String );
		}
	}
}