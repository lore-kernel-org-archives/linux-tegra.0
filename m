From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra ASoC, multiple boards, platform data, and conditionals in
 machine driver
Date: Fri, 8 Apr 2011 12:43:37 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Mark Brown (broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org)" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark,

I'm thinking of upstreaming ASoC support for some of the other Tegra boards
that got added later in 2.6.39; Seaboard, Kaen, and Aebl.

[Ventana could also be supported, but it's identical to Harmony. I imagine
people will want Toshiba AC100 and Trimslice support in the not-too-
distant future, but I don't have schematics for those boards at present]

This raises a couple questions:

1)

Currently, the Harmony machine driver gets all its GPIO information from
platform data defined in arch/arch/mach-tegra/include/mach/harmony_audio.h.
Supporting new machines would entail one of:

a) Creating a new header for each new machine (or set of similar machines).
This could mean many headers pretty quickly.

b) Expanding that structure to include extra fields, thus making it generic
enough to support any Tegra machine, which would probably also entail renaming
the file to not be Harmony-specific. Some GPIO fields would be optional (i.e.
initialized to -1) if a feature wasn't available on a given board.

c) Perhaps switch to using platform_get_resource() to retrieve the data rather
than custom per-machine/SoC structures, although that'd require adding new
resource types for GPIOs etc.

That said, I noticed that all(?) the other machine drivers simply use
hard-coded GPIO numbers (sometimes defined locally, probably sometimes from
machine header files), rather than having the values passed in through
platform_data. This eliminates the need for platform_data structures etc.
Is this simply a legacy because ASoC machine drivers weren't able to be
first-class platform_devices, or is this still an acceptable style?

I'm tempted to convert the Tegra Harmony driver to this style (but including
headers to define the GPIO names instead of duplicating definitions in the
machine file), and also use it for new machines.

2)

Seaboard has a couple of derivatives which are very similar, but do have
some differences in the audio path and elsewhere. In the ChromeOS kernel,
we have a single ASoC machine driver covering Seaboard and two derivatives,
with conditional code. I've placed an example at the end of this mail. Do
you have a preference for having separate files for each machine without the
conditional code v.s. a single machine driver with a lot of conditional code?
If we go the conditional route, it might even be possible to merge the
Harmony and Seaboard machine drivers into one.

Thanks for any feedback.

Example from static int seaboard_asoc_init():

	ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
	if (ret) {
		dev_err(card->dev, "cannot get spkr_en gpio\n");
		return ret;
	}
	seaboard->gpio_requested |= GPIO_SPKR_EN;

	gpio_direction_output(pdata->gpio_spkr_en, 0);

	if (pdata->gpio_hp_mute != -1) {
		ret = gpio_request(pdata->gpio_hp_mute, "hp_mute");
		if (ret) {
			dev_err(card->dev, "cannot get hp_mute gpio\n");
			return ret;
		}
		seaboard->gpio_requested |= GPIO_HP_MUTE;

		gpio_direction_output(pdata->gpio_hp_mute, 0);
	}
...
	if (machine_is_seaboard()) {
		snd_soc_dapm_add_routes(dapm, seaboard_audio_map,
					ARRAY_SIZE(seaboard_audio_map));
	} else if (machine_is_kaen()) {
		snd_soc_dapm_add_routes(dapm, kaen_audio_map,
					ARRAY_SIZE(kaen_audio_map));
	} else {
		snd_soc_dapm_add_routes(dapm, aebl_audio_map,
					ARRAY_SIZE(aebl_audio_map));
	}
...
	snd_soc_dapm_nc_pin(dapm, "IN1L");
	if (machine_is_kaen())
		snd_soc_dapm_nc_pin(dapm, "IN1R");
	snd_soc_dapm_nc_pin(dapm, "IN2L");
	if (!machine_is_kaen())
		snd_soc_dapm_nc_pin(dapm, "IN2R");
	snd_soc_dapm_nc_pin(dapm, "IN2L");
	snd_soc_dapm_nc_pin(dapm, "IN3R");
	snd_soc_dapm_nc_pin(dapm, "IN3L");

	if (machine_is_aebl()) {
		snd_soc_dapm_nc_pin(dapm, "LON");
		snd_soc_dapm_nc_pin(dapm, "RON");
		snd_soc_dapm_nc_pin(dapm, "ROP");
		snd_soc_dapm_nc_pin(dapm, "LOP");
	} else {
		snd_soc_dapm_nc_pin(dapm, "LINEOUTR");
		snd_soc_dapm_nc_pin(dapm, "LINEOUTL");
	}

-- 
nvpublic
