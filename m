From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Thu, 19 Apr 2012 15:45:28 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204191535350.1154-100000@iolanthe.rowland.org>
References: <4F90660E.1050508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F90660E.1050508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 19 Apr 2012, Stephen Warren wrote:

> >> Note: I found that the immediate resume is because hcd_bus_suspend()
> >> aborts part-way through due to "suspend raced with wakeup event", which
> >> is due to ehci_hub_status_data() finding that port_status has all of
> >> PORT_CSC | PORT_PEC | PORT_OCC set. Is it worth tracking that down
> >> further? I have no idea if it's an ehci-tegra.c issue or quirk in our
> >> EHCI HW.
> > 
> > It's probably because of the recent change to hcd_bus_suspend().  
> > Before that change, it did not call ehci_hub_status_data() after doing
> > the suspend.  But now you see the problem: ehci_hub_status_data()  
> > returns bogus information because the controller has been powered down.  
> > That's the reason why I wanted to update ehci-tegra.c.
> 
> Aha, I'm beginning to understand!
> 
> > If you revert commit 879d38e6bc36d73b0ac40ec9b0d839fda9fa8b1a, how well
> > does the current driver behave?
> 
> It's basically the same as the patch you posted at the start of this
> thread. In other words:
> 
> * When nothing is plugged in, the port(hub) suspends and stays
> suspended; no oscillating.
> 
> * When I plug something in, the system doesn't see it.
> 
> * If I then manually resume the hub ("echo on > usb3/power/control"),
> new devices are seen, and devices can be unplugged/replugged and seen.
> 
> * While a device is plugged in, I can "echo auto > usb3/power/control"
> and it stays operational.
> 
> So, I guess the only question is: the patch you posted was to solve the
> problem of seeing bogus status during suspend, which causes the
> immediate resume; Why doesn't that work?

According to what you said earlier, it _does_ work.  That is, you said
with my patch to ehci-tegra the controller does not resume immediately;  
it goes to low power and stays that way even when a new device is
plugged in.  Which means that wakeup is a problem, but then it's also a
problem with the existing driver.

Thus the combination of 879d38e6b plus my ehci-tegra patch leaves
the behavior basically unchanged.  Which is what I wanted to verify.

Unless you have an objection, I'll submit the patch (including the
change that calls pm_runtime_forbid() unconditionally).

Alan Stern
