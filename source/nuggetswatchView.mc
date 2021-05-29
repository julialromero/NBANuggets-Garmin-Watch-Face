import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
using Toybox.WatchUi;


class nuggetswatchView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.NuggsWatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    	
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

		
		// Update the view
        dc.clear();
        
        // set text parameters
        var y = 90;
        var x = 120;
        var height = 40;
        var width = 80;

        // draw image
        var img = WatchUi.loadResource(Rez.Drawables.ShootingJokic);
        dc.drawBitmap(70, 10, img);
        
        
        //draw filled rectangle to represent text's color
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
		dc.fillRectangle(x, y, width, height);
		
		
		//draw filled rectangle to represent water level
//		dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
//		dc.fillRectangle(x, y + height/2, width, height/2);
//		
//		//create and draw the clipping mask
		dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
		dc.drawText(x + width/ 2 , y - 5, Graphics.FONT_NUMBER_MEDIUM, timeString, Graphics.TEXT_JUSTIFY_CENTER);



//        // draw the Time over the image
//        dc.setColor(Graphics.COLOR_DK_GREEN, Graphics.COLOR_TRANSPARENT);
//		dc.drawText(170, 100, Graphics.FONT_NUMBER_MEDIUM, timeString, Graphics.TEXT_JUSTIFY_CENTER);
        
//        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
