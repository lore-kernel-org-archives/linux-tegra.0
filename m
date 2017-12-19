From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 1/4] clk: tegra: Add la clock for Tegra210
Date: Tue, 19 Dec 2017 23:00:52 +0000
Message-ID: <01f6a806-362e-1276-07d7-dfe439e92034@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1510842542-16451-2-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 16/11/17 14:28, Peter De Schrijver wrote:
> This clock is needed by the memory built-in self test work around.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c         | 12 ++++++++++++
>  include/dt-bindings/clock/tegra210-car.h |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 6d7a613..55a5b7f 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -40,6 +40,7 @@
>  
>  #define CLK_SOURCE_CSITE 0x1d4
>  #define CLK_SOURCE_EMC 0x19c
> +#define CLK_SOURCE_LA 0x1f8
>  
>  #define PLLC_BASE 0x80
>  #define PLLC_OUT 0x84
> @@ -2628,6 +2629,13 @@ static int tegra210_init_pllu(void)
>  	return 0;
>  }
>  
> +static const char * const la_parents[] = {
> +	"pll_p", "pll_c2", "pll_c", "pll_c3", "pll_re_out1", "pll_a1", "clk_m", "pll_c4_out0"
> +};
> +
> +static struct tegra_clk_periph tegra210_la =
> +	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL, 0);
> +

The above are over 80 characters. I know we already have some in this
file that are, but we should avoid it where we can.

Cheers
Jon

-- 
nvpublic
