From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Tue, 17 Apr 2012 17:28:12 -0600
Message-ID: <4F8DFC8C.5010001@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1204171050380.1364-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1204171050380.1364-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/17/2012 08:56 AM, Alan Stern wrote:
> On Mon, 16 Apr 2012, Stephen Warren wrote:
> 
>>>> The EHCI controller's active_kids count stays at 1 all the time. I
>>>> assume that's the root USB hub device. Looking in its power/ directory,
>>>> I see that even when nothing is plugged in, runtime_status==enabled,
>>>> even with no active_kids or runtime_usage:
>>>
>>> That does indeed sound like a bug.

Aha, there's a CONFIG_USB_SUSPEND which I didn't have enabled. Now I see
the controller suspending.

However, the controller suspends immediately the system boots even if
there's a device already connected, and never resumes if there wasn't
connected at boot, but one is plugged in later.

In this state, I must set tegra-ehci.2/usb3/power/control=on to get
anything to work. Forcing just the controller on
(tegra-ehci.2/power/control=on) doesn't fix this.

After than, I can set tegra-ehci.2/usb3/power/control=auto, and see the
root hub (tegra-ehci.2/usb3/power) suspending/resuming as devices are
unplugged/plugged.

I just can't have tegra-ehci.2/power/control=auto while nothing is
plugged in, or the cycle starts again.

I assume this a bug in the Tegra EHCI driver's suspend implementation?
