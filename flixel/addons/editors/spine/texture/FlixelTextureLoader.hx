package flixel.addons.editors.spine.texture;

import flixel.graphics.FlxGraphic;
import openfl.Assets;
import openfl.display.BitmapData;
import FlixelTextureLoader.AtlasPage;
import FlixelTextureLoader.AtlasRegion;
import spinehaxe.atlas.TextureLoader;

class FlixelTextureLoader implements TextureLoader
{
	var prefix:String;

	public function new(prefix:String)
	{
		this.prefix = prefix;
	}

	public function loadPage(page:AtlasPage, path:String):Void
	{
		var bitmapData:BitmapData = Assets.getBitmapData(prefix + path);
		if (bitmapData == null)
			throw("BitmapData not found with name: " + this.prefix + path);
		page.rendererObject = FlxG.bitmap.add(bitmapData);
		page.width = bitmapData.width;
		page.height = bitmapData.height;
	}

	public function loadRegion(region:AtlasRegion):Void {}

	public function unloadPage(page:AtlasPage):Void
	{
		FlxG.bitmap.remove(cast page.rendererObject);
	}
}

class AtlasPage {
	public var name:String;
	public var format:Format;
	public var minFilter:TextureFilter;
	public var magFilter:TextureFilter;
	public var uWrap:TextureWrap;
	public var vWrap:TextureWrap;
	public var rendererObject:Dynamic;
	public var width:Int = 0;
	public var height:Int = 0;

	public function new() {}
}


class AtlasRegion {
	public var page:AtlasPage;
	public var name:String;
	public var x:Int = 0;
	public var y:Int = 0;
	public var width:Int = 0;
	public var height:Int = 0;
	public var u:Float = 0;
	public var v:Float = 0;
	public var u2:Float = 0;
	public var v2:Float = 0;
	public var offsetX:Float = 0;
	public var offsetY:Float = 0;
	public var originalWidth:Int = 0;
	public var originalHeight:Int = 0;
	public var index:Int = 0;
	public var rotate:Bool = false;
	public var splits:Array<Int>;
	public var pads:Array<Int>;
	public var rendererObject:Dynamic;

	public function new() {}
}
