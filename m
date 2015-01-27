From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: fix big-endian issue with irq code
Date: Tue, 27 Jan 2015 21:42:04 +0300
Message-ID: <54C7DBFC.2040607@gmail.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-5-git-send-email-bob.mottram@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420817231-8346-5-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.01.2015 18:27, Bob Mottram =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Replace the _raw-writel with writel_relaxed to fix issue with
> running tegra in big-endian. Tested on Jetson TK1.
>
> Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>   arch/arm/mach-tegra/irq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
> index ab95f53..f4c2857 100644
> --- a/arch/arm/mach-tegra/irq.c
> +++ b/arch/arm/mach-tegra/irq.c
> @@ -94,7 +94,7 @@ static inline void tegra_irq_write_mask(unsigned in=
t irq, unsigned long reg)
>   	base =3D ictlr_reg_base[(irq - FIRST_LEGACY_IRQ) / 32];
>   	mask =3D BIT((irq - FIRST_LEGACY_IRQ) % 32);
>
> -	__raw_writel(mask, base + reg);
> +	writel_relaxed(mask, base + reg);
>   }
>
>   static void tegra_mask(struct irq_data *d)
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
