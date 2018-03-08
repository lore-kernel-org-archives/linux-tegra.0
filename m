From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 08/11] clk: tegra: build clk-dfll.c for Tegra124 and
 Tegra210
Date: Thu, 8 Mar 2018 23:22:09 +0000
Message-ID: <6ea88ecd-20bb-31f6-74ad-7f7e3aaecfe1@nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-9-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517934852-23255-9-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 06/02/18 16:34, Peter De Schrijver wrote:
> Tegra210 has a DFLL as well and can share the majority of the code with
> the Tegra124 implementation. So build the same code for both platforms.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/Kconfig  | 5 +++++
>  drivers/clk/tegra/Makefile | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
> index 7ddacae..57902ab 100644
> --- a/drivers/clk/tegra/Kconfig
> +++ b/drivers/clk/tegra/Kconfig
> @@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
>  config CLK_TEGRA_BPMP
>  	def_bool y
>  	depends on TEGRA_BPMP
> +
> +config TEGRA_CLK_DFLL
> +	depends on (ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC)
> +	select PM_OPP
> +	def_bool y
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index b716923..fc7f4b4 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -19,7 +19,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
> -obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-dfll-fcpu.o
> +obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
>  obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
>  obj-y					+= cvb.o
>  obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
