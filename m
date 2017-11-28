From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Wed, 29 Nov 2017 02:30:20 +0300
Message-ID: <18f57c1f-add0-908a-6a26-7cc81f29d7d9@gmail.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 23.10.2017 14:12, Jon Hunter wrote:
> Commit a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")
> fixed the parent clock for APBDMA, but the consequence of this that
> after probing the APBDMA device, the APB Clock (or PCLK) is now
> disabled. Disabling the APB clock causes accesses to any other device
> on the APB to hang and prevent Tegra from booting.
> 
> Currently, the APB clock is registered with the flag "CLK_IGNORE_UNUSED"
> to prevent the clock being disabled if unused on boot. However, even
> if it is used, it still needs to be always kept enabled and so update
> the flag for the APB clock to be "CLK_IS_CRITICAL".
> 
> Fixes: a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")
> 
> Suggested-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-super-gen4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
> index 4f6fd307cb70..10047107c1dc 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -166,7 +166,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>  				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
>  				   &sysrate_lock);
>  	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
> -				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
> +				CLK_IS_CRITICAL, clk_base + SYSTEM_CLK_RATE,
>  				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
>  	*dt_clk = clk;
>  }
> 

Unfortunately this patch somehow breaks Tegra20, getting a hang during boot. For
now I don't know what's the cause of the issue, may take a more detailed look
soon. If you have any suggestions, please tell.
