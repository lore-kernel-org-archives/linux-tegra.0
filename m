From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra/harmony: enable USB host ports
Date: Wed, 08 Jun 2011 18:13:47 +0100
Message-ID: <4DEFADCB.90805@arm.com>
References: <1307528018-14454-1-git-send-email-marc.zyngier@arm.com> <74CDBE0F657A3D45AFBB94109FB122FF0498E1CDC5@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0498E1CDC5-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/06/11 17:48, Stephen Warren wrote:
> Marc Zyngier wrote at Wednesday, June 08, 2011 4:14 AM:
>> The Harmony board code doesn't have any support for USB, leaving
>> the board without any ethernet support. Add the necessary
>> declarations to have it up and running, at least for the J6 and J25
>> connectors, as well as the ethernet port.
>>
>> The OTG port is left unused, short of any documentation.
>>
>> Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>> ---
>> Not sure if this is the right time to send this, as this should
>> eventually be handled by the device tree. May be useful to some
>> people in the meantime.
> 
> I believe Colin isn't accepting board changes for this kernel merge
> window. I'm not sure what plans are after that. Perhaps device tree?

Oh, I wasn't thinking of merging anything like that for 3.0 or 3.1. USB
on Tegra has been unsupported in mainline until now, and it can
certainly wait for another merge window. Even better if that involves
the device tree.

> In the ChromeOS 2.6.38 kernel, the following platform data definitions
> are used for tegra_ehci3_device:
> 
> +static struct tegra_utmip_config utmi_phy_config = {
> +       .hssync_start_delay = 0,
> +       .idle_wait_delay = 17,
> +       .elastic_limit = 16,
> +       .term_range_adj = 6,
> +       .xcvr_setup = 9,
> +       .xcvr_lsfslew = 2,
> +       .xcvr_lsrslew = 2,
> +};

This looks like the defaults provided by usb_phy.c (except for
hssync_start_delay, which is set to 9). I assume this should be safe.

> +static struct tegra_ehci_platform_data tegra_ehci_pdata = {
> +       .phy_config = &utmi_phy_config,
> +       .operating_mode = TEGRA_USB_HOST,
> +       .power_down_on_bus_suspend = 1,
           ^^^^^^^^
This last bit could be useful indeed.

> +};
> 
> And also this clock is configured:
> 
> +       { "usb3",       "clk_m",        12000000,       true },

I think we have that one as well (tegra2_clocks.c), though at a
different rate (!).

> I'm not sure if that platform data is appropriate for tegra_ehci1_device;
> the ChromeOS kernel doesn't enable that port.

There's probably some kind of GPIO trickery involved to reset the port...

> You can find that at either:
> 
> http://git.chromium.org/chromiumos/third_party/kernel.git
> 
> or commit 0d7ae83b763bb3727e6b6189b49925cd3ab2e204
> http://avon.wwwdotorg.org/downloads/kernel.git asoc_for-2.6.40_plus_harmony

Thanks for the pointers.

Cheers,

	M.
-- 
Jazz is not dead. It just smells funny...
