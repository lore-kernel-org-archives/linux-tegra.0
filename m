From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
 card from the device tree.
Date: Wed, 1 Jun 2011 15:07:18 +0800
Message-ID: <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205706.21000.34832.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110527205706.21000.34832.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2011/5/28 John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
> This patch makes it so the top level audio card is initialized from t=
he device
> tree. This is just the first step getting the audio complex of device=
s
> iniialized from device tree nodes.
>
> Signed-off-by: John Bonesio<bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>
> =C2=A0arch/arm/boot/dts/tegra-harmony.dts | =C2=A0 =C2=A04 +++
> =C2=A0arch/arm/mach-tegra/board-dt.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A03 ++
> =C2=A0sound/soc/tegra/harmony.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 45 ++++++++++++++++++++++++++++++++---
> =C2=A03 files changed, 48 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/=
tegra-harmony.dts
> index 05521a5..217a7f0 100644
> --- a/arch/arm/boot/dts/tegra-harmony.dts
> +++ b/arch/arm/boot/dts/tegra-harmony.dts
> @@ -53,6 +53,10 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequenc=
y =3D <400000>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0};
>
> + =C2=A0 =C2=A0 =C2=A0 harmony_audio: audio_card {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "nv=
idia,harmony-audio";
> + =C2=A0 =C2=A0 =C2=A0 };
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0serial@70006300 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "ok=
";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequenc=
y =3D < 216000000 >;
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/boa=
rd-dt.c
> index c498e84..a569ad9 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -56,6 +56,9 @@ static struct platform_device *tegra250_devices[] _=
_initdata =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&tegra_i2c_device2,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&tegra_i2c_device3,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&tegra_i2c_device4,
> + =C2=A0 =C2=A0 =C2=A0 &tegra_i2s_device1,
> + =C2=A0 =C2=A0 =C2=A0 &tegra_das_device,
> + =C2=A0 =C2=A0 =C2=A0 &tegra_pcm_device,

i am thinking whether platform_device should be created by
of_platform_device_create after scanning device tree, but not by
hard-code? looks like the two patches are only trying to let device
tree deliver gpio to drivers?

> =C2=A0};
>
> =C2=A0static __initdata struct tegra_clk_init_table tegra_dt_clk_init=
_table[] =3D {
> diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
> index f225087..faeec14 100644
> --- a/sound/soc/tegra/harmony.c
> +++ b/sound/soc/tegra/harmony.c
> @@ -52,6 +52,18 @@
>
> =C2=A0#define DRV_NAME "tegra-snd-harmony"
>
> +/* temporary - info will go into device tree */
> +#define TEGRA_GPIO_PW2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0178
> +#define TEGRA_GPIO_PX0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0184
> +#define TEGRA_GPIO_PX1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0185
> +
> +#define HARMONY_GPIO_WM8903(_x_) =C2=A0 =C2=A0 =C2=A0 (TEGRA_NR_GPIO=
S + (_x_))
> +#define TEGRA_GPIO_SPKR_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 HARMONY_GPIO_WM8903(2)
> +#define TEGRA_GPIO_HP_DET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0TEGRA_GPIO_PW2
> +#define TEGRA_GPIO_INT_MIC_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEGR=
A_GPIO_PX0
> +#define TEGRA_GPIO_EXT_MIC_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEGR=
A_GPIO_PX1
> +/* end temporary */
> +
> =C2=A0#define GPIO_SPKR_EN =C2=A0 =C2=A0BIT(0)
> =C2=A0#define GPIO_INT_MIC_EN BIT(1)
> =C2=A0#define GPIO_EXT_MIC_EN BIT(2)
> @@ -287,6 +299,14 @@ static struct snd_soc_card snd_soc_harmony =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_links =3D 1,
> =C2=A0};
>
> +/* temporary - put this into the device tree */
> +static struct harmony_audio_platform_data harmony_audio_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .gpio_spkr_en =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D TEGRA_GPIO_SPKR_EN,
> + =C2=A0 =C2=A0 =C2=A0 .gpio_hp_det =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D TEGRA_GPIO_HP_DET,
> + =C2=A0 =C2=A0 =C2=A0 .gpio_int_mic_en =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 TEGRA_GPIO_INT_MIC_EN,
> + =C2=A0 =C2=A0 =C2=A0 .gpio_ext_mic_en =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 TEGRA_GPIO_EXT_MIC_EN,
> +};
> +
> =C2=A0static __devinit int tegra_snd_harmony_probe(struct platform_de=
vice *pdev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_card *card =3D &snd_soc_har=
mony;
> @@ -307,10 +327,15 @@ static __devinit int tegra_snd_harmony_probe(st=
ruct platform_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0#endif
>
> - =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->dev.platform_data;
> - =C2=A0 =C2=A0 =C2=A0 if (!pdata) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "no platform data supplied\n");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 if (pdev->dev.of_node) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev->dev.platform=
_data =3D &harmony_audio_pdata; /* temporary */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->de=
v.platform_data;
> + =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->de=
v.platform_data;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pdata) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dev_err(&pdev->dev, "no platform data supplied\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0harmony =3D kzalloc(sizeof(struct tegra_ha=
rmony), GFP_KERNEL);
> @@ -374,11 +399,23 @@ static int __devexit tegra_snd_harmony_remove(s=
truct platform_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> +#if defined(CONFIG_OF)
> +/* Match table for of_platform binding */
> +static const struct of_device_id harmony_of_match[] __devinitconst =3D=
 {
> + =C2=A0 =C2=A0 =C2=A0 { .compatible =3D "nvidia,harmony-audio", },
> + =C2=A0 =C2=A0 =C2=A0 {},
> +};
> +MODULE_DEVICE_TABLE(of, harmony_of_match);
> +#endif
> +
> =C2=A0static struct platform_driver tegra_snd_harmony_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D DRV_=
NAME,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THI=
S_MODULE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &snd_s=
oc_pm_ops,
> +#if defined(CONFIG_OF)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 harmony_of_match,
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D tegra_snd_harmony_probe,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D __devexit_p(tegra_snd_harmony_=
remove),
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
