From: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 10/10] ARM: tegra: Enable USB on Venice2
Date: Fri, 20 Dec 2013 10:59:44 +0800
Message-ID: <1387508384.26603.42.camel@jilin-desktop>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
	 <1387469182-14398-11-git-send-email-treding@nvidia.com>
	 <52B36720.8080205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B36720.8080205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

About USB1 issue, for chips after Tegra30 (including Tegra30), BIASPD is
controlled by USB1 controller.
In ehci-tegra.c probe phase, we assert reset and deassert reset on
controller clock.
If initializing sequence follows USB1 and then USB2, we are safe.
If initializing sequence follows USB2 and then USB1, then in
phy-tegra-usb.c a counter utmip_pad_count which has been increased for
USB2 will prevent UTMIP_BIASPD from being cleared while initializing for
USB1 controller (UTMIP_BIASPD will be set again after asserting and
deasserting reset on USB1 controller clock in ehci-tegra.c probe for
USB1 controller).

There are several ways to fix.
The local workaround I use is as following in phy-tegra-usb.c.

static void utmip_pad_power_on(struct tegra_usb_phy *phy)
{
	unsigned long val, flags;
	void __iomem *base = phy->pad_regs;
	struct tegra_utmip_config *config = phy->config;

	clk_prepare_enable(phy->pad_clk);

	spin_lock_irqsave(&utmip_pad_lock, flags);

	val = readl(base + UTMIP_BIAS_CFG0);
	if ((utmip_pad_count++ == 0) || (val & UTMIP_BIASPD)) {
		val &= ~(UTMIP_OTGPD | UTMIP_BIASPD)

On Fri, 2013-12-20 at 05:37 +0800, Stephen Warren wrote:
> On 12/19/2013 09:06 AM, Thierry Reding wrote:
> > USB1 and USB3 are routed to two external connectors, while USB2 is used
> > for the integrated webcam.
> > 
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Note: connecting a USB mouse to USB3 works properly and lsusb also detects
> > the integrated webcam, though I haven't tested whether the camera actually
> > works.
> > 
> > USB1 doesn't seem to work, but I suspect that might just be because it's
> > used for recovery mode and we can't switch it around at runtime yet.
> 
> The two regulators you added don't actually hook up to any GPIOs for
> control of VBUS, so perhaps this isn't surprising. The regulators added
> for VBUS control by Laxman's patch (which I already applied) *do* have
> some gpio properties. However, testing indicates:
> 
> * With Laxman's patch applied, and your patch 1/10 not applied since
> it's a duplicate, this patch doesn't work, i.e. I see no USB devices.
> 
> * With Laxman's patch reverted and your patch 1/10 replacing it, I do
> see USB devices, and they work. However, then we're not actually
> controlling VBUS, so USB1 doesn't work.
> 
> Can you please rebase this whole series on the latest Tegra for-3.14/dt
> and sort out the issues? Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--nvpublic 
