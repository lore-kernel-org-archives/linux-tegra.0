From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: palmas: support IRQ inversion at the board level
Date: Tue, 25 Feb 2014 09:20:31 +0000
Message-ID: <20140225092031.GF19099@lee--X1>
References: <1392415108-4365-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392415108-4365-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark,

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Some boards or SoCs have an inverter between the PMIC IRQ output pin =
and
> the IRQ controller input signal.
>=20
> The IRQ specifier in DT is meant to represent the IRQ flags at the in=
put
> to the IRQ controller.
>=20
> The Palmas HW's IRQ output has configurable polarity. The driver
> currently selects the output polarity by querying the input polarity =
at
> the IRQ controller. This works fine if the IRQ signal is routed direc=
tly
> from the PMIC to the IRQ controller with no intervening logic. Howeve=
r,
> if the signal is inverted between the two, this automatic polarity
> selection gets the wrong answer.
>=20
> Add an additional optional DT and platform data parameter which indic=
ates
> that such an inversion occurs. If this option is enabled, the Palmas
> driver will configure its IRQ output to the opposite polarity of the =
IRQ
> controller's input.
>=20
> An alternative would have been to add a new non-optional DT parameter=
 to
> indicate the exact desired output polarity. However, this would have =
been
> an incompatible change to the DT binding.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> If this patch could be applied to its own branch (w/ signed tag) in t=
he
> MFD tree, that would great; then I can pull patch 1/2 into the Tegra =
tree
> so that I can apply patch 2/2 to the Tegra tree. Thanks.
> ---
>  Documentation/devicetree/bindings/mfd/palmas.txt | 6 ++++++

Would you care to review this for Stephen please?

>  drivers/mfd/palmas.c                             | 4 ++++
>  include/linux/mfd/palmas.h                       | 1 +
>  3 files changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Docum=
entation/devicetree/bindings/mfd/palmas.txt
> index e5f0f8303461..76ec509d5f87 100644
> --- a/Documentation/devicetree/bindings/mfd/palmas.txt
> +++ b/Documentation/devicetree/bindings/mfd/palmas.txt
> @@ -18,6 +18,12 @@ Required properties:
>    ti,tps659038
>  and also the generic series names
>    ti,palmas
> +- interrupts : Should contain a single entry for the IRQ output.
> +- ti,irq-externally-inverted : If missing, the polarity of the Palma=
s IRQ
> +  output should be set to the opposite of the polarity indicated by =
the IRQ
> +  specifier in the interrupts property. If absent, the polarity shou=
ld be
> +  configured to match. This allows the representation of an inverter=
 between
> +  the Palmas IRQ output and the interrupt parent's IRQ input.
>  - interrupt-controller : palmas has its own internal IRQs
>  - #interrupt-cells : should be set to 2 for IRQ number and flags
>    The first cell is the IRQ number.
> diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
> index d280d789e55a..f4ea932adf8d 100644
> --- a/drivers/mfd/palmas.c
> +++ b/drivers/mfd/palmas.c
> @@ -293,6 +293,8 @@ static int palmas_set_pdata_irq_flag(struct i2c_c=
lient *i2c,
>  	}
> =20
>  	pdata->irq_flags =3D irqd_get_trigger_type(irq_data);
> +	pdata->irq_external_inversion =3D of_property_read_bool(i2c->dev.of=
_node,
> +						"ti,irq-externally-inverted");
>  	dev_info(&i2c->dev, "Irq flag is 0x%08x\n", pdata->irq_flags);
>  	return 0;
>  }
> @@ -447,6 +449,8 @@ static int palmas_i2c_probe(struct i2c_client *i2=
c,
>  		reg =3D PALMAS_POLARITY_CTRL_INT_POLARITY;
>  	else
>  		reg =3D 0;
> +	if (pdata->irq_external_inversion)
> +		reg ^=3D PALMAS_POLARITY_CTRL_INT_POLARITY;
>  	ret =3D palmas_update_bits(palmas, PALMAS_PU_PD_OD_BASE,
>  			PALMAS_POLARITY_CTRL, PALMAS_POLARITY_CTRL_INT_POLARITY,
>  			reg);
> diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
> index 9974e387e483..2fdf08c50a48 100644
> --- a/include/linux/mfd/palmas.h
> +++ b/include/linux/mfd/palmas.h
> @@ -292,6 +292,7 @@ struct palmas_clk_platform_data {
> =20
>  struct palmas_platform_data {
>  	int irq_flags;
> +	bool irq_external_inversion;
>  	int gpio_base;
> =20
>  	/* bit value to be loaded to the POWER_CTRL register */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
