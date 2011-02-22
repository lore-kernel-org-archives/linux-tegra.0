From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: tegra: timer: Enable timer and rtc clocks
Date: Tue, 22 Feb 2011 20:56:34 +0000
Message-ID: <20110222205634.GF29559@n2100.arm.linux.org.uk>
References: <1298342392-21236-1-git-send-email-ccross@android.com> <1298342392-21236-6-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1298342392-21236-6-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 06:39:50PM -0800, Colin Cross wrote:
> +	struct clk *clk;
>  	unsigned long rate = clk_measure_input_freq();
>  	int ret;
>  
> +	clk = clk_get_sys("timer", NULL);
> +	BUG_ON(IS_ERR(clk));
> +	clk_enable(clk);
> +	clk_put(clk);
> +
> +	clk = clk_get_sys("rtc-tegra", NULL);
> +	BUG_ON(IS_ERR(clk));
> +	clk_enable(clk);
> +	clk_put(clk);

It's probably better to leave them get'd if you're continuing to use
them and just forget the reference.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
