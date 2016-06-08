From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: Fix build dependency
Date: Wed, 8 Jun 2016 13:50:47 +0200
Message-ID: <CACRpkdajyr1YqvyWv2YEjk-StvFMZM_6k1a4t0yBuSznptVtRQ@mail.gmail.com>
References: <1465022156.547.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465022156.547.2.camel-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Jun 4, 2016 at 8:35 AM, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org> wrote:

> I got below build error:
> ERROR: "tegra_xusb_padctl_legacy_probe" [drivers/phy/tegra/phy-tegra-xusb.ko] undefined!
> with below build configuration:
> CONFIG_ARCH_TEGRA=y
> CONFIG_PINCTRL_TEGRA_XUSB=y
> CONFIG_PHY_TEGRA_XUSB=y
>
> The problem is below line in drivers/pinctrl/Makefile
> obj-$(CONFIG_PINCTRL_TEGRA)     += tegra/
>
> So even CONFIG_PINCTRL_TEGRA_XUSB=y is set, kbuild still does not compile
> the code in drivers/pinctrl/tegra folder if !CONFIG_PINCTRL_TEGRA.
>
> phy-tegra-xusb.c does not use any symbol from pinctrl-tegra.c,
> so build pinctrl-tegra.c only when CONFIG_PINCTRL_TEGRA is set.
>
> Signed-off-by: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>

Patch applied for fixes.

Yours,
Linus Walleij
