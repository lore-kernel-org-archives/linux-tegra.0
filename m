From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8] mfd: tps6586x: add RTC driver for TI TPS6586x
Date: Fri, 25 Mar 2011 18:40:49 +0800
Message-ID: <6B4D417B830BC44B8026029FD256F7F1C2CB3DD492@HKMAIL01.nvidia.com>
References: <1300686161-24712-1-git-send-email-wni@nvidia.com>
 <6B4D417B830BC44B8026029FD256F7F1C2CB3DD48E@HKMAIL01.nvidia.com>
 <AANLkTi=rsJvPVxs_Z4jGhTbn9kN-HBEc7mj2WmhxX8ZL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=rsJvPVxs_Z4jGhTbn9kN-HBEc7mj2WmhxX8ZL-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Mayuresh Janorkar' <mayureshjanorkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I checked all drivers under drivers/rtc/
It seems they all only call the enable_irq_wake/disable_irq_wake simply=
 in suspend/reume callback.
Does we really need to check the return value?
If need, I think it's just to print the warnings when return error. Is =
it right?

Thanks
Wei.

-----Original Message-----
=46rom: Mayuresh Janorkar [mailto:mayureshjanorkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]=20
Sent: Friday, March 25, 2011 6:00 PM
To: Wei Ni
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org; rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org; linux-tegra@vger.=
kernel.org
Subject: Re: [PATCH v8] mfd: tps6586x: add RTC driver for TI TPS6586x

On Fri, Mar 25, 2011 at 3:16 PM, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi, all
> Could anyone review this patch?
>
> Thanks
> Wei.
>
> -----Original Message-----
> From: Wei Ni
> Sent: Monday, March 21, 2011 1:43 PM
> To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org; rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Wei Ni
> Subject: [PATCH v8] mfd: tps6586x: add RTC driver for TI TPS6586x
>
> From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> this driver supports setting of alarms, and
> reading/setting of time
>
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v8: use OSC_SRC_SEL to select external crystal clock.
> set alrm->enabled and init the rtc->irq_en.
> Add suspend/resume callback.
>
> =A0drivers/rtc/rtc-tps6586x.c | =A0 34 ++++++++++++++++++++++++++++++=
----
> =A01 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
> index a42b4bb..b891899 100644
> --- a/drivers/rtc/rtc-tps6586x.c
> +++ b/drivers/rtc/rtc-tps6586x.c
> @@ -30,6 +30,7 @@
> =A0#include <linux/slab.h>
>
> =A0#define RTC_CTRL =A0 =A0 =A0 0xc0
> +#define OSC_SRC_SEL =A0 =A0BIT(6) =A0/* select internal or external =
clock */
> =A0#define RTC_ENABLE =A0 =A0 BIT(5) =A0/* enables alarm */
> =A0#define RTC_HIRES =A0 =A0 =A0BIT(4) =A0/* 1Khz or 32Khz updates */
> =A0#define RTC_ALARM1_HI =A00xc1
> @@ -180,6 +181,7 @@ static int tps6586x_rtc_read_alarm(struct device =
*dev, struct rtc_wkalrm *alrm)
> =A0 =A0 =A0 =A0seconds +=3D rtc->epoch_start;
>
> =A0 =A0 =A0 =A0rtc_time_to_tm(seconds, &alrm->time);
> + =A0 =A0 =A0 alrm->enabled =3D rtc->irq_en;
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -286,7 +288,9 @@ static int __devinit tps6586x_rtc_probe(struct pl=
atform_device *pdev)
>
> =A0 =A0 =A0 =A0/* disable high-res mode, enable tick counting */
> =A0 =A0 =A0 =A0err =3D tps6586x_update(tps_dev, RTC_CTRL,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (RTC_ENABLE=
 | RTC_HIRES), RTC_ENABLE);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (RTC_ENABLE=
 | OSC_SRC_SEL),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (RTC_ENABLE=
 | OSC_SRC_SEL));
> +
> =A0 =A0 =A0 =A0if (err < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "unable to start c=
ounter\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail;
> @@ -299,11 +303,12 @@ static int __devinit tps6586x_rtc_probe(struct =
platform_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 IRQF_ONESHOT, "tps6586x-rtc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 &pdev->dev);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(&pdev->dev, "u=
nable to request IRQ(%d)\n", rtc->irq);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(&pdev->dev, "u=
nable to request IRQ(%d)\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rtc-=
>irq);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rtc->irq =3D -1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0disable_irq(rtc->irq);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enable_irq_wake(rtc->ir=
q);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc->irq_en =3D false;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> @@ -327,6 +332,25 @@ static int __devexit tps6586x_rtc_remove(struct =
platform_device *pdev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +static int tps6586x_rtc_suspend(struct platform_device *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_mess=
age_t state)
> +{
> + =A0 =A0 =A0 struct tps6586x_rtc *rtc =3D dev_get_drvdata(&pdev->dev=
);
> +
> + =A0 =A0 =A0 if (device_may_wakeup(pdev))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 enable_irq_wake(rtc->irq);

enable_irq_wake would return an error/ success.
It is a good idea to check that.

> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int tps6586x_rtc_resume(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct tps6586x_rtc *rtc =3D dev_get_drvdata(&pdev->dev=
);
> +
> + =A0 =A0 =A0 if (device_may_wakeup(pdev))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 disable_irq_wake(rtc->irq);
> + =A0 =A0 =A0 return 0;
> +}
> +
> =A0static struct platform_driver tps6586x_rtc_driver =3D {
> =A0 =A0 =A0 =A0.driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "tps6586x-rtc",
> @@ -334,6 +358,8 @@ static struct platform_driver tps6586x_rtc_driver=
 =3D {
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.probe =A0=3D tps6586x_rtc_probe,
> =A0 =A0 =A0 =A0.remove =3D __devexit_p(tps6586x_rtc_remove),
> + =A0 =A0 =A0 .suspend =3D tps6586x_rtc_suspend,
> + =A0 =A0 =A0 .resume =3D tps6586x_rtc_resume,
> =A0};
>
> =A0static int __init tps6586x_rtc_init(void)
> @@ -351,4 +377,4 @@ module_exit(tps6586x_rtc_exit);
> =A0MODULE_DESCRIPTION("TI TPS6586x RTC driver");
> =A0MODULE_AUTHOR("NVIDIA Corporation");
> =A0MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:rtc-tps6586x")
> +MODULE_ALIAS("platform:rtc-tps6586x");
> --
> 1.7.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
