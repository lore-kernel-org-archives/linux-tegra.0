From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Reboot/shutdown failure due to "USB: EHCI: work around silicon
 bug in Intel's EHCI"
Date: Wed, 20 Mar 2013 14:53:08 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1303201444340.1208-100000@iolanthe.rowland.org>
References: <5149EFA7.8050307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5149EFA7.8050307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andreas Bombe <aeb-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 20 Mar 2013, Stephen Warren wrote:

> > Anyway, there _is_ a mistake in the "work around silicon bug" patch; I
> > forgot to update the timeout handler.  Does the patch below help?  You 
> > should build it without CONFIG_USB_DEBUG; I changed the ehci_vdbg to 
> > ehci_info so that it would show up in the log regardless and we can see 
> > if it gets triggered.
> 
> Yes, with that applied, I see:
> 
> > root@localhost:~# dmesg|grep IAA
> > [    1.310994] tegra-ehci tegra-ehci.0: IAA watchdog: status a0a0 cmd 10025
> > [    1.322006] tegra-ehci tegra-ehci.0: IAA watchdog: status 80a0 cmd 10025

Sure enough, the 0x20 bit in the status register and lack of the 0x40 
bit in the command register indicate that the IAA cycle ended, but the 
watchdog timer expired before an interrupt was received.  Or maybe the 
IRQ was lost entirely.

> and reboot and shutdown both work fine.

Great!  Okay, I will submit the patch (without the ehci_info change) 
for -current and -stable.

Alan Stern
