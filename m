From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] USB: PHY: tegra: Call tegra_usb_phy_close only on
 device removal
Date: Tue, 01 Jul 2014 16:21:18 -0600
Message-ID: <53B3345E.9020704@wwwdotorg.org>
References: <1404248923-21086-1-git-send-email-ttynkkynen@nvidia.com> <1404248923-21086-4-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404248923-21086-4-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/01/2014 03:08 PM, Tuomas Tynkkynen wrote:
> tegra_usb_phy_close() is supposed to undo the effects of
> tegra_usb_phy_init(). It is also currently added as the USB PHY shutdown
> callback, which is wrong, since tegra_usb_phy_init() is only called
> during probing wheras the shutdown callback can get called multiple
> times. This then leads to warnings about unbalanced regulator_disable if
> the EHCI driver is unbound and bound again at runtime.

The series,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c

> -static void tegra_usb_phy_close(struct usb_phy *x)
> +static void tegra_usb_phy_close(struct tegra_usb_phy *phy)

If this function undoes what _init does, it seems it should be called
_fini not _close. But that's bike-shedding perhaps.
