From: Jim Lin <jilin@nvidia.com>
Subject: Re: [PATCH v4 02/20] clk: tegra: periph: add new periph clks and
 muxes for Tegra210
Date: Wed, 6 May 2015 19:20:32 +0800
Message-ID: <5549F900.2050600@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <1430757460-9478-3-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430757460-9478-3-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/05/2015 12:37 AM, Rhyland Klein wrote:
> Tegra210 has significant differences in muxes for peripheral clocks.
> One of the most important changes is that pll_m isn't to be used
> as a source for peripherals. Therefore, we need to define the new
> muxes and new clocks to use those muxes for Tegra210 support.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>   drivers/clk/tegra/clk-id.h           |   57 +++++++-
>   drivers/clk/tegra/clk-tegra-periph.c |  257 +++++++++++++++++++++++++++++++++-
>   2 files changed, 312 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
> index 60738cc954cb..ac6eaba5cc6e 100644
>
>   
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> index 46af9244ba74..bde7286bb16b 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
>
> @@ -303,12 +386,93 @@ static const char *mux_pllm_pllc_pllp_plla[] = {
>   #define mux_pllm_pllc_pllp_plla_idx mux_pllp_pllc_pllm_clkm_idx
>   
>   static const char *mux_pllp_pllc_clkm[] = {
> -	"pll_p", "pll_c", "pll_m"
> +	"pll_p", "pll_c", "clk_m"
>   };
>   static u32 mux_pllp_pllc_clkm_idx[] = {
>   	[0] = 0, [1] = 1, [2] = 3,
>   };
>   
> +static const char *mux_pllp_pllc_clkm_1[] = {
> +	"pll_p", "pll_c", "clk_m"
> +};
> +static u32 mux_pllp_pllc_clkm_1_idx[] = {
> +	[0] = 0, [1] = 2, [2] = 5,
> +};
> +
> +static const char *mux_pllp_pllc_plla_clkm[] = {
> +	"pll_p", "pll_c", "pll_a_out0", "clk_m"
> +};
> +static u32 mux_pllp_pllc_plla_clkm_idx[] = {
> +	[0] = 0, [1] = 2, [2] = 4, [3] = 6,
> +};
> +
> +static const char *mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2[] = {
> +	"pll_p", "pll_c", "pll_c4_out0", "pll_c4_out1", "clk_m", "pll_c4_out2"
> +};
> +static u32 mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2_idx[] = {
> +	[0] = 0, [1] = 2, [2] = 3, [3] = 5, [4] = 6, [5] = 7,
> +};
> +
> +static const char *
> +mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0[] = {
> +	"pll_p", "pll_c_out1", "pll_c", "pll_c4_out2", "pll_c4_out1",
> +	"clk_m", "pll_c4_out0"
> +};
> +static u32
> +mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0_idx[] = {
> +	[0] = 0, [1] = 1, [2] = 2, [3] = 4, [4] = 5, [5] = 6, [6] = 7,
> +};
> +
> +static const char *mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0[] = {
> +	"pll_p", "pll_c4_out2", "pll_c4_out1", "clk_m", "pll_c4_out0"
> +};
> +static u32 mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0_idx[] = {
> +	[0] = 0, [1] = 3, [2] = 4, [3] = 6, [4] = 7,
> +};
> +
> +static const char *mux_pllp_clkm_pllc4_out2_out1_out0_lj[] = {
> +	"pll_p",
> +	"pll_c4_out2", "pll_c4_out0",	/* LJ input */
> +	"pll_c4_out2", "pll_c4_out1",
> +	"pll_c4_out1",			/* LJ input */
> +	"clk_m", "pll_c4_out0"
> +};
> +#define mux_pllp_clkm_pllc4_out2_out1_out0_lj_idx NULL
> +
> +static const char *mux_pllp_pllc2_c_c3_clkm[] = {
> +	"pll_p", "pll_c2", "pll_c", "pll_c3", "clk_m"
> +};
> +static u32 mux_pllp_pllc2_c_c3_clkm_idx[] = {
> +	[0] = 0, [1] = 1, [2] = 2, [3] = 3, [4] = 6,
> +};
> +
> +static const char *mux_pllp_clkm_clk32_plle[] = {
> +	"pll_p", "clk_m", "clk_32k", "pll_e"
> +};
> +static u32 mux_pllp_clkm_clk32_plle_idx[] = {
> +	[0] = 0, [1] = 2, [2] = 4, [3] = 6,
> +};
> +
> +static const char *mux_pllp_pllp_out3_clkm_clk32k_plla[] = {
> +	"pll_p", "pll_p_out3", "clk_m", "clk_32k", "pll_a_out0"
> +};
> +#define mux_pllp_pllp_out3_clkm_clk32k_plla_idx NULL
> +
> +static const char *mux_pllp_out3_clkm_pllp_pllc4[] = {
> +	"pll_p_out3", "clk_m", "pll_p", "pll_c4_out0", "pll_c4_out1",
> +	"pll_c4_out2"
> +};
> +static u32 mux_pllp_out3_clkm_pllp_pllc4_idx[] = {
> +	[0] = 0, [1] = 3, [2] = 4, [3] = 5, [4] = 6, [5] = 7,
> +};
> +
> +static const char *mux_clkm_pllp_pllre[] = {
> +	"clk_m", "pll_p_out_xusb", "pll_re_out"
> +};
> +static u32 mux_clkm_pllp_pllre_idx[] = {
> +	[0] = 0, [1] = 1, [2] = 5,
> +};
> +
>   static const char *mux_pllp_pllc_clkm_clk32[] = {
>   	"pll_p", "pll_c", "clk_m", "clk_32k"
>   };
> @@ -333,6 +497,11 @@ static u32 mux_clkm_48M_pllp_480M_idx[] = {
>   	[0] = 0, [1] = 2, [2] = 4, [3] = 6,
>   };
>   
> +static const char *mux_clkm_pllre_clk32_480M[] = {
> +	"clk_m", "pll_re_out", "clk_32k", "pll_u_480M"
> +};
> +#define mux_clkm_pllre_clk32_480M_idx NULL
Please help to replace above

#define mux_clkm_pllre_clk32_480M_idx NULL

with

static u32 mux_clkm_pllre_clk32_480M_idx[] = {

        [0] = 0, [1] = 1, [2] = 2, [3] = 3,
};


Thanks.

> +
>   static const char *mux_clkm_pllre_clk32_480M_pllc_ref[] = {
>   	"clk_m", "pll_re_out", "clk_32k", "pll_u_480M", "pll_c", "pll_ref"
>   };
>
--nvpublic
