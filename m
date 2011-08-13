From: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 08/12] gpio/tegra: Add device tree support
Date: Sat, 13 Aug 2011 11:49:18 +0200
Message-ID: <CAAfyv34kOtwjerB0gMhEKNTwGd9w-LCE52MCUuvzTyYkXLY-dg@mail.gmail.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
	<1313189697-21287-9-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313189697-21287-9-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Aug 13, 2011 at 12:54 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =C2=A0drivers/gpio/gpio-tegra.c | =C2=A0 31 +++++++++++++++++++++++++=
++++++
> =C2=A01 files changed, 31 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 4da4839..923b413 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -326,6 +326,29 @@ static struct irq_chip tegra_gpio_irq_chip =3D {
> =C2=A0#endif
> =C2=A0};
>
> +#ifdef CONFIG_OF
> +static void __init tegra_gpio_probe_dt(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 const __be32 *gpios;
> + =C2=A0 =C2=A0 =C2=A0 u32 gpioslen;
> + =C2=A0 =C2=A0 =C2=A0 int i;
> +
> + =C2=A0 =C2=A0 =C2=A0 gpios =3D of_get_property(pdev->dev.of_node, "=
nvidia,gpios", &gpioslen);
> + =C2=A0 =C2=A0 =C2=A0 if (gpios =3D=3D NULL)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> +
> + =C2=A0 =C2=A0 =C2=A0 gpioslen /=3D sizeof(*gpios);
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < gpioslen; i++, gpios++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 gpio =3D be32_=
to_cpup(gpios);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "Enabling GPIO %d\n", gpio);
Is really necessary to print all enabled gpio's to console? Also seen
same in pinmux probe.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tegra_gpio_enable(=
gpio);
> + =C2=A0 =C2=A0 =C2=A0 }
> +}
> +#else
> +static inline void __init tegra_gpio_probe_dt(struct platform_device=
 *pdev)
> +{
> +}
> +#endif
>
> =C2=A0/* This lock class tells lockdep that GPIO irqs are in a differ=
ent
> =C2=A0* category than their parents, so it won't report false recursi=
on.
> @@ -371,13 +394,21 @@ static int __init tegra_gpio_probe(struct platf=
orm_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spin_lock_init(&bank->lvl_lock[j]);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> + =C2=A0 =C2=A0 =C2=A0 tegra_gpio_probe_dt(pdev);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> +static struct of_device_id tegra_gpio_of_match[] __devinitdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 { .compatible =3D "nvidia,tegra20-gpio", },
> + =C2=A0 =C2=A0 =C2=A0 { },
> +};
> +
> =C2=A0static struct platform_driver tegra_gpio_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =C2=A0 =3D=
 "tegra-gpio",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =C2=A0=3D=
 THIS_MODULE,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 tegra_gpio_of_match,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 tegra_gpio_probe,
> =C2=A0};
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/
>

regards,

marek

--=20
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
=46reelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
