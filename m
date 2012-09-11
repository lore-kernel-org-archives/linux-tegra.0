From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: fix overflow in tegra20_pll_clk_round_rate()
Date: Tue, 11 Sep 2012 11:49:26 +0530
Message-ID: <504ED7EE.5050103@nvidia.com>
References: <1347318758-7954-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347318758-7954-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 11 September 2012 04:42 AM, Stephen Warren wrote:
> From: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> 32-bit math isn't enough when e.g. *prate=12000000, and sel->n=1000.
> Use 64-bit math to prevent this.

Thanks Stephen!!

> Cc: Prashant Gaikwad<pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Prashant, can you please audit all of the Tegra clock driver to see if
> there are any other instances of the same issue? Thanks.

Sure.

> ---
>   arch/arm/mach-tegra/tegra20_clocks.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra20_clocks.c b/arch/arm/mach-tegra/tegra20_clocks.c
> index ee6922b..e2a43e4 100644
> --- a/arch/arm/mach-tegra/tegra20_clocks.c
> +++ b/arch/arm/mach-tegra/tegra20_clocks.c
> @@ -798,7 +798,7 @@ static long tegra20_pll_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	struct clk_tegra *c = to_clk_tegra(hw);
>   	const struct clk_pll_freq_table *sel;
>   	unsigned long input_rate = *prate;
> -	unsigned long output_rate = *prate;
> +	u64 output_rate = *prate;
>   	int mul;
>   	int div;
>
