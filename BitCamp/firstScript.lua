scriptId = 'com.alex.test.myfirstscript'
scriptTitle = 'MyoPaintScript'
scriptDetailsUrl=''
myo.setLockingPolicy("none")
myo.controlMouse(enabled)
function onForegroundWindowChange(app, title)  
	myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
	if(app=='mspaint.exe') then
	myo.debug("PAIIINT")
	return true
	end
    return false
end  

	function onPoseEdge(pose, edge)  
    myo.debug("onPoseEdge: " .. pose .. ": " .. edge)
    if (edge == "on") then
        if (pose == "waveOut") then
            onWaveOut()     
        elseif (pose == "waveIn") then
            onWaveIn()
        elseif (pose == "fist") then
            onFist()
        elseif (pose == "fingersSpread") then
            onFingersSpread()           
        end
    end
	end  

 function onWaveOut() 
	myo.debug("Undo")
		myo.vibrate("medium")
	myo.keyboard("z", "press","control")

	end

 function onWaveIn()  
    myo.debug("Redo")   
	myo.vibrate("medium")
    myo.keyboard("y","press","control")
	
end

 function onFist()  
    myo.debug("Click")  
    myo.mouse("left","down")
end
function onRest()
myo.mouse("left","")
end
 function onFingersSpread()  
    myo.debug("nothing")
    myo.centerMousePosition()
end  
function activeAppName()
	return mspaint.exe
end