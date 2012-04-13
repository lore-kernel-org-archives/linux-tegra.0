From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Fri, 13 Apr 2012 17:00:55 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204131640120.1166-100000@iolanthe.rowland.org>
References: <4F88879D.9020406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F88879D.9020406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 13 Apr 2012, Stephen Warren wrote:

> On 04/13/2012 01:46 PM, Alan Stern wrote:
> > On Fri, 13 Apr 2012, Stephen Warren wrote:
> >> I've tested the patch, and can unplug a USB device, wait 10 seconds,
> >> then plug it back in, and everything works as expected.
> >>
> >> However, I don't notice /sys/devices/.../power/runtime_status ever
> >> saying anything other than active, and I can't cat autosuspend_delay_ms,
> >> so I assume I'm still not triggering the path you want me to test. I do
> >> have PM_RUNTIME turned on. Any ideas? Do I need some patch to the USB
> >> core to enable this? I tested on next-20120413 plus a few local patches.
> > 
> > autosuspend_delay_ms isn't relevant here; the controller should be 
> > suspended with no delay as soon as the root hub suspends.  No other 
> > patches should be needed; it sounds like you're doing everything right.
> > 
> > If you enable CONFIG_PM_ADVANCED_DEBUG along with CONFIG_PM_RUNTIME, 
> > what do all the other power/runtime_* files show?
> 
> The EHCI controller's active_kids count stays at 1 all the time. I
> assume that's the root USB hub device. Looking in its power/ directory,
> I see that even when nothing is plugged in, runtime_status==enabled,
> even with no active_kids or runtime_usage:

That does indeed sound like a bug.

> [  242.611209] usb 3-1: USB disconnect, device number 4
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat async
> enabled
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat autosuspend_delay_ms
> 0

Odd...  This should contain 2000.  Maybe some userspace program has 
changed it?  Either value would be okay, however.

You could try writing 2000 to this file, then plugging in a device and 
unplugging it.  The root hub should then suspend 2 seconds after you 
unplug the device.

> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat control
> auto
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat runtime_active_kids
> 0
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat runtime_active_time
> 262840
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat runtime_enabled
> enabled
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat runtime_status
> active
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat
> runtime_suspended_time
> 0
> root@ilyich:/sys/devices/tegra-ehci.2/usb3/power# cat runtime_usage
> 0
> 
> Are the wakeup_* files in this directory relevant? wakeup says
> "disabled", and all the others are empty.

No, the wakeup files aren't relevant -- they refer to system sleep, not
runtime suspend.  Is CONFIG_PM_SLEEP disabled?  It should be, since you
don't support system suspend.

I don't know what's going wrong.  Maybe if you enable CONFIG_USB_DEBUG 
while running your test, something will show up.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
