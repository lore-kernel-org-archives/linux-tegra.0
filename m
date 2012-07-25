From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix U16 divider range check
Date: Wed, 25 Jul 2012 12:12:44 +0530
Message-ID: <500F9564.6050607@nvidia.com>
References: <1343170214-28262-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343170214-28262-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 25 July 2012 04:20 AM, Stephen Warren wrote:
> From: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> A U16 divider can divide a clock by 1..64K. However, the range-check
> in clk_div16_get_divider() limited the range to 1..256. Fix this. NVIDIA's
> downstream kernels already have the fixed range-check.
>
> In practice this is a problem on Whistler's I2C bus, which uses a bus
> clock rate of 100KHz (rather than the more common 400KHz on Tegra boards),
> which requires a HW module clock of 8*100KHz. The parent clock is 216MHz,
> leading to a desired divider of 270. Prior to conversion to the common
> clock framework, this range error was somehow ignored/irrelevant and
> caused no problems. However, the common clock framework evidently has
> more rigorous error-checking, so this failure causes the I2C bus to fail
> to operate correctly.
>
> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks Stephen!!

Verified on Cardhu and Ventana with common clock framework patches.

> ---
>   arch/arm/mach-tegra/tegra2_clocks.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
> index a703844..83ccb85 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -223,7 +223,7 @@ static int clk_div16_get_divider(unsigned long parent_rate, unsigned long rate)
>   	if (divider_u16 - 1<  0)
>   		return 0;
>
> -	if (divider_u16 - 1>  255)
> +	if (divider_u16 - 1>  0xFFFF)
>   		return -EINVAL;
>
>   	return divider_u16 - 1;
