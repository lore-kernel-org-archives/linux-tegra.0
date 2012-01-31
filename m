From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1] gpio: tps65910: Add sleep control support
Date: Tue, 31 Jan 2012 22:31:08 +0100
Message-ID: <CACRpkdZ-1VBkZN71eFqaxVi5dakP4Dt3yXLa9TTdrKE=dGq__w@mail.gmail.com>
References: <1327999512-4935-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327999512-4935-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 9:45 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:

> The device tps65910/tps65911 supports the sleep
> functionality in some of gpios. If gpio is configured
> in output mode and sleep is enabled then during device
> sleep state, the output of gpio becomes LOW regardless
> of non-sleep output value.
> Such gpio can be used to control regulator switch such
> that output of regulator is off in device sleep state.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Strictly speaking this is pin control business, but since it is already
doing other stuff like this from platform data why not...

Comments:

> diff --git a/include/linux/mfd/tps65910.h b/include/linux/mfd/tps6591=
0.h
> index fa6c6bf..b641690 100644
> --- a/include/linux/mfd/tps65910.h
> +++ b/include/linux/mfd/tps65910.h
> @@ -657,6 +657,8 @@
>
>
> =A0/*Register GPIO =A0(0x80) register.RegisterDescription */
> +#define GPIO_SLEEP_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 0x80
> +#define GPIO_SLEEP_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A07
> =A0#define GPIO_DEB_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 0x10
> =A0#define GPIO_DEB_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A04
> =A0#define GPIO_PUEN_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A00x08
> @@ -740,6 +742,9 @@
> =A0#define TPS65910_GPIO_STS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0BIT(1)
> =A0#define TPS65910_GPIO_SET =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0BIT(0)
>
> +/* Max number of TPS65910/11 GPIOs */
> +#define TPS65911_NUM_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A09

Then name it TPS_6591X_MAX_NUM_GPIO

I would write:

#define TPS65910_NUM_GPIO 6
#define TPS65911_NUM_GPIO 9
#define TPS6591X_MAX_NUM_GPIO 9

And then also refactor this code in the driver:

        switch(tps65910_chip_id(tps65910)) {
        case TPS65910:
                tps65910->gpio.ngpio    =3D 6;
                break;
        case TPS65911:
                tps65910->gpio.ngpio    =3D 9;
                break;
        default:
                return;

to use the new defines instead of magic numbers while
you're at it.

> +
> =A0/* Regulator Index Definitions */
> =A0#define TPS65910_REG_VRTC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A00
> =A0#define TPS65910_REG_VIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 1
> @@ -786,6 +791,7 @@ struct tps65910_board {
> =A0 =A0 =A0 =A0int irq_base;
> =A0 =A0 =A0 =A0int vmbch_threshold;
> =A0 =A0 =A0 =A0int vmbch2_threshold;
> + =A0 =A0 =A0 int en_gpio_sleep[TPS65911_NUM_GPIO];

This is used as a bool so use bool.

> =A0 =A0 =A0 =A0unsigned long regulator_ext_sleep_control[TPS65910_NUM=
_REGS];
> =A0 =A0 =A0 =A0struct regulator_init_data *tps65910_pmic_init_data[TP=
S65910_NUM_REGS];
> =A0};
> --
> 1.7.1.1

Thanks,
Linus Walleij
