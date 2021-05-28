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
//        
//        view.setColor(getApp().getProperty("ForegroundColor") as Number);
//        view.setText("julia"); //timeString
        dc.clear();

        // Call the parent onUpdate function to redraw the layout
        // create a 240x240 layer, at [0,0] offset from the top-left corner of the screen
//        var backgroundLayer = new WatchUi.Layer({:x=>0, :y=>0, width=>240, height=>240});

        // draw something on the layer
//        backgroundLayer.getDc()
        var img = WatchUi.loadResource(Rez.Drawables.ShootingJokic);
        dc.drawBitmap(70, 10, img);
        
        // Initialize the Time over the animation
    	//var textLayer = new WatchUi.Layer(options);
//        var view = View.findDrawableById("TimeLabel") as Text;
//        view.setText("julia"); //timeString
        // View.onUpdate(dc);
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
