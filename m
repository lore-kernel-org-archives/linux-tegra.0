From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 04/14] clk: tegra: Rename Tegra124 EMC clock source
 file
Date: Tue, 14 Apr 2020 19:48:12 +0300
Message-ID: <a7209708-6e67-5885-5935-2db3d92174e8@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-5-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This code is only used on Tegra124, so rename it accordingly to make it
> more consistent with other file names.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/Makefile                          | 2 +-
>  drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
> 
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 1f7c30f87ece..dec508ef2ada 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -14,7 +14,6 @@ obj-y					+= clk-tegra-audio.o
>  obj-y					+= clk-tegra-periph.o
>  obj-y					+= clk-tegra-fixed.o
>  obj-y					+= clk-tegra-super-gen4.o
> -obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= clk-tegra20-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
> @@ -22,6 +21,7 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
>  obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
> +obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-tegra124-emc.o

What about to rename CONFIG_TEGRA_CLK_EMC to CONFIG_TEGRA124_CLK_EMC as
well?

Also.. maybe the CONFIG_TEGRA_CLK_EMC isn't really needed at all and the
TEGRA124_EMC of memory/tegra could be re-used here?
