From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 06/19] soc: tegra: Add Tegra PMC clocks registration
 into PMC driver
Date: Wed, 8 Jan 2020 04:00:25 +0300
Message-ID: <b37d1be0-affc-a0c7-157a-140b141ca155@gmail.com>
References: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
 <1578370458-3686-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578370458-3686-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.01.2020 07:14, Sowjanya Komatineni пишет:
> Tegra PMC has clk_out_1, clk_out_2, and clk_out_3 clocks and currently
> these PMC clocks are registered by Tegra clock driver with each clock as
> separate mux and gate clocks using clk_register_mux and clk_register_gate
> by passing PMC base address and register offsets and PMC programming for
> these clocks happens through direct PMC access by the clock driver.
> 
> With this, when PMC is in secure mode any direct PMC access from the
> non-secure world does not go through and these clocks will not be
> functional.
> 
> This patch adds these PMC clocks registration to pmc driver with PMC as
> a clock provider and registers each clock as single clock.
> 
> clk_ops callback implementations for these clocks uses tegra_pmc_readl and
> tegra_pmc_writel which supports PMC programming in both secure mode and
> non-secure mode.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 242 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 242 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 1699dda6b393..2b1a709c3cb7 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -13,9 +13,13 @@
>  
>  #include <linux/arm-smccc.h>
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk/clk-conf.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> +#include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/init.h>
> @@ -48,6 +52,7 @@
>  #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>  #include <dt-bindings/gpio/tegra186-gpio.h>
>  #include <dt-bindings/gpio/tegra194-gpio.h>
> +#include <dt-bindings/soc/tegra-pmc.h>
>  
>  #define PMC_CNTRL			0x0
>  #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
> @@ -100,6 +105,8 @@
>  #define PMC_WAKE2_STATUS		0x168
>  #define PMC_SW_WAKE2_STATUS		0x16c
>  
> +#define PMC_CLK_OUT_CNTRL		0x1a8
> +#define  PMC_CLK_OUT_MUX_MASK		GENMASK(1, 0)
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -155,6 +162,63 @@
>  #define  TEGRA_SMC_PMC_READ	0xaa
>  #define  TEGRA_SMC_PMC_WRITE	0xbb
>  
> +struct pmc_clk {
> +	struct clk_hw	hw;
> +	unsigned long	offs;
> +	u32		mux_shift;
> +	u32		force_en_shift;
> +};
> +
> +#define to_pmc_clk(_hw) container_of(_hw, struct pmc_clk, hw)
> +
> +struct pmc_clk_init_data {
> +	char *name;
> +	const char *const *parents;
> +	int num_parents;
> +	int clk_id;
> +	u8 mux_shift;
> +	u8 force_en_shift;
> +};
> +
> +static const char * const clk_out1_parents[] = { "osc", "osc_div2",
> +	"osc_div4", "extern1",
> +};
> +
> +static const char * const clk_out2_parents[] = { "osc", "osc_div2",
> +	"osc_div4", "extern2",
> +};
> +
> +static const char * const clk_out3_parents[] = { "osc", "osc_div2",
> +	"osc_div4", "extern3",
> +};

There is no way to specify "osc" as a parent clock in a device-tree
because there is no DT ID assigned to the OSC in the CaR driver, should
this be fixed?
