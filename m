From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=207/7=5D=20ASoC=3A=20tegra=3A=20add=20machine=20driver=20using=20wm9712=20codec?=
Date: Thu, 20 Dec 2012 00:17:36 +0100
Message-ID: <1355959056-6009-7-git-send-email-dev@lynxeye.de>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355959056-6009-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds a simple machine driver using the Wolfson wm9712 AC97
codec.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra-audio-wm9712.txt   |  53 +++++++
 sound/soc/tegra/Kconfig                            |  10 ++
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_wm9712.c                     | 167 +++++++++++++=
++++++++
 4 Dateien ge=C3=A4ndert, 232 Zeilen hinzugef=C3=BCgt(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegr=
a-audio-wm9712.txt
 create mode 100644 sound/soc/tegra/tegra_wm9712.c

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio=
-wm9712.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audi=
o-wm9712.txt
new file mode 100644
index 0000000..72bd589
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712=
=2Etxt
@@ -0,0 +1,53 @@
+NVIDIA Tegra audio complex
+
+Required properties:
+- compatible : "nvidia,tegra-audio-wm9712"
+- nvidia,model : The user-visible name of this sound complex.
+- nvidia,audio-routing : A list of the connections between audio compo=
nents.
+  Each entry is a pair of strings, the first being the connection's si=
nk,
+  the second being the connection's source. Valid names for sources an=
d
+  sinks are the WM9712's pins, and the jacks on the board:
+
+  WM9712 pins:
+
+  * MONOOUT
+  * HPOUTL
+  * HPOUTR
+  * LOUT2
+  * ROUT2
+  * OUT3
+  * LINEINL
+  * LINEINR
+  * PHONE
+  * PCBEEP
+  * MIC1
+  * MIC2
+  * Mic Bias
+
+  Board connectors:
+
+  * Headphone
+  * LineIn
+  * Mic
+
+- nvidia,ac97-controller : The phandle of the Tegra AC97 controller
+- nvidia,audio-codec : The phandle of the WM9712 audio codec
+
+
+Example:
+
+sound {
+	compatible =3D "nvidia,tegra-audio-wm9712-colibri_t20",
+		         "nvidia,tegra-audio-wm9712";
+	nvidia,model =3D "Toradex Colibri T20";
+
+	nvidia,audio-routing =3D
+		"Headphone", "HPOUTL",
+		"Headphone", "HPOUTR",
+		"LineIn", "LINEINL",
+		"LineIn", "LINEINR",
+		"Mic", "MIC1";
+
+	nvidia,ac97-controller =3D <&ac97>;
+	nvidia,audio-codec =3D <&wm9712>;
+};
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 763c68d..0d62025 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -78,6 +78,16 @@ config SND_SOC_TEGRA_WM8903
 	  boards using the WM8093 codec. Currently, the supported boards are
 	  Harmony, Ventana, Seaboard, Kaen, and Aebl.
=20
+config SND_SOC_TEGRA_WM9712
+	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
+	depends on SND_SOC_TEGRA
+	select SND_SOC_TEGRA20_AC97 if ARCH_TEGRA_2x_SOC
+	select SND_SOC_AC97_BUS
+	select SND_SOC_WM9712
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the WM9712 (or compatible) codec.
+
 config SND_SOC_TEGRA_TRIMSLICE
 	tristate "SoC Audio support for TrimSlice board"
 	depends on SND_SOC_TEGRA && I2C
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 02513d9..416a14b 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -20,10 +20,12 @@ obj-$(CONFIG_SND_SOC_TEGRA30_I2S) +=3D snd-soc-tegr=
a30-i2s.o
 # Tegra machine Support
 snd-soc-tegra-wm8753-objs :=3D tegra_wm8753.o
 snd-soc-tegra-wm8903-objs :=3D tegra_wm8903.o
+snd-soc-tegra-wm9712-objs :=3D tegra_wm9712.o
 snd-soc-tegra-trimslice-objs :=3D trimslice.o
 snd-soc-tegra-alc5632-objs :=3D tegra_alc5632.o
=20
 obj-$(CONFIG_SND_SOC_TEGRA_WM8753) +=3D snd-soc-tegra-wm8753.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) +=3D snd-soc-tegra-wm8903.o
+obj-$(CONFIG_SND_SOC_TEGRA_WM9712) +=3D snd-soc-tegra-wm9712.o
 obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) +=3D snd-soc-tegra-trimslice.o
 obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) +=3D snd-soc-tegra-alc5632.o
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9=
712.c
new file mode 100644
index 0000000..2e9b588
--- /dev/null
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -0,0 +1,167 @@
+/*
+ * tegra20_wm9712.c - Tegra machine ASoC driver for boards using WM971=
2 codec.
+ *
+ * Copyright 2012 Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
+ *
+ * Partly based on code copyright/by:
+ * Copyright 2011,2012 Toradex Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#define DRV_NAME "tegra-snd-wm9712"
+
+static const struct snd_soc_dapm_widget tegra_wm9712_dapm_widgets[] =3D=
 {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_LINE("LineIn", NULL),
+	SND_SOC_DAPM_MIC("Mic", NULL),
+};
+
+static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai =3D rtd->codec_dai;
+	struct snd_soc_codec *codec =3D codec_dai->codec;
+	struct snd_soc_dapm_context *dapm =3D &codec->dapm;
+	int err;
+
+	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
+
+	err =3D snd_soc_dapm_sync(dapm);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra_wm9712_remove(struct snd_soc_card *card)
+{
+	return 0;
+}
+
+static struct snd_soc_dai_link tegra_wm9712_dai =3D {
+	.name =3D "AC97 HiFi",
+	.stream_name =3D "AC97 HiFi",
+	.cpu_dai_name =3D "tegra-ac97-pcm",
+	.codec_dai_name =3D "wm9712-hifi",
+	.init =3D tegra_wm9712_init,
+};
+
+static struct snd_soc_card snd_soc_tegra_wm9712 =3D {
+	.name =3D "tegra-wm9712",
+	.owner =3D THIS_MODULE,
+	.dai_link =3D &tegra_wm9712_dai,
+	.num_links =3D 1,
+
+	.remove =3D tegra_wm9712_remove,
+
+	.dapm_widgets =3D tegra_wm9712_dapm_widgets,
+	.num_dapm_widgets =3D ARRAY_SIZE(tegra_wm9712_dapm_widgets),
+	.fully_routed =3D true,
+};
+
+static int tegra_wm9712_driver_probe(struct platform_device *pdev)
+{
+	struct device_node *np =3D pdev->dev.of_node;
+	struct snd_soc_card *card =3D &snd_soc_tegra_wm9712;
+	int ret;
+
+	if (!pdev->dev.of_node) {
+		dev_err(&pdev->dev, "No platform data supplied\n");
+		return -EINVAL;
+	}
+
+	card->dev =3D &pdev->dev;
+	platform_set_drvdata(pdev, card);
+
+	ret =3D snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		goto err;
+
+	ret =3D snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		goto err;
+
+	tegra_wm9712_dai.codec_of_node =3D of_parse_phandle(np,
+					 "nvidia,audio-codec", 0);
+	if (!tegra_wm9712_dai.codec_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		ret =3D -EINVAL;
+		goto err;
+	}
+
+	tegra_wm9712_dai.cpu_of_node =3D of_parse_phandle(np,
+				       "nvidia,ac97-controller", 0);
+	if (!tegra_wm9712_dai.cpu_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,ac97-controller' missing or invalid\n");
+		ret =3D -EINVAL;
+		goto err;
+	}
+
+	tegra_wm9712_dai.platform_of_node =3D tegra_wm9712_dai.cpu_of_node;
+
+	ret =3D snd_soc_register_card(card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
+			ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static int tegra_wm9712_driver_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card =3D platform_get_drvdata(pdev);
+
+	snd_soc_unregister_card(card);
+
+	return 0;
+}
+
+static const struct of_device_id tegra_wm9712_of_match[] __devinitcons=
t =3D {
+	{ .compatible =3D "nvidia,tegra-audio-wm9712", },
+	{},
+};
+
+static struct platform_driver tegra_wm9712_driver =3D {
+	.driver =3D {
+		.name =3D DRV_NAME,
+		.owner =3D THIS_MODULE,
+		.pm =3D &snd_soc_pm_ops,
+		.of_match_table =3D tegra_wm9712_of_match,
+	},
+	.probe =3D tegra_wm9712_driver_probe,
+	.remove =3D tegra_wm9712_driver_remove,
+};
+module_platform_driver(tegra_wm9712_driver);
+
+MODULE_AUTHOR("Lucas Stach");
+MODULE_DESCRIPTION("Tegra+WM9712 machine ASoC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_wm9712_of_match);
--=20
1.7.11.7
