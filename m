From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] usb: host: ehci-tegra: Avoid getting the same
 reset twice
Date: Thu, 5 May 2016 19:12:41 +0200
Message-ID: <189d4e99-15e9-f6fc-5fce-2f7b523df866@redhat.com>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <1462372800-30900-2-git-send-email-thierry.reding@gmail.com>
 <572A3008.4020602@wwwdotorg.org> <20160504202544.GB21480@mithrandir.ba.sec>
 <fdf3583d-636e-5619-5df6-17b6ae331ac9@redhat.com>
 <572B6E1B.3060901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572B6E1B.3060901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On 05-05-16 18:00, Stephen Warren wrote:
> On 05/05/2016 02:05 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 04-05-16 22:25, Thierry Reding wrote:
>>> On Wed, May 04, 2016 at 11:23:20AM -0600, Stephen Warren wrote:
>>>> On 05/04/2016 08:40 AM, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> Starting with commit 0b52297f2288 ("reset: Add support for shared reset
>>>>> controls") there is a reference count for reset control assertions. The
>>>>> goal is to allow resets to be shared by multiple devices and an assert
>>>>> will take effect only when all instances have asserted the reset.
>>>>>
>>>>> In order to preserve backwards-compatibility, all reset controls become
>>>>> exclusive by default. This is to ensure that reset_control_assert() can
>>>>> immediately assert in hardware.
>>>>>
>>>>> However, this new behaviour triggers the following warning in the EHCI
>>>>> driver for Tegra:
>>>> ...
>>>>> The reason is that Tegra SoCs have three EHCI controllers, each with a
>>>>> separate reset line. However the first controller contains UTMI pads
>>>>> configuration registers that are shared with its siblings and that are
>>>>> reset as part of the first controller's reset. There is special code in
>>>>> the driver to assert and deassert this shared reset at probe time, and
>>>>> it does so irrespective of which controller is probed first to ensure
>>>>> that these shared registers are reset before any of the controllers are
>>>>> initialized. Unfortunately this means that if the first controller gets
>>>>> probed first, it will request its own reset line and will subsequently
>>>>> request the same reset line again (temporarily) to perform the reset.
>>>>> This used to work fine before the above-mentioned commit, but now
>>>>> triggers the new WARN.
>>>>>
>>>>> Work around this by making sure we reuse the controller's reset if the
>>>>> controller happens to be the first controller.
>>>>
>>>>> diff --git a/drivers/usb/host/ehci-tegra.c
>>>>> b/drivers/usb/host/ehci-tegra.c
>>>>
>>>>> @@ -81,15 +81,23 @@ static int tegra_reset_usb_controller(struct
>>>>> platform_device *pdev)
>>>>
>>>>> +    bool has_utmi_pad_registers = false;
>>>>>
>>>>>       phy_np = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
>>>>>       if (!phy_np)
>>>>>           return -ENOENT;
>>>>>
>>>>> +    if (of_property_read_bool(phy_np,
>>>>> "nvidia,has-utmi-pad-registers"))
>>>>> +        has_utmi_pad_registers = true;
>>>>
>>>> Isn't that just:
>>>>
>>>> has_utmi_pad_registers = of_property_read_bool(phy_np,
>>>>     "nvidia,has-utmi-pad-registers");
>>>>
>>>> ... and then you can remove " = false" from the declaration too?
>>>
>>> Yes. This is really only for aesthetics. The direct assignment doesn't
>>> fit within 80 columns, and wrapping it looks ugly whichever way you do
>>> it.
>>>
>>>>>       if (!usb1_reset_attempted) {
>>>>>           struct reset_control *usb1_reset;
>>>>>
>>>>> -        usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
>>>>> +        if (!has_utmi_pad_registers)
>>>>> +            usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
>>>>> +        else
>>>>> +            usb1_reset = tegra->rst;
>>>> ...
>>>>>           usb1_reset_attempted = true;
>>>>>       }
>>>>
>>>> This is a pre-existing issue, but what happens if the probes for two USB
>>>> controllers run in parallel; there seems to be missing locking
>>>> related to
>>>> testing/setting usb1_reset_attempted, which could cause multiple
>>>> parallel
>>>> attempts to get the "utmi-pads" reset object, which would presumably
>>>> cause
>>>> essentially the same issue this patch is solving in other cases?
>>>
>>> Hah! Interestingly my initial attempt at fixing this was to introduce a
>>> lock to serialize these, because I thought that was what was going on. I
>>> don't think this function can ever run concurrently for different
>>> devices because the driver core already serializes probes (unless a
>>> driver specifically requests asynchronous probing, which this one
>>> doesn't).
>>
>> Why not just use the new shared reset functionality ? It is easy to use,
>> that way you can drop some of the special handling in the driver and
>> you're code actually reflects the hardware (which IMHO has a shared reset).
>
> Judging purely by the descriptions of the shared reset functionality in this thread, I doubt that will work. A varying number of USB controllers will be enabled in DT on a board-by-board basis, so anything that attempts to wait for "all devices to assert reset" can't be implemented, since it won't be known ahead of time how many reset assertions to wait for. Equally, if device probes are serialized, the reset will not happen at the right time since it can't happen until the nth probe (when each device has asserted reset) but we want it to happen during the 1st probe.

Ah, so you actually want to reset the utmi-pad registers, not take them
out of reset state ?

Yeah then the shared reset support will not work.

Regards,

Hans

>
