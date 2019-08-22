From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-of: Do not warn on deferred
 probe
Date: Thu, 22 Aug 2019 08:06:58 +0200
Message-ID: <3b26d39c-0db4-0bf8-dbec-6d6def0e4307@linaro.org>
References: <20190821150241.31093-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821150241.31093-1-jonathanh@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 21/08/2019 17:02, Jon Hunter wrote:
> Deferred probe is an expected return value for clk_get() on many
> platforms. The driver deals with it properly, so there's no need
> to output a warning that may potentially confuse users.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied, thanks!

>  drivers/clocksource/timer-of.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
> index 80542289fae7..d8c2bd4391d0 100644
> --- a/drivers/clocksource/timer-of.c
> +++ b/drivers/clocksource/timer-of.c
> @@ -113,8 +113,10 @@ static __init int timer_of_clk_init(struct device_node *np,
>  	of_clk->clk = of_clk->name ? of_clk_get_by_name(np, of_clk->name) :
>  		of_clk_get(np, of_clk->index);
>  	if (IS_ERR(of_clk->clk)) {
> -		pr_err("Failed to get clock for %pOF\n", np);
> -		return PTR_ERR(of_clk->clk);
> +		ret = PTR_ERR(of_clk->clk);
> +		if (ret != -EPROBE_DEFER)
> +			pr_err("Failed to get clock for %pOF\n", np);
> +		goto out;
>  	}
>  
>  	ret = clk_prepare_enable(of_clk->clk);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
