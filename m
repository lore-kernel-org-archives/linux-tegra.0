From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Tue, 17 Apr 2012 10:56:44 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204171050380.1364-100000@iolanthe.rowland.org>
References: <4F8C82FD.2030600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8C82FD.2030600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 16 Apr 2012, Stephen Warren wrote:

> >> The EHCI controller's active_kids count stays at 1 all the time. I
> >> assume that's the root USB hub device. Looking in its power/ directory,
> >> I see that even when nothing is plugged in, runtime_status==enabled,
> >> even with no active_kids or runtime_usage:
> > 
> > That does indeed sound like a bug.
> > 
> >> [  242.611209] usb 3-1: USB disconnect, device number 4
> >> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat async
> >> enabled
> >> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat autosuspend_delay_ms
> >> 0
> > 
> > Odd...  This should contain 2000.  Maybe some userspace program has 
> > changed it?  Either value would be okay, however.
> > 
> > You could try writing 2000 to this file, then plugging in a device and 
> > unplugging it.  The root hub should then suspend 2 seconds after you 
> > unplug the device.
> 
> There's no difference if I write 2000 to this file.
> 
> I've tried turning on dynamic debug for the entire of USB. None of those
> fire, which I believe implies there aren't any attempted suspends of the
> Tegra EHCI controller that fail. I also added a few extra printks to the
> Tegra EHCI controller's suspend/resume functions which don't fire.
> 
> Is this anything to do with it:
> 
> ./ehci-hub.c:615:	/* FIXME autosuspend idle root hubs */

No, that's a very old, fossil comment.  It should have been removed 
years ago.

> I'm at a loss how to do anything more useful here.

We need to find out why the root hub isn't suspending.  Can you do some 
debugging in drivers/usb/core/driver.c?  The routines to check are 
autosuspend_check(), usb_runtime_idle(), and usb_runtime_suspend().

In particular, if autosuspend_check() doesn't return 0, what is the 
reason?  And if it does, what does the usb_suspend_both() call return?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
