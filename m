From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 2/2] usb: host: ehci-tegra: Avoid getting the same
 reset twice
Date: Wed, 4 May 2016 11:23:20 -0600
Message-ID: <572A3008.4020602@wwwdotorg.org>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <1462372800-30900-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462372800-30900-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/04/2016 08:40 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Starting with commit 0b52297f2288 ("reset: Add support for shared reset
> controls") there is a reference count for reset control assertions. The
> goal is to allow resets to be shared by multiple devices and an assert
> will take effect only when all instances have asserted the reset.
>
> In order to preserve backwards-compatibility, all reset controls become
> exclusive by default. This is to ensure that reset_control_assert() can
> immediately assert in hardware.
>
> However, this new behaviour triggers the following warning in the EHCI
> driver for Tegra:
...
> The reason is that Tegra SoCs have three EHCI controllers, each with a
> separate reset line. However the first controller contains UTMI pads
> configuration registers that are shared with its siblings and that are
> reset as part of the first controller's reset. There is special code in
> the driver to assert and deassert this shared reset at probe time, and
> it does so irrespective of which controller is probed first to ensure
> that these shared registers are reset before any of the controllers are
> initialized. Unfortunately this means that if the first controller gets
> probed first, it will request its own reset line and will subsequently
> request the same reset line again (temporarily) to perform the reset.
> This used to work fine before the above-mentioned commit, but now
> triggers the new WARN.
>
> Work around this by making sure we reuse the controller's reset if the
> controller happens to be the first controller.

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c

> @@ -81,15 +81,23 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)

> +	bool has_utmi_pad_registers = false;
>
>   	phy_np = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
>   	if (!phy_np)
>   		return -ENOENT;
>
> +	if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
> +		has_utmi_pad_registers = true;

Isn't that just:

has_utmi_pad_registers = of_property_read_bool(phy_np,
     "nvidia,has-utmi-pad-registers");

... and then you can remove " = false" from the declaration too?

>   	if (!usb1_reset_attempted) {
>   		struct reset_control *usb1_reset;
>
> -		usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
> +		if (!has_utmi_pad_registers)
> +			usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
> +		else
> +			usb1_reset = tegra->rst;
...
>   		usb1_reset_attempted = true;
>   	}

This is a pre-existing issue, but what happens if the probes for two USB 
controllers run in parallel; there seems to be missing locking related 
to testing/setting usb1_reset_attempted, which could cause multiple 
parallel attempts to get the "utmi-pads" reset object, which would 
presumably cause essentially the same issue this patch is solving in 
other cases?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
