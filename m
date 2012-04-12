From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Thu, 12 Apr 2012 14:45:57 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204121437300.1496-100000@iolanthe.rowland.org>
References: <4F871E58.8020108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F871E58.8020108-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 12 Apr 2012, Stephen Warren wrote:

> On 04/12/2012 12:07 PM, Alan Stern wrote:
> > Benoit or anyone else:
> > 
> > Right now the ehci-tegra driver powers down the EHCI controller during 
> > bus suspend, if the appropriate parameter is set.  This is not the 
> > right thing to do, and it will break under some newly added changes to 
> > the USB core.
> > 
> > Instead, the driver should leave the controller powered up during bus 
> > suspend, and power it down during controller suspend.  Below is a patch 
> > that attempts to do this.
> > 
> > I have no way to test this patch; I haven't even compiled it.  Please 
> > see if it works okay, or if it needs to be fixed at all.
> 
> I can test this. How would I trigger the bus conditions this patch
> affects? Note that we don't have system suspend on Tegra yet.

If you do:

	echo auto >/sys/devices/.../power/control

(where the ... gets filled in with the path to the EHCI controller),
then the controller should automatically get powered down whenever the
bus does.  The bus will get powered down whenever no USB devices are
plugged in (or the only attached USB devices are things like hubs that
will themselves get suspended) after a 2-second delay.

This is intended to be equivalent to enabling the
power_down_on_bus_suspend flag in the tegra_ehci_platform_data 
structure.  That
is, tegra_ehci_probe checks that flag and sets the PM control to auto
if the flag is enabled.

Alan Stern
