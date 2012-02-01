From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [PATCH 4/5] ASoC: dt: tegra: Enable headset autodetection on
 PAZ00 board.
Date: Wed, 1 Feb 2012 08:46:34 +0200
Message-ID: <CALq1K=K0YpBBeDLUoO8VqOoqN5=W-EaYZPr=7g5CfF8_OHLCMQ@mail.gmail.com>
References: <1327995093-27196-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327995093-27196-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 09:31, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org> wrote:
> This patch is adding support of headset autodetection on PAZ00 board.
>
> Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
> ---
> =C2=A0arch/arm/boot/dts/tegra-paz00.dts | =C2=A0 =C2=A01 +
> =C2=A0sound/soc/tegra/tegra_alc5632.c =C2=A0 | =C2=A0 39 ++++++++++++=
+++++++++++++++++++++---
> =C2=A02 files changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/te=
gra-paz00.dts
> index e6809b7..fa9dd9e 100644
> --- a/arch/arm/boot/dts/tegra-paz00.dts
> +++ b/arch/arm/boot/dts/tegra-paz00.dts
> @@ -64,6 +64,7 @@
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvidia,audio-c=
odec =3D <&alc5632>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvidia,i2s-con=
troller =3D <&tegra_i2s1>;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvidia,hp-det-gpio=
s =3D <&gpio 178 0>; /* gpio PW2 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0};
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0serial@70006000 {
> diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_=
alc5632.c
> index c0ba1e4..1794139 100644
> --- a/sound/soc/tegra/tegra_alc5632.c
> +++ b/sound/soc/tegra/tegra_alc5632.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
>
> =C2=A0#include <sound/core.h>
> =C2=A0#include <sound/jack.h>
> @@ -34,9 +35,13 @@
>
> =C2=A0#define DRV_NAME "tegra-alc5632"
>
> +#define GPIO_HP_DET =C2=A0 =C2=A0 BIT(0)
> +
> =C2=A0struct tegra_alc5632 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct tegra_asoc_utils_data util_data;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pcm_dev;
> + =C2=A0 =C2=A0 =C2=A0 int gpio_requested;
> + =C2=A0 =C2=A0 =C2=A0 int gpio_hp_det;
> =C2=A0};
>
> =C2=A0static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substrea=
m *substream,
> @@ -86,6 +91,13 @@ static struct snd_soc_jack_pin tegra_alc5632_hs_ja=
ck_pins[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> +static struct snd_soc_jack_gpio tegra_alc5632_hp_jack_gpio =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =3D "Headset detection",
> + =C2=A0 =C2=A0 =C2=A0 .report =3D SND_JACK_HEADSET,
> + =C2=A0 =C2=A0 =C2=A0 .debounce_time =3D 150,
> + =C2=A0 =C2=A0 =C2=A0 .invert =3D 1,
> +};
> +
> =C2=A0static const struct snd_soc_dapm_widget tegra_alc5632_dapm_widg=
ets[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SND_SOC_DAPM_SPK("Int Spk", NULL),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SND_SOC_DAPM_HP("Headset Stereophone", NUL=
L),
> @@ -114,6 +126,9 @@ static int tegra_alc5632_asoc_init(struct snd_soc=
_pcm_runtime *rtd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_codec *codec =3D rtd->codec=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_dapm_context *dapm =3D &cod=
ec->dapm;
> + =C2=A0 =C2=A0 =C2=A0 struct device_node *np =3D codec->card->dev->o=
f_node;
> + =C2=A0 =C2=A0 =C2=A0 struct tegra_alc5632 *machine =3D snd_soc_card=
_get_drvdata(codec->card);
> + =C2=A0 =C2=A0 =C2=A0 int ret;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_jack_new(codec, "Headset Jack", SN=
D_JACK_HEADSET,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &tegra_alc5632_hs_jack);
> @@ -121,6 +136,16 @@ static int tegra_alc5632_asoc_init(struct snd_so=
c_pcm_runtime *rtd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ARRAY_SIZE(tegra_alc5632_hs_jack_pins),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tegra_alc5632_hs_jack_pins);
>
> + =C2=A0 =C2=A0 =C2=A0 machine->gpio_hp_det =3D of_get_named_gpio(np,=
 "nvidia,hp-det-gpios", 0);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (gpio_is_valid(machine->gpio_hp_det)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tegra_alc5632_hp_j=
ack_gpio.gpio =3D machine->gpio_hp_det;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snd_soc_jack_add_g=
pios(&tegra_alc5632_hs_jack,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &tegra_alc5632_hp_jack_gpio);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 machine->gpio_requ=
ested |=3D GPIO_HP_DET;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_force_enable_pin(dapm, "MICBI=
AS1");
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> @@ -239,13 +264,19 @@ err:
> =C2=A0static int __devexit tegra_alc5632_remove(struct platform_devic=
e *pdev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_card *card =3D platform_get=
_drvdata(pdev);
> - =C2=A0 =C2=A0 =C2=A0 struct tegra_alc5632 *alc5632 =3D snd_soc_card=
_get_drvdata(card);
> + =C2=A0 =C2=A0 =C2=A0 struct tegra_alc5632 *machine =3D snd_soc_card=
_get_drvdata(card);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (machine->gpio_requested & GPIO_HP_DET)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snd_soc_jack_free_=
gpios(&tegra_alc5632_hs_jack,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &tegra_=
alc5632_hp_jack_gpio);
> + =C2=A0 =C2=A0 =C2=A0 machine->gpio_requested =3D 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_unregister_card(card);
>
> - =C2=A0 =C2=A0 =C2=A0 tegra_asoc_utils_fini(&alc5632->util_data);
> - =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR(alc5632->pcm_dev))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_device_un=
register(alc5632->pcm_dev);
> + =C2=A0 =C2=A0 =C2=A0 tegra_asoc_utils_fini(&machine->util_data);
> + =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR(machine->pcm_dev))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_device_un=
register(machine->pcm_dev);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> --
> 1.7.3.4
>


Please don't apply this patch, I'm going to resend it after I split it
into 2 patches.

--=20
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
