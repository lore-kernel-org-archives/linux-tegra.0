From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Wed, 18 Apr 2012 16:40:39 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204181626450.1149-100000@iolanthe.rowland.org>
References: <4F8F06F6.2040503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8F06F6.2040503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 18 Apr 2012, Stephen Warren wrote:

> > How well does the existing driver work if you enable the 
> > power_down_on_bus_suspend flag in the platform data?  
> 
> power_down_on_bus_suspend is always enabled for the Tegra EHCI controllers.
> 
> The existing driver works fine (with or without USB_SUSPEND=y and
> PM_RUNTIME=y), although doesn't ever runtime-suspended, so I guess this
> is just hiding the problem:
> 
> /sys/devices/tegra-ehci.2# cat {,usb3/}power/{control,runtime_status}
> auto
> unsupported
> auto
> active
> 
> (I see the same with or without anything plugged in)

That's not meaningful in this situation.  With the existing driver, the
controller will get powered down whenever the root hub suspends -- that
is, when tegra_ehci_bus_suspend() calls tegra_usb_suspend() which calls
tegra_ehci_power_down().  This should happen whenever no devices are
plugged in (assuming CONFIG_USB_SUSPEND is enabled).  This mechanism
for powering down the controller doesn't use runtime PM, but it will
operate anyway.

The questions are: If you unplug everything under the existing driver,
what does usb3/power/runtime_status show?  When you plug in a new
device, is it detected (presumably it is)?  And finally, how does the 
controller detect the new device while it is powered down?

> By the way, how broken is the current tegra_ehci_hub_control()? I see
> that it mostly duplicates ehci_hub_control() for a few cases, but has
> diverged a little since, e.g. the set_bit()/clear_bit() calls are using
> "wIndex - 1" instead of "wIndex" etc.

That's just a minor optimization.  ehci_hub_control() decrements wIndex
near the start of certain cases, to avoid all those "- 1"  things later
on.

I haven't tried to do a detailed check of all the code in
tegra_ehci_hub_control().

> Also, I wonder if the logic in the
> ClearPortFeature/USB_PORT_FEAT_ENABLE case might be worth moving into
> ehci-hub.c, if it's generally applicable? I did try removing that
> function and making the driver use ehci_hub_control() instead, but that
> didn't solve the resume issue.

Yes, that does look like a bug in ehci_hub_control().  Feel free to 
submit a patch moving the Tegra code over.

Alan Stern
