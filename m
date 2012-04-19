From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Thu, 19 Apr 2012 15:01:05 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204191457160.1154-100000@iolanthe.rowland.org>
References: <4F90581A.70109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F90581A.70109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 19 Apr 2012, Stephen Warren wrote:

> > If you make that change, does the driver continue to work as well as it 
> > did before?
> 
> Yes, I believe so.
> 
> Note: I found that the immediate resume is because hcd_bus_suspend()
> aborts part-way through due to "suspend raced with wakeup event", which
> is due to ehci_hub_status_data() finding that port_status has all of
> PORT_CSC | PORT_PEC | PORT_OCC set. Is it worth tracking that down
> further? I have no idea if it's an ehci-tegra.c issue or quirk in our
> EHCI HW.

It's probably because of the recent change to hcd_bus_suspend().  
Before that change, it did not call ehci_hub_status_data() after doing
the suspend.  But now you see the problem: ehci_hub_status_data()  
returns bogus information because the controller has been powered down.  
That's the reason why I wanted to update ehci-tegra.c.

If you revert commit 879d38e6bc36d73b0ac40ec9b0d839fda9fa8b1a, how well
does the current driver behave?

Alan Stern
