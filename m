From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 07/19] clk: tegra: dfll: support PWM regulator control
Date: Fri, 7 Dec 2018 14:26:45 +0000
Message-ID: <6cdab503-e463-ddbb-2ce9-035c81da7058@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-8-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-8-josephl@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> The DFLL hardware supports two modes (I2C and PWM) for voltage control
> when requesting a frequency. In this patch, we introduce PWM mode support.
> 
> To support that, we re-organize the LUT for unifying the table for both
> cases of I2C and PWM mode. And generate that based on regulator info.
> For the PWM-based regulator, we get this info from DT. And do the same as
> the case of I2C LUT, which can help to map the PMIC voltage ID and voltages
> that the regulator supported.
> 
> The other parts are the support code for initializing the DFLL hardware
> to support PWM mode. Also, the register debugfs file is slightly
> reworked to only show the i2c registers when I2C mode is in use.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 431 ++++++++++++++++++++++++++++++-----
>  1 file changed, 368 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 609e363dabf8..c294a2989f31 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1,7 +1,7 @@
>  /*
>   * clk-dfll.c - Tegra DFLL clock source common code
>   *
> - * Copyright (C) 2012-2014 NVIDIA Corporation. All rights reserved.
> + * Copyright (C) 2012-2018 NVIDIA Corporation. All rights reserved.
>   *
>   * Aleksandr Frid <afrid@nvidia.com>
>   * Paul Walmsley <pwalmsley@nvidia.com>
> @@ -47,6 +47,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> @@ -243,6 +244,12 @@ enum dfll_tune_range {
>  	DFLL_TUNE_LOW = 1,
>  };
>  
> +
> +enum tegra_dfll_pmu_if {
> +	TEGRA_DFLL_PMU_I2C = 0,
> +	TEGRA_DFLL_PMU_PWM = 1,
> +};
> +
>  /**
>   * struct dfll_rate_req - target DFLL rate request data
>   * @rate: target frequency, after the postscaling
> @@ -294,16 +301,25 @@ struct tegra_dfll {
>  	u32				ci;
>  	u32				cg;
>  	bool				cg_scale;
> +	u32				reg_init_uV;

Doesn't this belong under PWM interface? Also being picky I dont' find
init_uV very descriptive.

Otherwise the change looks fine to me.

Cheers
Jon

-- 
nvpublic
