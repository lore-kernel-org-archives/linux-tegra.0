From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 2/5] clk: tegra: Bump SCLK clock rate to 216MHz on
 Tegra20
Date: Tue, 26 Sep 2017 13:01:09 +0300
Message-ID: <20170926100109.GX6290@tbergstrom-lnx.Nvidia.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <aa9a9c3a1447b37c6b3b5ce9a7ce5f73473832db.1506380746.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <aa9a9c3a1447b37c6b3b5ce9a7ce5f73473832db.1506380746.git.digetx@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vinod.koul@intel.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 26, 2017 at 02:22:03AM +0300, Dmitry Osipenko wrote:
> AHB DMA is a running on 1/2 of SCLK rate, APB on 1/4. Increasing SCLK rate
> results in an increased DMA transfer rate.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

> ---
>  drivers/clk/tegra/clk-tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index e76c0d292ca7..c511716093e2 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1031,7 +1031,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 1 },
>  	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 1 },
>  	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 1 },
> -	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 120000000, 1 },
> +	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 216000000, 1 },
>  	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 1 },
>  	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 1 },
> -- 
> 2.14.1
> 
