From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Wed, 18 Apr 2012 16:47:32 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204181640550.1149-100000@iolanthe.rowland.org>
References: <4F8F16A6.9040801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8F16A6.9040801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 18 Apr 2012, Stephen Warren wrote:

> I looked at our downstream ehci-tegra.c, and there's a lot more code
> there for suspend/resume, wakeup, and a bunch of other stuff. Given
> that, I'm not too surprised that the upstream driver isn't resuming from
> suspend as expected.
> 
> I think we can still apply your patch if you want,

It's important.  Recent changes in usbcore will cause
ehci_hub_status_data() to be called after the root hub is suspended.  
(See commit 879d38e6bc36d73b0ac40ec9b0d839fda9fa8b1a in Greg's USB
tree.)  If the controller is already powered down, you'll run into
trouble.

Besides, ehci-tegra might as well use the runtime PM framework for 
managing the controller's power state.  That's what it's for.

>  but we additionally
> need to make CONFIG_USB_EHCI_TEGRA depend on !CONFIG_USB_SUSPEND, which
> will ensure nobody gets surprised by this fails-to-resume issue. Does
> that seem reasonable? I don't think this will have any user-impact,
> since (a) the controllers weren't suspending before this patch, and (b)
> neither CONFIG_USB_SUSPEND nor CONFIG_PM_RUNTIME were enabled in
> tegra_defconfig (although in 3.5 we'll enable CONFIG_PM_RUNTIME).

Are you sure the controllers aren't getting suspending under the 
current driver?  It seems like they ought to be -- otherwise there 
would be no point in defining power_down_on_bus_suspend.

> Those responsible for ehci-tegra.c in our downstream kernels are
> supposed to be working on a plan to upstream the missing parts. When
> that comes to fruition, we should be able to remove that Kconfig
> restriction. I'm afraid I don't have an ETA for when that will be though.

Is this patch compatible with the downstream driver?  It would be a 
shame to mess up a bunch of other work.

Alan Stern
