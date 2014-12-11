
' Script CopyPoints2.vbs
'
' Script for getting points positions from one object to another
'
' Author Sergey Solohin (Neill3d)
'  e-mail to: s@neill3d.com


PickObject "Pick sculpt object", "Pick sculpt object", srcObj, button
if button <> 0 then
	logMessage srcObj
	srcPositions = srcObj.ActivePrimitive.Geometry.Points.PositionArray
	
	set rtn = PickElement("vertex", "Select dst vertices", "Select vertices", vertices, button)
	if button <> 0 then
			set element = rtn.Value("PickedElement")
			logMessage element
			
			set selected = element.SubComponent.ComponentCollection
			for each sel in selected 
				'Application.LogMessage "pnt[" & sel.Index & "] is selected."
				strPos = dstObj & ".pnt[" & sel.Index & "]"
				Translate strPos, srcPositions(0, sel.Index), srcPositions(1,sel.Index), srcPositions(2,sel.Index), siAbsolute
			next
	end if
end if