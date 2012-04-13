From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Fri, 13 Apr 2012 12:51:42 -0600
Message-ID: <4F8875BE.5010202@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1204121437300.1496-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1204121437300.1496-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/12/2012 12:45 PM, Alan Stern wrote:
> On Thu, 12 Apr 2012, Stephen Warren wrote:
> 
>> On 04/12/2012 12:07 PM, Alan Stern wrote:
>>> Benoit or anyone else:
>>>
>>> Right now the ehci-tegra driver powers down the EHCI controller during 
>>> bus suspend, if the appropriate parameter is set.  This is not the 
>>> right thing to do, and it will break under some newly added changes to 
>>> the USB core.
>>>
>>> Instead, the driver should leave the controller powered up during bus 
>>> suspend, and power it down during controller suspend.  Below is a patch 
>>> that attempts to do this.
>>>
>>> I have no way to test this patch; I haven't even compiled it.  Please 
>>> see if it works okay, or if it needs to be fixed at all.
>>
>> I can test this. How would I trigger the bus conditions this patch
>> affects? Note that we don't have system suspend on Tegra yet.
> 
> If you do:
> 
> 	echo auto >/sys/devices/.../power/control
> 
> (where the ... gets filled in with the path to the EHCI controller),
> then the controller should automatically get powered down whenever the
> bus does.  The bus will get powered down whenever no USB devices are
> plugged in (or the only attached USB devices are things like hubs that
> will themselves get suspended) after a 2-second delay.

One small issue with the patch: There are two copies of
tegra_ehci_resume(). I assume the second should be renamed
tegra_ehci_runtime_resume().

I've tested the patch, and can unplug a USB device, wait 10 seconds,
then plug it back in, and everything works as expected.

However, I don't notice /sys/devices/.../power/runtime_status ever
saying anything other than active, and I can't cat autosuspend_delay_ms,
so I assume I'm still not triggering the path you want me to test. I do
have PM_RUNTIME turned on. Any ideas? Do I need some patch to the USB
core to enable this? I tested on next-20120413 plus a few local patches.
