From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH v2] mfd: tps65910: Correct power-off programming sequence
Date: Tue, 26 May 2020 17:01:01 +0200
Message-ID: <20200526145952.GA2517@qmqm.qmqm.pl>
References: <20200524192643.18207-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200524192643.18207-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, May 24, 2020 at 10:26:43PM +0300, Dmitry Osipenko wrote:
> This patch fixes system shutdown on a devices that use TPS65910 as a
> system's power controller. In accordance to the TPS65910 datasheet, the
> PMIC's state-machine transitions into the OFF state only when DEV_OFF
> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
> otherwise PMIC won't get into a proper state on shutdown. Devices like
> Nexus 7 tablet and Ouya game console are now shutting down properly.

The datasheets of 65910 and 65911 say that ON and SLP bits are cleared
during OFF state. But I guess the hardware might work differently.

[...]
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -440,8 +440,13 @@ static void tps65910_power_off(void)
>  			DEVCTRL_PWR_OFF_MASK) < 0)
>  		return;
>  
> -	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
> -			DEVCTRL_DEV_ON_MASK);
> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
> +			DEVCTRL_DEV_SLP_MASK) < 0)
> +		return;
> +
> +	tps65910_reg_update_bits(tps65910, TPS65910_DEVCTRL,
> +				 DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
> +				 DEVCTRL_DEV_OFF_MASK);
>  }

There is tps65910_reg_set_bits() at the start of function. I guess it
doesn't work if your changes are needed. Maybe you can remove it?

I would also include your observations about the chip's behaviour in the
commit message so it doesn't get "fixed" later.

Best Regards,
Micha³ Miros³aw
