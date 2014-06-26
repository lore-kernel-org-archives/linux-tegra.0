From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: export clock names for debugging
Date: Thu, 26 Jun 2014 22:32:23 +0400
Message-ID: <53AC6737.5010507@cogentembedded.com>
References: <1403797705-26910-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403797705-26910-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 06/26/2014 07:48 PM, Peter De Schrijver wrote:

> When writing a module for testing or debugging purposes, there is no way to
> get hold of clk handles. This patch solves this by exposing all valid clocks
> as clkdev's for the virtual device tegra-clk-debug.

> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/clk/tegra/clk.c |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)

> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index c0a7d77..3315fca 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -277,6 +277,12 @@ void __init tegra_register_devclks(struct tegra_devclk *dev_clks, int num)
>   	for (i = 0; i < num; i++, dev_clks++)
>   		clk_register_clkdev(clks[dev_clks->dt_id], dev_clks->con_id,
>   				dev_clks->dev_id);
> +
> +	for (i = 0; i < clk_num; i++) {
> +		if (!IS_ERR(clks[i]) || !clks[i])

    Are you sure it should be || here, not &&? The following code doesn't seem 
to make much sense this way... Perhaps you meant !IS_ERR_OR_NULL(clks[i])?

> +			clk_register_clkdev(clks[i], __clk_get_name(clks[i]),
> +				"tegra-clk-debug");
> +	}
>   }

WBR, Sergei
