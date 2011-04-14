From: Mayuresh Janorkar <mayureshjanorkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: regulator: tps6586x: add PFM/PWM options on SMs
Date: Fri, 15 Apr 2011 04:28:30 +0530
Message-ID: <BANLkTi=McsPozAGVCf9TBNuxZvtTPw79yA@mail.gmail.com>
References: <1302818393-19067-1-git-send-email-yelin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302818393-19067-1-git-send-email-yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yen.Lin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 15, 2011 at 3:29 AM, <Yen.Lin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> TPS6586x SM0, SM1 and SM2 port have 2 power switching modes:
> =A0 =A0- PWM only, or
> =A0 =A0- PMW-PFM auto mode
>
> Some of TPS6586x have voltage spike in PFM-to-FWM transition which
> can lockup the CPU if choose PWM-PFM auto mode.

Looks like some problem with grammar.
If I understand it correctly you mean to say:
"It can lockup CPU if PWM-PF auto mode is chosen"

>
> This patch enables such mode selection on SMs ports from the
> board level power configuration file.
>
> Signed-off-by: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0drivers/regulator/tps6586x-regulator.c | =A0 46 ++++++++++++++++++=
++++++++++++++
> =A0include/linux/mfd/tps6586x.h =A0 =A0 =A0 =A0 =A0 | =A0 15 ++++++++=
++
> =A02 files changed, 61 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/regulator/tps6586x-regulator.c b/drivers/regulat=
or/tps6586x-regulator.c
> index 6d20b04..c6b945d 100644
> --- a/drivers/regulator/tps6586x-regulator.c
> +++ b/drivers/regulator/tps6586x-regulator.c
> @@ -327,6 +327,45 @@ static inline int tps6586x_regulator_preinit(str=
uct device *parent,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 << =
ri->enable_bit[1]);
> =A0}
>
> +static inline int tps6586x_regulator_set_pwm_mode(struct platform_de=
vice *pdev)
> +{
> + =A0 =A0 =A0 struct regulator_init_data *p =3D pdev->dev.platform_da=
ta;
> + =A0 =A0 =A0 struct tps6586x_settings *setting;
> + =A0 =A0 =A0 struct device *parent;
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 uint8_t mask;
> +
> + =A0 =A0 =A0 if (p =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;

You can use if (!p)

> +
> + =A0 =A0 =A0 setting =3D p->driver_data;
> + =A0 =A0 =A0 if (setting =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;

Same here.

> +
> + =A0 =A0 =A0 switch (pdev->id) {
> + =A0 =A0 =A0 case TPS6586X_ID_SM_0:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << SM0_PWM_BIT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case TPS6586X_ID_SM_1:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << SM1_PWM_BIT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case TPS6586X_ID_SM_2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << SM2_PWM_BIT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* not all regulators have PWM/PFM opti=
on */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 parent =3D pdev->dev.parent;

Can parent be NULL?, if it can be then you can check it here.

> + =A0 =A0 =A0 if (setting->sm_pwm_mode =3D=3D PWM_ONLY)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D tps6586x_set_bits(parent, TPS65=
86X_SMODE1, mask);
> + =A0 =A0 =A0 else if (setting->sm_pwm_mode =3D=3D AUTO_PWM_PFM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D tps6586x_clr_bits(parent, TPS65=
86X_SMODE1, mask);
> +

When pwm_mode is not PWM_ONLY or AUTO_PWM_PFM 0 (success) is returned,
is it intended?
Do you wish to add an else assigning ret =3D error_code in such a case?

> + =A0 =A0 =A0 return ret;
> +}
> +
> =A0static inline struct tps6586x_regulator *find_regulator_info(int i=
d)
> =A0{
> =A0 =A0 =A0 =A0struct tps6586x_regulator *ri;
> @@ -367,6 +406,13 @@ static int __devinit tps6586x_regulator_probe(st=
ruct platform_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return PTR_ERR(rdev);
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 err =3D tps6586x_regulator_set_pwm_mode(pdev);
> + =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to set pwm =
mode\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator_unregister(rdev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0platform_set_drvdata(pdev, rdev);
>
> =A0 =A0 =A0 =A0return 0;
> diff --git a/include/linux/mfd/tps6586x.h b/include/linux/mfd/tps6586=
x.h
> index d96fb3d..74e92c0 100644
> --- a/include/linux/mfd/tps6586x.h
> +++ b/include/linux/mfd/tps6586x.h
> @@ -1,6 +1,10 @@
> =A0#ifndef __LINUX_MFD_TPS6586X_H
> =A0#define __LINUX_MFD_TPS6586X_H
>
> +#define SM0_PWM_BIT 0
> +#define SM1_PWM_BIT 1
> +#define SM2_PWM_BIT 2
> +
> =A0enum {
> =A0 =A0 =A0 =A0TPS6586X_ID_SM_0,
> =A0 =A0 =A0 =A0TPS6586X_ID_SM_1,
> @@ -48,6 +52,17 @@ enum {
> =A0 =A0 =A0 =A0TPS6586X_INT_RTC_ALM2,
> =A0};
>
> +enum pwm_pfm_mode {
> + =A0 =A0 =A0 PWM_ONLY,
> + =A0 =A0 =A0 AUTO_PWM_PFM,
> + =A0 =A0 =A0 NOT_CONFIGURABLE
> +};
> +
> +struct tps6586x_settings {
> + =A0 =A0 =A0 /* SM0, SM1 and SM2 have PWM-only and auto PWM/PFM mode=
 */
> + =A0 =A0 =A0 enum pwm_pfm_mode sm_pwm_mode;
> +};
> +
> =A0struct tps6586x_subdev_info {
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 id;
> =A0 =A0 =A0 =A0const char =A0 =A0 =A0*name;
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
