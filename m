From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra: bpmp: Don't crash when a clock fails to
 register
Date: Fri, 29 Jun 2018 15:41:45 +0100
Message-ID: <f378f345-02db-f3fd-4c95-b1a2e8ecf3f5@nvidia.com>
References: <20180629143814.17950-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180629143814.17950-1-mperttunen@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>, pdeschrijver@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, thierry.reding@gmail.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@nvidia.com, vbhadram@nvidia.com
List-Id: linux-tegra@vger.kernel.org


On 29/06/18 15:38, Mikko Perttunen wrote:
> When registering clocks, we just skip any that fail to register
> (leaving a NULL hole in the clock table). However, our of_xlate
> function still tries to dereference each entry while looking for
> the clock with the requested id, causing a crash if any clocks
> failed to register. Add a check to of_xlate to skip any NULL
> clocks.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index a896692b74ec..01dada561c10 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -586,9 +586,15 @@ static struct clk_hw *tegra_bpmp_clk_of_xlate(struct of_phandle_args *clkspec,
>  	unsigned int id = clkspec->args[0], i;
>  	struct tegra_bpmp *bpmp = data;
>  
> -	for (i = 0; i < bpmp->num_clocks; i++)
> -		if (bpmp->clocks[i]->id == id)
> -			return &bpmp->clocks[i]->hw;
> +	for (i = 0; i < bpmp->num_clocks; i++) {
> +		struct tegra_bpmp_clk *clk = bpmp->clocks[i];
> +
> +		if (!clk)
> +			continue;
> +
> +		if (clk->id == id)
> +			return &clk->hw;
> +	}
>  
>  	return NULL;
>  }

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
