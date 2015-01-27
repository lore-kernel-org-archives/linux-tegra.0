From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: gpio: tegra: Maintain endianness
Date: Tue, 27 Jan 2015 21:41:14 +0300
Message-ID: <54C7DBCA.9000200@gmail.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-3-git-send-email-bob.mottram@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420817231-8346-3-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.01.2015 18:27, Bob Mottram =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Replace the _raw-writel with writel_relaxed to fix issue with
> running tegra in big-endian. Tested on Jetson TK1.
>
> Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>   drivers/gpio/gpio-tegra.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 1741981..a83e140 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -85,12 +85,12 @@ static struct tegra_gpio_bank *tegra_gpio_banks;
>
>   static inline void tegra_gpio_writel(u32 val, u32 reg)
>   {
> -	__raw_writel(val, regs + reg);
> +	writel_relaxed(val, regs + reg);
>   }
>
>   static inline u32 tegra_gpio_readl(u32 reg)
>   {
> -	return __raw_readl(regs + reg);
> +	return readl_relaxed(regs + reg);
>   }
>
>   static int tegra_gpio_compose(int bank, int port, int bit)
> --
> 2.1.0
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--=20
Dmitry
