From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 07/31] clk: tegra: implement a reset driver
Date: Tue, 03 Dec 2013 12:07:21 -0700
Message-ID: <529E2BE9.5030803@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-8-git-send-email-swarren@wwwdotorg.org> <20131129132618.GT22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131129132618.GT22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/29/2013 06:26 AM, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:54:02PM -0700, Stephen Warren wrote: 
> [...]
>> diff --git a/drivers/clk/tegra/clk-tegra114.c
>> b/drivers/clk/tegra/clk-tegra114.c
> [...]
>> -	clks = tegra_clk_init(TEGRA124_CLK_CLK_MAX, 6); +	clks =
>> tegra_clk_init(clk_base, TEGRA124_CLK_CLK_MAX, 6);
> 
> This doesn't really concern this patch, but this is inconsistent
> with the drivers for other generations. We should probably make
> that consistent in a separate patch.
> 
>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> 
>> +static int tegra_clk_rst_assert(struct reset_controller_dev
>> *rcdev, +		unsigned long id); +static int
>> tegra_clk_rst_deassert(struct reset_controller_dev *rcdev, +
>> unsigned long id);
> 
> Can you reorder the code so that these forward-declarations can be 
> avoided?
> 
>> /* Global data of Tegra CPU CAR ops */ static struct
>> tegra_cpu_car_ops dummy_car_ops; struct tegra_cpu_car_ops
>> *tegra_cpu_car_ops = &dummy_car_ops; @@ -70,6 +77,17 @@ static
>> struct clk **clks; static int clk_num; static struct
>> clk_onecell_data clk_data;
>> 
>> +static struct reset_control_ops rst_ops = { +	.assert =
>> tegra_clk_rst_assert, +	.deassert = tegra_clk_rst_deassert, +}; 
>> + +static struct reset_controller_dev rst_ctlr = { +	.ops =
>> &rst_ops, +	.owner = THIS_MODULE, +	.of_reset_n_cells = 1, +};
> 
> It looks like these can be moved further down (below the
> implementation of tegra_clk_rst_assert() and
> tegra_clk_rst_deassert()). I rather like not having to modify two
> locations when the signature changes, but it's not that big a deal,
> so with or without that fixed up:
> 
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

OK, I moved the structs right before the function that uses them,
removed the function prototypes, and maintained your tag. Thanks.
