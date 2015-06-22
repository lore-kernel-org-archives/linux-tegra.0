From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: sa1100: convert SA11x0 related code to use new
 chained handler helper
Date: Mon, 22 Jun 2015 11:59:23 +0100
Message-ID: <20150622105923.GE19061@x1>
References: <E1Z4yzx-0002S6-7p@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1Z4yzx-0002S6-7p-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 16 Jun 2015, Russell King wrote:

> Convert SA11x0 (Neponset, SA1111, and UCB1x00 code) to use the new
> irq_set_chained_handler_and_data() helper.
>=20
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> ---
> Depends on patch 1.
>=20
>  arch/arm/common/sa1111.c        | 7 +++----
>  arch/arm/mach-sa1100/neponset.c | 3 +--
>  drivers/mfd/ucb1x00-core.c      | 3 +--

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>  3 files changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
> index 5cc779c8e9c6..93ee70dbbdd3 100644
> --- a/arch/arm/common/sa1111.c
> +++ b/arch/arm/common/sa1111.c
> @@ -501,8 +501,8 @@ static int sa1111_setup_irq(struct sa1111 *sachip=
, unsigned irq_base)
>  	 * Register SA1111 interrupt
>  	 */
>  	irq_set_irq_type(sachip->irq, IRQ_TYPE_EDGE_RISING);
> -	irq_set_handler_data(sachip->irq, sachip);
> -	irq_set_chained_handler(sachip->irq, sa1111_irq_handler);
> +	irq_set_chained_handler_and_data(sachip->irq, sa1111_irq_handler,
> +					 sachip);
> =20
>  	dev_info(sachip->dev, "Providing IRQ%u-%u\n",
>  		sachip->irq_base, sachip->irq_base + SA1111_IRQ_NR - 1);
> @@ -836,8 +836,7 @@ static void __sa1111_remove(struct sa1111 *sachip=
)
>  	clk_unprepare(sachip->clk);
> =20
>  	if (sachip->irq !=3D NO_IRQ) {
> -		irq_set_chained_handler(sachip->irq, NULL);
> -		irq_set_handler_data(sachip->irq, NULL);
> +		irq_set_chained_handler_and_data(sachip->irq, NULL, NULL);
>  		irq_free_descs(sachip->irq_base, SA1111_IRQ_NR);
> =20
>  		release_mem_region(sachip->phys + SA1111_INTC, 512);
> diff --git a/arch/arm/mach-sa1100/neponset.c b/arch/arm/mach-sa1100/n=
eponset.c
> index af868d258e66..99d9a3b1bf34 100644
> --- a/arch/arm/mach-sa1100/neponset.c
> +++ b/arch/arm/mach-sa1100/neponset.c
> @@ -327,8 +327,7 @@ static int neponset_probe(struct platform_device =
*dev)
>  	irq_set_chip(d->irq_base + NEP_IRQ_SA1111, &nochip);
> =20
>  	irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
> -	irq_set_handler_data(irq, d);
> -	irq_set_chained_handler(irq, neponset_irq_handler);
> +	irq_set_chained_handler_and_data(irq, neponset_irq_handler, d);
> =20
>  	/*
>  	 * We would set IRQ_GPIO25 to be a wake-up IRQ, but unfortunately
> diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
> index 58ea9fdd3a15..3591550598ad 100644
> --- a/drivers/mfd/ucb1x00-core.c
> +++ b/drivers/mfd/ucb1x00-core.c
> @@ -566,8 +566,7 @@ static int ucb1x00_probe(struct mcp *mcp)
>  	}
> =20
>  	irq_set_irq_type(ucb->irq, IRQ_TYPE_EDGE_RISING);
> -	irq_set_handler_data(ucb->irq, ucb);
> -	irq_set_chained_handler(ucb->irq, ucb1x00_irq);
> +	irq_set_chained_handler_and_data(ucb->irq, ucb1x00_irq, ucb);
> =20
>  	if (pdata && pdata->gpio_base) {
>  		ucb->gpio.label =3D dev_name(&ucb->dev);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
