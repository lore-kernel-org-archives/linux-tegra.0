From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 3/3] soc/tegra: regulators: Add regulators coupler for
 Tegra30
Date: Fri, 2 Aug 2019 17:05:12 +0300
Message-ID: <20190802140512.GD3883@pdeschrijver-desktop.Nvidia.com>
References: <20190725151832.9802-1-digetx@gmail.com>
 <20190725151832.9802-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725151832.9802-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 25, 2019 at 06:18:32PM +0300, Dmitry Osipenko wrote:
> Add regulators coupler for Tegra30 SoCs that performs voltage balancing
> of a coupled regulators and thus provides voltage scaling functionality.
> 
> There are 2 coupled regulators on all Tegra30 SoCs: CORE and CPU. The
> coupled regulator voltages shall be in a range of 300mV from each other
> and CORE voltage shall be higher than the CPU by N mV, where N depends
> on the CPU voltage.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/Kconfig              |   4 +
>  drivers/soc/tegra/Makefile             |   1 +
>  drivers/soc/tegra/regulators-tegra30.c | 316 +++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/soc/tegra/regulators-tegra30.c
> 
...

> +
> +static int tegra30_core_cpu_limit(int cpu_uV)
> +{
> +	if (cpu_uV < 800000)
> +		return 950000;
> +
> +	if (cpu_uV < 900000)
> +		return 1000000;
> +
> +	if (cpu_uV < 1000000)
> +		return 1100000;
> +
> +	if (cpu_uV < 1100000)
> +		return 1200000;
> +
> +	if (cpu_uV < 1250000) {
> +		switch (tegra_sku_info.cpu_speedo_id) {
> +		case 0 ... 1:
Aren't we supposed to add /* fall through */ here now?
> +		case 4:
> +		case 7 ... 8:
> +			return 1200000;
> +
> +		default:
> +			return 1300000;
> +		}
> +	}
> +

Other than that, this looks ok to me.

Peter.
