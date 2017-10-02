From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] usb: phy: tegra: Fix phy suspend for UDC
Date: Mon, 2 Oct 2017 19:34:27 +0300
Message-ID: <81c7cabe-a3a4-6140-6b6c-f6f4cf12cc81@gmail.com>
References: <1506943373-11560-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506943373-11560-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02.10.2017 14:22, Jon Hunter wrote:
> Commit dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
> added UDC support for Tegra but with UDC support enabled, is was found
> that Tegra30, Tegra114 and Tegra124 would hang on entry to suspend.
> 
> The hang occurred during the suspend of the USB PHY when the Tegra PHY
> driver attempted to disable the PHY clock. The problem is that before
> the Tegra PHY driver is suspended, the chipidea driver already disabled
> the PHY clock and when the Tegra PHY driver suspended, it could not read
> DEVLC register and caused the device to hang.
> 
> The Tegra USB PHY driver is used by both the Tegra EHCI driver and now
> the chipidea UDC driver and so simply removing the disabling of the PHY
> clock from the USB PHY driver would not work for the Tegra EHCI driver.
> Fortunately, the status of the USB PHY clock can be read from the
> USB_SUSP_CTRL register and therefore, to workaround this issue, simply
> poll the register prior to disabling the clock in USB PHY driver to see
> if clock gating has already been initiated. Please note that it can take
> a few uS for the clock to disable and so simply reading this status
> register once on entry is not sufficient.
> 
> Similarly when turning on the PHY clock, it is possible that the clock
> is already enabled or in the process of being enabled, and so check for
> this when enabling the PHY.
> 
> Please note that no issues are seen with Tegra20 because it has a slightly
> different PHY to Tegra30/114/124.
> 
> Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Works on Tegra20 and fixes bogus CLK stabilization error message.

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Changes since V1:
> - Added fixes tag
> - Added test in PHY enable to see if clock is already on before enabling
> 
>  drivers/usb/phy/phy-tegra-usb.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index 5fe4a5704bde..ccc2bf5274b4 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -329,6 +329,14 @@ static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
>  	unsigned long val;
>  	void __iomem *base = phy->regs;
>  
> +	/*
> +	 * The USB driver may have already initiated the phy clock
> +	 * disable so wait to see if the clock turns off and if not
> +	 * then proceed with gating the clock.
> +	 */
> +	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID, 0) == 0)
> +		return;
> +
>  	if (phy->is_legacy_phy) {
>  		val = readl(base + USB_SUSP_CTRL);
>  		val |= USB_SUSP_SET;
> @@ -351,6 +359,15 @@ static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
>  	unsigned long val;
>  	void __iomem *base = phy->regs;
>  
> +	/*
> +	 * The USB driver may have already initiated the phy clock
> +	 * enable so wait to see if the clock turns on and if not
> +	 * then proceed with ungating the clock.
> +	 */
> +	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> +			       USB_PHY_CLK_VALID) == 0)
> +		return;
> +
>  	if (phy->is_legacy_phy) {
>  		val = readl(base + USB_SUSP_CTRL);
>  		val |= USB_SUSP_CLR;
> 
