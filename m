From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: clk_get should not be fatal
Date: Tue, 25 Oct 2011 09:26:08 -0700
Message-ID: <1319559968.14932.5.camel@Joe-Laptop>
References: <1319559329-324-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1319559329-324-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2011-10-25 at 19:15 +0300, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote:
> The timer and rtc-timer clocks aren't gated by default, so there is no reason
> to crash the system if the dummy enable call failed.
[]
> diff --git a/arch/arm/mach-tegra/timer.c b/arch/arm/mach-tegra/timer.c
[]
> @@ -186,16 +186,20 @@ static void __init tegra_init_timer(void)
>  	int ret;
>  
>  	clk = clk_get_sys("timer", NULL);
> -	BUG_ON(IS_ERR(clk));
> -	clk_enable(clk);
> +	if (IS_ERR(clk))
> +		pr_warning("Unable to get timer clock");
> +	else
> +		clk_enable(clk);
>  
>  	/*
>  	 * rtc registers are used by read_persistent_clock, keep the rtc clock
>  	 * enabled
>  	 */
>  	clk = clk_get_sys("rtc-tegra", NULL);
> -	BUG_ON(IS_ERR(clk));
> -	clk_enable(clk);
> +	if (IS_ERR(clk))
> +		pr_warning("Unable to get rtc-tegra clock");
> +	else
> +		clk_enable(clk);

Are these messages are really necessary?
Maybe just:
	if (!IS_ERR(clk))
		clk_enable(clk)

If these are really necessary, please use
	pr_warn("Unable to get <foo>\n");
pr_warn and with a terminating newline.
