# ModularRL

ModularRL is a demo for a modular application built with Flex 4.9 and Robotlegs 2.
The application can be used as a point of reference if you'd like to learn more about:
- Robotlegs 2 & MVCS architecture
- Robotlegs 2 & modules
- Robotlegs 2 & As3Signals
- Flex modules

## Notes

Make sure to use with at least Robotlegs 2.0.0b4. 
This version introduces the stageCrawler extension, 
which "checks for views that might already be on the stage after context initialization
and ensures that those views are handled."

## Modules

Modules in Flex used to be quite a source of memory leaks, 
and it still remains very important to test module based applications thoroughly.
A lot of articles can be found on this subject, but not all of the tips are still as relevant.
This demo is not intented to be complete on this subject, but to give you a decent starting point.

## As3-Signals

The application makes use of signals, because I wanted to test if there were no issues when installing a custom MVCSBundle and extenstion.

## Requirements

ModularRL makes use of:
- [Apache Flex 4.9](http://flex.apache.org)
- [Robotlegs 2](http://www.robotlegs.org/)
- [As3-Signals](https://github.com/robertpenner/as3-signals)
- [Signal Command Map](https://github.com/pixels4nickels/robotlegs-extensions-SignalCommandMap)

## Tips

The most of the tips I found in [this great article](http://blogs.adobe.com/tomsugden/2010/02/how_to_unload_modules_effectively.html).
But this was written with Flex 3.5 in mind, so not all of the tips are still relevant.
I made an overview of what I found to be still of use in Flex 4.9.

### Add "-keep-all-type-selectors" to the compiler arguments
When the MXML compiled encounters a component that has default 
styling specified in a type-selector of a CSS file in the Flex SDK 
or another referenced CSS file, it will auto-generate code to 
register those styles. If this registration happens inside a module,
the module will be pinned in memory. To avoid this, the components
with default styles can be linked into the shell application. 
Alternatively (and more simply) the -keep-all-type-selectors 
compiler argument can be used, which forces the compiler to generate
style registration code for all known type selectors, regardless of 
whether the component is linked into the application.
```javascript
-keep-all-type-selectors
```
      
### Load modules into child application domains
Both the module and a compiled CSS stylesheet are loaded into a
child application domain. This application domain can then be
made eligible for garbage collection during unloading, meaning
that the class definitions for the module and stylesheet can be
garbage collected. 
```javascript
moduleLoader.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
moduleLoader.loadModule("module/MyModule.swf");
```

### Consider forcing the Garbage Collector after unloading
This is an unsupported hack that forces the garbage collector in 
most versions of Flash Player. It is not guaranteed to always have
this effect in future versions of Flash Player. 
```javascript
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
```
        
## Bugs

### Debug and Profile mode always ends up in memory leaks
When publishing the application in debug mode, you will notice that the memory almost doens't get cleared.
It is easy to push the application to 100000 K, by just loading and unloading the modules.
It's only when you publish it as a release version (in Flash Builder this is "Export Release Build"),
that memory management will be good.
This makes it quite hard to test, since you can't use Flash Builder's built in profiler.

## Further Reading

[http://blogs.adobe.com/tomsugden/2010/02/how_to_unload_modules_effectively.html](http://blogs.adobe.com/tomsugden/2010/02/how_to_unload_modules_effectively.html)

[http://blogs.adobe.com/aharui/2009/08/what_we_know_about_unloading_m.html](http://blogs.adobe.com/aharui/2009/08/what_we_know_about_unloading_m.html)

[http://forums.adobe.com/message/3881172](http://forums.adobe.com/message/3881172)

## Contact

For further questions you can mail me at hans [at] dotdotcommadot [dot] com, or follow me on [google+](https://plus.google.com/105923980508016533126/about)



