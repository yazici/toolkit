#include "keepalive.h"
#import <IOKit/pwr_mgt/IOPMLib.h>

// kIOPMAssertionTypeNoDisplaySleep prevents display sleep,
// kIOPMAssertionTypeNoIdleSleep prevents idle sleep

//reasonForActivity is a descriptive string used by the system whenever it needs 
//  to tell the user why the system is not sleeping. For example, 
//  "Mail Compacting Mailboxes" would be a useful string.

IOPMAssertionID assertionID;

void KeepAlive::KeepAliveMM(){

	// NOTE: IOPMAssertionCreateWithName limits the string to 128 characters. 
	CFStringRef reasonForActivity = CFSTR("Pixeld Running.");
	
	IOReturn success = IOPMAssertionCreateWithName(kIOPMAssertionTypeNoDisplaySleep, 
	                                    kIOPMAssertionLevelOn, reasonForActivity, &assertionID); 
	if (success == kIOReturnSuccess){

	} else {

	}
}

void KeepAlive::KeepAliveDestructorMM(){
	IOReturn success = IOPMAssertionRelease(assertionID);
}