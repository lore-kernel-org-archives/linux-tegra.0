From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Wed, 18 Apr 2012 11:22:26 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204181102250.1548-100000@iolanthe.rowland.org>
References: <4F8DFC8C.5010001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8DFC8C.5010001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Apr 2012, Stephen Warren wrote:

> Aha, there's a CONFIG_USB_SUSPEND which I didn't have enabled. Now I see
> the controller suspending.

Good job.  I should have thought of that...

> However, the controller suspends immediately the system boots even if
> there's a device already connected, and never resumes if there wasn't
> connected at boot, but one is plugged in later.

The general idea is that when usb_add_hcd() registers the root hub, the
hub driver prevents the root hub from autosuspending until it has a
chance to scan the ports with plugged-in devices.  And naturally, the
controller won't suspend while the root hub is running.  So maybe the
root hub doesn't see the connected devices?

You can find out by collecting a usbmon trace for bus 0, starting
before you load the ehci-hcd module.

> In this state, I must set tegra-ehci.2/usb3/power/control=on to get
> anything to work. Forcing just the controller on
> (tegra-ehci.2/power/control=on) doesn't fix this.

Yeah, powering up the controller doesn't necessarily cause the root hub
to be powered up too.  Of course, if power_down_on_bus_suspend isn't
enabled then the controller's power/control is supposed to be set to
"on" by default.

> After than, I can set tegra-ehci.2/usb3/power/control=auto, and see the
> root hub (tegra-ehci.2/usb3/power) suspending/resuming as devices are
> unplugged/plugged.
> 
> I just can't have tegra-ehci.2/power/control=auto while nothing is
> plugged in, or the cycle starts again.

In other words, if both the root hub and the controller are powered 
down, then neither one wakes up when a device is plugged in?

> I assume this a bug in the Tegra EHCI driver's suspend implementation?

Actually it sounds like a bug in the controller's wakeup mechanism.  
Maybe a hardware bug, maybe a software bug.

While looking through the code, I didn't notice anything about enabling
wakeups.  But I wasn't looking very carefully, because I don't know how
the Tegra platform works.  A quick search through the patch now seems
to show that wakeups never get enabled at all!

How well does the existing driver work if you enable the 
power_down_on_bus_suspend flag in the platform data?  

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
