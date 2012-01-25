From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3] ARM: dt: tegra: Enable device tree audio on PAZ00
 board.
Date: Wed, 25 Jan 2012 14:21:19 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB821B2@HQMAIL01.nvidia.com>
References: <1327517363-29698-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327517363-29698-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org" <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Leon Romanovsky wrote at Wednesday, January 25, 2012 11:49 AM:
> This patch adds initial device tree support of ALC5632 sound codec and
> machine driver for PAZ00 board. The implementation is based on the WM8903 codec.

>  .../devicetree/bindings/sound/alc5632.txt          |   24 ++++++
>  .../bindings/sound/tegra-audio-alc5632.txt         |   55 ++++++++++++++
>  arch/arm/boot/dts/tegra-paz00.dts                  |   29 ++++++--
>  sound/soc/tegra/tegra_alc5632.c                    |   78 ++++++++++++++++++--

I worry this patch does a little too much at once; perhaps it should be
split up a little?


> diff --git a/Documentation/devicetree/bindings/sound/alc5632.txt
...
> +Required properties:
> +
> +  - compatible : "realtek,alc5632"

You should update Documentation/devicetree/bindings/vendor-prefixes.txt
too. Separately from this patch is probably fine.

> diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
> b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
> new file mode 100644
> index 0000000..315213f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
> @@ -0,0 +1,55 @@
> +NVIDIA Tegra audio complex
> +
> +Required properties:
> +- compatible : "nvidia,tegra-audio-alc5632"
> +- nvidia,model : The user-visible name of this sound complex.
> +- nvidia,audio-routing : A list of the connections between audio components.
> +  Each entry is a pair of strings, the first being the connection's sink,
> +  the second being the connection's source. Valid names for sources and
> +  sinks are the ALC5632's pins:
> +
> +  ALC5632 pins:
> +
> +  * SPKOUT
> +  * SPKOUTN
> +  * HPL
> +  * HPR
> +  * AUXOUT

My copy of the ALC5632 datasheet indicates there are both AUX_OUT_P and
AUX_OUTN pins. Are they always used together such that it makes sense to
group them together in the device tree binding?

> +  * LINEINL
> +  * LINEINR
> +  * PHONEP
> +  * PHONEP

PHONEN

> +  * MIC1
> +  * MIC2

Same as above; the datasheet lists MIC1_P, MIC1_N, MIC2_P, MIC2_N.

> +  * MICBIAS1
> +  * MICBIAS2

I only see MICBIAS1 in the datasheet, not MICBIAS2.

> +
> +  Board connectors:
> +
> +  * Headset Stereophone
> +  * Int Spk
> +  * MIC1
> +  * MICBIAS1

Those last two are codec pins, not board connectors.

Don't you need "Headset Mic" in the list too?

...
> +	nvidia,audio-routing =
> +				"Int Spk", "SPKOUT",
> +				"Int Spk", "SPKOUTN",
> +				"MIC1", "MICBIAS1",
> +				"MICBIAS1", "Headset Mic",

I think those last two lines should read:

				"Headset Mic", "MICBIAS1",
				"MIC1", " Headset Mic",

The DAPM route table in the driver probably needs updating to say the
same thing too.

(all the comments on the example above apply to the copy in the .dts
file too)

...
> diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts

> +	sound {
> +		compatible = "nvidia,tegra-audio-alc5632-paz00",
> +		"nvidia,tegra-audio-alc5632";

That last line needs some extra indent.

> diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c

> @@ -163,26 +164,80 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
...
> +	alc5632->pcm_dev = ERR_PTR(-EINVAL);
> +
> +	if (!(pdev->dev.of_node)) {
> +		dev_err(&pdev->dev, "No platform data supplied\n");

I think I'd phrase that more like "Must be instantiated using device tree".

> +	tegra_alc5632_dai.codec_name = NULL;

Given you're only supporting instantiation using device tree now, why
not just not initialize that field, and remove that assignment?

> +	tegra_alc5632_dai.codec_of_node = of_parse_phandle(
> +	pdev->dev.of_node, "nvidia,audio-codec", 0);

Indent that last line a bit more.

> +	tegra_alc5632_dai.cpu_dai_name = NULL;

Same comment; you can remove that.

> +	tegra_alc5632_dai.cpu_dai_of_node = of_parse_phandle(
> +	pdev->dev.of_node, "nvidia,i2s-controller", 0);

Indent that last line a bit more.

Overall, this looks like the same structure as the Tegra+WM8903 bindings,
so it works for me.

-- 
nvpublic
