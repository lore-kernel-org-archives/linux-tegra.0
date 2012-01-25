From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] ASoC: dt: tegra: Enable headphone autodetection on
 PAZ00 board.
Date: Wed, 25 Jan 2012 14:31:06 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB821BE@HQMAIL01.nvidia.com>
References: <1327517477-29785-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327517477-29785-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Leon Romanovsky wrote at Wednesday, January 25, 2012 11:51 AM:
> This patch is adding support of headphone autodetection on PAZ00 board.

> diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
> +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */

That isn't documented in the binding documentation. You may as well
just document the whole thing and add this to the .dts file in one patch
even if the feature isn't implemented yet in that patch.

> diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c

> +#define GPIO_HP_DET     BIT(1)
> +
> +

Why two extra blank lines?

> +static struct snd_soc_jack_gpio tegra_alc5632_hp_jack_gpio = {
> +	.name = "Headphone detect",
> +	.report = SND_JACK_HEADPHONE,

I think that should be HEADSET not HEADPHONE, since it's a combo socket
for both headphones and a mic isn't it? (so perhaps the name should also
be "Headset detection"?

> -	struct tegra_alc5632 *alc5632 = snd_soc_card_get_drvdata(card);
> +	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(card);

I guess that's fine, but it makes the patch a little noisy and somewhat
obscures the real change. I guess it's useful to be consistent with
tegra_wm8903.c though.

-- 
nvpublic
