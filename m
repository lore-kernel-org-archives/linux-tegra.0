From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 2/7] clk: tegra: fix isp clock modelling
Date: Thu, 23 Feb 2017 09:49:12 +0200
Message-ID: <18f33b62-5f9c-e443-c8bb-2538e45960fe@kapsi.fi>
References: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
 <1487776444-4701-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1487776444-4701-3-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The TRM shows a CLK_SOURCE_ISPB register, but after some discussion, it 
seems like that is a documentation generation bug, so this should be 
correct.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

On 22.02.2017 17:13, Peter De Schrijver wrote:
> The 2 isp clocks (ispa and ispb) share a mux/divider control. So model
> this as 1 mux/divider clock and child gate clocks.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-id.h               |  1 +
>  drivers/clk/tegra/clk-tegra-periph.c     | 11 +++++++++--
>  drivers/clk/tegra/clk-tegra210.c         |  1 +
>  include/dt-bindings/clock/tegra210-car.h |  4 ++--
>  4 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
> index 5738635..1019eb8 100644
> --- a/drivers/clk/tegra/clk-id.h
> +++ b/drivers/clk/tegra/clk-id.h
> @@ -307,6 +307,7 @@ enum clk_id {
>  	tegra_clk_xusb_ssp_src,
>  	tegra_clk_sclk_mux,
>  	tegra_clk_sor_safe,
> +	tegra_clk_ispa,
>  	tegra_clk_max,
>  };
>
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> index 4ce4e7f..19b00b7 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -168,6 +168,12 @@
>  			      0, TEGRA_PERIPH_NO_GATE, _clk_id,\
>  			      _parents##_idx, 0, _lock)
>
> +#define MUX8_NOGATE(_name, _parents, _offset, _clk_id)	\
> +	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,	\
> +			      29, MASK(3), 0, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP,\
> +			      0, TEGRA_PERIPH_NO_GATE, _clk_id,\
> +			      _parents##_idx, 0, NULL)
> +
>  #define INT(_name, _parents, _offset,	\
>  			    _clk_num, _gate_flags, _clk_id)	\
>  	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
> @@ -739,7 +745,7 @@
>  	MUX8("soc_therm", mux_clkm_pllc_pllp_plla, CLK_SOURCE_SOC_THERM, 78, TEGRA_PERIPH_ON_APB, tegra_clk_soc_therm_8),
>  	MUX8("vi_sensor", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR, 164, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor_8),
>  	MUX8("isp", mux_pllm_pllc_pllp_plla_clkm_pllc4, CLK_SOURCE_ISP, 23, TEGRA_PERIPH_ON_APB, tegra_clk_isp_8),
> -	MUX8("isp", mux_pllc_pllp_plla1_pllc2_c3_clkm_pllc4, CLK_SOURCE_ISP, 23, TEGRA_PERIPH_ON_APB, tegra_clk_isp_9),
> +	MUX8_NOGATE("isp", mux_pllc_pllp_plla1_pllc2_c3_clkm_pllc4, CLK_SOURCE_ISP, tegra_clk_isp_9),
>  	MUX8("entropy", mux_pllp_clkm1, CLK_SOURCE_ENTROPY, 149,  0, tegra_clk_entropy),
>  	MUX8("entropy", mux_pllp_clkm_clk32_plle, CLK_SOURCE_ENTROPY, 149,  0, tegra_clk_entropy_8),
>  	MUX8("hdmi_audio", mux_pllp3_pllc_clkm, CLK_SOURCE_HDMI_AUDIO, 176, TEGRA_PERIPH_NO_RESET, tegra_clk_hdmi_audio),
> @@ -819,7 +825,8 @@
>  	GATE("xusb_dev", "xusb_dev_src", 95, 0, tegra_clk_xusb_dev, 0),
>  	GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IGNORE_UNUSED),
>  	GATE("sata_cold", "clk_m", 129, TEGRA_PERIPH_ON_APB, tegra_clk_sata_cold, 0),
> -	GATE("ispb", "clk_m", 3, 0, tegra_clk_ispb, 0),
> +	GATE("ispa", "isp", 23, 0, tegra_clk_ispa, 0),
> +	GATE("ispb", "isp", 3, 0, tegra_clk_ispb, 0),
>  	GATE("vim2_clk", "clk_m", 11, 0, tegra_clk_vim2_clk, 0),
>  	GATE("pcie", "clk_m", 70, 0, tegra_clk_pcie, 0),
>  	GATE("gpu", "pll_ref", 184, 0, tegra_clk_gpu, 0),
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 2ef8d49..7bda8ba 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2210,6 +2210,7 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
>  	[tegra_clk_pll_c4_out3] = { .dt_id = TEGRA210_CLK_PLL_C4_OUT3, .present = true },
>  	[tegra_clk_apb2ape] = { .dt_id = TEGRA210_CLK_APB2APE, .present = true },
>  	[tegra_clk_pll_a1] = { .dt_id = TEGRA210_CLK_PLL_A1, .present = true },
> +	[tegra_clk_ispa] = { .dt_id = TEGRA210_CLK_ISPA, .present = true },
>  };
>
>  static struct tegra_devclk devclks[] __initdata = {
> diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
> index 35288b2..f5c6563 100644
> --- a/include/dt-bindings/clock/tegra210-car.h
> +++ b/include/dt-bindings/clock/tegra210-car.h
> @@ -39,7 +39,7 @@
>  /* 20 (register bit affects vi and vi_sensor) */
>  /* 21 */
>  #define TEGRA210_CLK_USBD 22
> -#define TEGRA210_CLK_ISP 23
> +#define TEGRA210_CLK_ISPA 23
>  /* 24 */
>  /* 25 */
>  #define TEGRA210_CLK_DISP2 26
> @@ -349,7 +349,7 @@
>  #define TEGRA210_CLK_PLL_RE_OUT1 319
>  /* 320 */
>  /* 321 */
> -/* 322 */
> +#define TEGRA210_CLK_ISP 322
>  /* 323 */
>  /* 324 */
>  /* 325 */
>
