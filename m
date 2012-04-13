From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Fri, 13 Apr 2012 15:46:04 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204131541190.1146-100000@iolanthe.rowland.org>
References: <4F8875BE.5010202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8875BE.5010202-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 13 Apr 2012, Stephen Warren wrote:

> > If you do:
> > 
> > 	echo auto >/sys/devices/.../power/control
> > 
> > (where the ... gets filled in with the path to the EHCI controller),
> > then the controller should automatically get powered down whenever the
> > bus does.  The bus will get powered down whenever no USB devices are
> > plugged in (or the only attached USB devices are things like hubs that
> > will themselves get suspended) after a 2-second delay.
> 
> One small issue with the patch: There are two copies of
> tegra_ehci_resume(). I assume the second should be renamed
> tegra_ehci_runtime_resume().

Whoops!  You're right, of course.  I'll update my patch.

> I've tested the patch, and can unplug a USB device, wait 10 seconds,
> then plug it back in, and everything works as expected.
> 
> However, I don't notice /sys/devices/.../power/runtime_status ever
> saying anything other than active, and I can't cat autosuspend_delay_ms,
> so I assume I'm still not triggering the path you want me to test. I do
> have PM_RUNTIME turned on. Any ideas? Do I need some patch to the USB
> core to enable this? I tested on next-20120413 plus a few local patches.

autosuspend_delay_ms isn't relevant here; the controller should be 
suspended with no delay as soon as the root hub suspends.  No other 
patches should be needed; it sounds like you're doing everything right.

If you enable CONFIG_PM_ADVANCED_DEBUG along with CONFIG_PM_RUNTIME, 
what do all the other power/runtime_* files show?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
