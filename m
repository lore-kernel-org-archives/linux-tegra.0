From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v10 01/15] clk: tegra20/30: Add custom EMC clock
 implementation
Date: Tue, 13 Aug 2019 01:12:58 +0200
Message-ID: <20190812231258.GA31836@qmqm.qmqm.pl>
References: <20190811210043.20122-1-digetx@gmail.com>
 <20190811210043.20122-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190811210043.20122-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh-dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 12, 2019 at 12:00:29AM +0300, Dmitry Osipenko wrote:
> A proper External Memory Controller clock rounding and parent selection
> functionality is required by the EMC drivers, it is not available using
> the generic clock implementation because only the Memory Controller driver
> is aware of what clock rates are actually available for a particular
> device. EMC drivers will have to register a Tegra-specific CLK-API
> callback which will perform rounding of a requested rate. EMC clock users
> won't be able to request EMC clock by getting -EPROBE_DEFER until EMC
> driver is probed and the callback is set up.
[...]
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 4812e45c2214..df966ca06788 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -17,7 +17,9 @@ obj-y					+= clk-tegra-fixed.o
>  obj-y					+= clk-tegra-super-gen4.o
>  obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
> +obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= clk-tegra20-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
> +obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
>  obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o

Doesn't it complain when both CONFIG_ARCH_TEGRA_2x_SOC and
CONFIG_ARCH_TEGRA_3x_SOC are enabled at the same time?

Best Regards,
Micha³ Miros³aw
