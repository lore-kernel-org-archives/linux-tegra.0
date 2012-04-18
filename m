From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Wed, 18 Apr 2012 13:31:50 -0600
Message-ID: <4F8F16A6.9040801@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1204181102250.1548-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1204181102250.1548-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/18/2012 09:22 AM, Alan Stern wrote:
> On Tue, 17 Apr 2012, Stephen Warren wrote:
...
> In other words, if both the root hub and the controller are powered 
> down, then neither one wakes up when a device is plugged in?
> 
>> I assume this a bug in the Tegra EHCI driver's suspend implementation?
> 
> Actually it sounds like a bug in the controller's wakeup mechanism.  
> Maybe a hardware bug, maybe a software bug.
> 
> While looking through the code, I didn't notice anything about enabling
> wakeups.  But I wasn't looking very carefully, because I don't know how
> the Tegra platform works.  A quick search through the patch now seems
> to show that wakeups never get enabled at all!

I looked at our downstream ehci-tegra.c, and there's a lot more code
there for suspend/resume, wakeup, and a bunch of other stuff. Given
that, I'm not too surprised that the upstream driver isn't resuming from
suspend as expected.

I think we can still apply your patch if you want, but we additionally
need to make CONFIG_USB_EHCI_TEGRA depend on !CONFIG_USB_SUSPEND, which
will ensure nobody gets surprised by this fails-to-resume issue. Does
that seem reasonable? I don't think this will have any user-impact,
since (a) the controllers weren't suspending before this patch, and (b)
neither CONFIG_USB_SUSPEND nor CONFIG_PM_RUNTIME were enabled in
tegra_defconfig (although in 3.5 we'll enable CONFIG_PM_RUNTIME).

Those responsible for ehci-tegra.c in our downstream kernels are
supposed to be working on a plan to upstream the missing parts. When
that comes to fruition, we should be able to remove that Kconfig
restriction. I'm afraid I don't have an ETA for when that will be though.
