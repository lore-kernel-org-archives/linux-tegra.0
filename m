From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 02/11] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Wed, 27 Nov 2019 17:32:11 +0300
Message-ID: <64b6a780-d06c-9a10-490b-7285d2b0e207@gmail.com>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
 <1574830773-14892-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574830773-14892-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

27.11.2019 07:59, Sowjanya Komatineni пишет:
> Tegra210 and prior Tegra PMC has clk_out_1, clk_out_2, clk_out_3 with
> mux and gate for each of these clocks.
> 
> Currently these PMC clocks are registered by Tegra clock driver using
> clk_register_mux and clk_register_gate by passing PMC base address
> and register offsets and PMC programming for these clocks happens
> through direct PMC access by the clock driver.
> 
> With this, when PMC is in secure mode any direct PMC access from the
> non-secure world does not go through and these clocks will not be
> functional.
> 
> This patch adds these clocks registration with PMC as a clock provider
> for these clocks. clk_ops callback implementations for these clocks
> uses tegra_pmc_readl and tegra_pmc_writel which supports PMC programming
> in secure mode and non-secure mode.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 330 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 330 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index ea0e11a09c12..a353f6d0a832 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -13,6 +13,9 @@
>  
>  #include <linux/arm-smccc.h>
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk/clk-conf.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> @@ -48,6 +51,7 @@
>  #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>  #include <dt-bindings/gpio/tegra186-gpio.h>
>  #include <dt-bindings/gpio/tegra194-gpio.h>
> +#include <dt-bindings/soc/tegra-pmc.h>
>  
>  #define PMC_CNTRL			0x0
>  #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
> @@ -100,6 +104,7 @@
>  #define PMC_WAKE2_STATUS		0x168
>  #define PMC_SW_WAKE2_STATUS		0x16c
>  
> +#define PMC_CLK_OUT_CNTRL		0x1a8
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -155,6 +160,91 @@
>  #define  TEGRA_SMC_PMC_READ	0xaa
>  #define  TEGRA_SMC_PMC_WRITE	0xbb
>  
> +struct pmc_clk_mux {
> +	struct clk_hw	hw;
> +	unsigned long	offs;
> +	u32		mask;
> +	u32		shift;
> +};
> +
> +#define to_pmc_clk_mux(_hw) container_of(_hw, struct pmc_clk_mux, hw)
> +
> +struct pmc_clk_gate {
> +	struct clk_hw	hw;
> +	unsigned long	offs;
> +	u32		shift;
> +};
> +
> +#define to_pmc_clk_gate(_hw) container_of(_hw, struct pmc_clk_gate, hw)
> +
> +struct pmc_clk_init_data {
> +	char *mux_name;
> +	char *gate_name;
> +	const char **parents;
> +	int num_parents;
> +	int mux_id;
> +	int gate_id;
> +	char *dev_name;
> +	u8 mux_shift;
> +	u8 gate_shift;
> +	u8 init_parent_index;
> +	int init_state;
> +};
> +
> +static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
> +	"clk_m_div4", "extern1",
> +};
> +
> +static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
> +	"clk_m_div4", "extern2",
> +};
> +
> +static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
> +	"clk_m_div4", "extern3",
> +};
> +
> +static struct pmc_clk_init_data tegra_pmc_clks_data[] = {

const?

[snip]
