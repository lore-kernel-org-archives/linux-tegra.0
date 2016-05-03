From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] phy: tegra-xusb: add pinctrl dependency
Date: Tue, 03 May 2016 22:10:02 +0200
Message-ID: <1959742.2n4CUJfeCu@wuerfel>
References: <1462289101-797073-1-git-send-email-arnd@arndb.de> <20160503160708.GA20266@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160503160708.GA20266-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 03 May 2016 18:07:08 Thierry Reding wrote:
> Wouldn't that be more of a case for a select dependency? I'm thinking
> something like the below (untested, yet).
> 

I usually prefer 'depends on' in a case like this, but it doesn't make
a huge difference. If we end up using 'select' here, we should
make the other symbol invisible though.

> --- >8 ---
> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index a3b1de953fb7..59e0dba9259a 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -1,6 +1,7 @@
>  config PHY_TEGRA_XUSB
>         tristate "NVIDIA Tegra XUSB pad controller driver"
>         depends on ARCH_TEGRA
> +       select PINCTRL_TEGRA_XUSB
>         help
>           Choose this option if you have an NVIDIA Tegra SoC.
>  
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index e4bc1151e04f..42a5c1dddfef 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -23,7 +23,7 @@ obj-$(CONFIG_PINCTRL_PISTACHIO)       += pinctrl-pistachio.o
>  obj-$(CONFIG_PINCTRL_ROCKCHIP) += pinctrl-rockchip.o
>  obj-$(CONFIG_PINCTRL_SINGLE)   += pinctrl-single.o
>  obj-$(CONFIG_PINCTRL_SIRF)     += sirf/
> -obj-$(CONFIG_PINCTRL_TEGRA)    += tegra/
> +obj-$(CONFIG_ARCH_TEGRA)       += tegra/
>  obj-$(CONFIG_PINCTRL_TZ1090)   += pinctrl-tz1090.o
>  obj-$(CONFIG_PINCTRL_TZ1090_PDC)       += pinctrl-tz1090-pdc.o
>  obj-$(CONFIG_PINCTRL_U300)     += pinctrl-u300.o

This change helps, but feels a little unclean. It also prevents us
from adding a '|| COMPILE_TEST' dependency.

How about making PHY_TEGRA_XUSB silent, and adding the 'select'
in the phy driver along with 'depends on PINCTRL_TEGRA'?

	Arnd
