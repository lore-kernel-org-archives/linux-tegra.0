From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usb: host: ehci-tegra: Avoid getting the same reset
 twice
Date: Tue, 3 May 2016 15:16:56 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1605031512430.1163-100000@netrider.rowland.org>
References: <1462298755-20857-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462298755-20857-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, 3 May 2016, Thierry Reding wrote:

> From: Thierry Reding <treding@nvidia.com>
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

> The reason is that the EHCI implements three ports, each with a separate
> reset line. However the first port's reset also serves as a means to
> reset the UTMI pad for all ports. There is special code in the driver to
> assert and deassert this shared reset at probe time. It needs to do this
> regardless of which port is probed first. Unfortunately this means that
> if the first port is probed first, it will request its own reset line
> and subsequently request the same reset line again (temporarily) to
> perform the reset. This used to work fine before the above-mentioned
> commit, but now triggers the new WARN.
> 
> Work around this by making sure we reuse the port's reset if it happens
> to be the same as the UTMI pad reset.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Possibly related to the problems you are still seeing, I noticed 
something odd about the patch.

> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -81,15 +81,23 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  	struct tegra_ehci_hcd *tegra =
>  		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
> +	bool has_utmi_pad_registers = false;
>  
>  	phy_np = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
>  	if (!phy_np)
>  		return -ENOENT;
>  
> +	if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
> +		has_utmi_pad_registers = true;

I would have writte simply:

	has_utmi_pad_registers = of_property_read_bool(phy_np, 
			"nvidia,has-utmi-pad-registers");

Regardless, notice that has_utmi_pad_registers gets set to true if the 
OF property value is true.

...

> -	if (!of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers")) {
> +	if (has_utmi_pad_registers) {

But down here the sense of the test is reversed.  Now the conditional 
block gets executed if the property is true, whereas the original code 
executed it if the property was false.

>  		reset_control_assert(tegra->rst);
>  		udelay(1);
>  		reset_control_deassert(tegra->rst);

Alan Stern
