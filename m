From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] usb: host: ehci-tegra: Avoid getting the same
 reset twice
Date: Thu, 5 May 2016 18:05:12 +0100
Message-ID: <572B7D48.6010807@nvidia.com>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <1462372800-30900-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462372800-30900-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 04/05/16 15:40, Thierry Reding wrote:
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
> 
> [    3.365019] ------------[ cut here ]------------
> [    3.369639] WARNING: CPU: 0 PID: 1 at drivers/reset/core.c:187 __of_reset_control_get+0x16c/0x23c
> [    3.382151] Modules linked in:
> [    3.385214] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc6-next-20160503 #140
> [    3.392769] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    3.399046] [<c010fa50>] (unwind_backtrace) from [<c010b120>] (show_stack+0x10/0x14)
> [    3.406787] [<c010b120>] (show_stack) from [<c0347dcc>] (dump_stack+0x90/0xa4)
> [    3.414007] [<c0347dcc>] (dump_stack) from [<c011f4fc>] (__warn+0xe8/0x100)
> [    3.420964] [<c011f4fc>] (__warn) from [<c011f5c4>] (warn_slowpath_null+0x20/0x28)
> [    3.428525] [<c011f5c4>] (warn_slowpath_null) from [<c03cc8cc>] (__of_reset_control_get+0x16c/0x23c)
> [    3.437648] [<c03cc8cc>] (__of_reset_control_get) from [<c0526858>] (tegra_ehci_probe+0x394/0x518)
> [    3.446600] [<c0526858>] (tegra_ehci_probe) from [<c04516d8>] (platform_drv_probe+0x4c/0xb0)
> [    3.455029] [<c04516d8>] (platform_drv_probe) from [<c044fe78>] (driver_probe_device+0x1ec/0x330)
> [    3.463892] [<c044fe78>] (driver_probe_device) from [<c0450074>] (__driver_attach+0xb8/0xbc)
> [    3.472320] [<c0450074>] (__driver_attach) from [<c044e1ec>] (bus_for_each_dev+0x68/0x9c)
> [    3.480489] [<c044e1ec>] (bus_for_each_dev) from [<c044f338>] (bus_add_driver+0x1a0/0x218)
> [    3.488743] [<c044f338>] (bus_add_driver) from [<c0450768>] (driver_register+0x78/0xf8)
> [    3.496738] [<c0450768>] (driver_register) from [<c010178c>] (do_one_initcall+0x40/0x170)
> [    3.504909] [<c010178c>] (do_one_initcall) from [<c0c00ddc>] (kernel_init_freeable+0x158/0x1f8)
> [    3.513600] [<c0c00ddc>] (kernel_init_freeable) from [<c0810784>] (kernel_init+0x8/0x114)
> [    3.521770] [<c0810784>] (kernel_init) from [<c0107778>] (ret_from_fork+0x14/0x3c)
> [    3.529361] ---[ end trace 4bda87dbe4ecef8a ]---
> 
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
> 
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v3:
> - reword commit message to more accurately describe the hardware design
> 
> Changes in v2:
> - restore has_utmi_pad_registers condition (Alan Stern)
> 
>  drivers/usb/host/ehci-tegra.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index c1c1024a054c..8396b622f238 100644
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
> +
>  	if (!usb1_reset_attempted) {
>  		struct reset_control *usb1_reset;
>  
> -		usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
> +		if (!has_utmi_pad_registers)
> +			usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
> +		else
> +			usb1_reset = tegra->rst;
> +
>  		if (IS_ERR(usb1_reset)) {
>  			dev_warn(&pdev->dev,
>  				 "can't get utmi-pads reset from the PHY\n");
> @@ -101,11 +109,13 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
>  			reset_control_deassert(usb1_reset);
>  		}
>  
> -		reset_control_put(usb1_reset);
> +		if (!has_utmi_pad_registers)
> +			reset_control_put(usb1_reset);
> +
>  		usb1_reset_attempted = true;
>  	}
>  
> -	if (!of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers")) {
> +	if (!has_utmi_pad_registers) {
>  		reset_control_assert(tegra->rst);
>  		udelay(1);
>  		reset_control_deassert(tegra->rst);
> 

I spent a bit of time looking at this to figure out what it is doing. Can we simply 
this a bit as follows (limited testing so far) ...

Cheers
Jon

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index c1c1024a054c..70501053e1ec 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -81,15 +81,25 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
        struct usb_hcd *hcd = platform_get_drvdata(pdev);
        struct tegra_ehci_hcd *tegra =
                (struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
+       bool has_utmi_pad_registers = false;
+       dev_info(&pdev->dev, "%s-%d\n", __func__, __LINE__);
 
        phy_np = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
        if (!phy_np)
                return -ENOENT;
 
-       if (!usb1_reset_attempted) {
-               struct reset_control *usb1_reset;
+       if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
+               has_utmi_pad_registers = true;
+
+       /* If we are usb1 and usb1 has been reset, then we are done */
+       if (usb1_reset_attempted && has_utmi_pad_registers)
+               goto out;
 
+       /* If we are not usb1 and usb1 has not been reset, then reset it now */
+       if (!usb1_reset_attempted && !has_utmi_pad_registers) {
+               struct reset_control *usb1_reset;
                usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
+
                if (IS_ERR(usb1_reset)) {
                        dev_warn(&pdev->dev,
                                 "can't get utmi-pads reset from the PHY\n");
@@ -99,18 +109,17 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
                        reset_control_assert(usb1_reset);
                        udelay(1);
                        reset_control_deassert(usb1_reset);
+                       reset_control_put(usb1_reset);
                }
