From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Wed, 18 Apr 2012 12:24:54 -0600
Message-ID: <4F8F06F6.2040503@wwwdotorg.org>
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
>> After than, I can set tegra-ehci.2/usb3/power/control=auto, and see the
>> root hub (tegra-ehci.2/usb3/power) suspending/resuming as devices are
>> unplugged/plugged.
>>
>> I just can't have tegra-ehci.2/power/control=auto while nothing is
>> plugged in, or the cycle starts again.
> 
> In other words, if both the root hub and the controller are powered 
> down, then neither one wakes up when a device is plugged in?

Yes.

>> I assume this a bug in the Tegra EHCI driver's suspend implementation?
> 
> Actually it sounds like a bug in the controller's wakeup mechanism.  
> Maybe a hardware bug, maybe a software bug.
> 
> While looking through the code, I didn't notice anything about enabling
> wakeups.  But I wasn't looking very carefully, because I don't know how
> the Tegra platform works.  A quick search through the patch now seems
> to show that wakeups never get enabled at all!
> 
> How well does the existing driver work if you enable the 
> power_down_on_bus_suspend flag in the platform data?  

power_down_on_bus_suspend is always enabled for the Tegra EHCI controllers.

The existing driver works fine (with or without USB_SUSPEND=y and
PM_RUNTIME=y), although doesn't ever runtime-suspended, so I guess this
is just hiding the problem:

/sys/devices/tegra-ehci.2# cat {,usb3/}power/{control,runtime_status}
auto
unsupported
auto
active

(I see the same with or without anything plugged in)

By the way, how broken is the current tegra_ehci_hub_control()? I see
that it mostly duplicates ehci_hub_control() for a few cases, but has
diverged a little since, e.g. the set_bit()/clear_bit() calls are using
"wIndex - 1" instead of "wIndex" etc. Also, I wonder if the logic in the
ClearPortFeature/USB_PORT_FEAT_ENABLE case might be worth moving into
ehci-hub.c, if it's generally applicable? I did try removing that
function and making the driver use ehci_hub_control() instead, but that
didn't solve the resume issue.
