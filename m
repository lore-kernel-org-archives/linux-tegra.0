Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26B1347BC9
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 06:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829468; cv=none; b=qy4GB/CfUogBCFIrQRSm7lNI4iU5gkl0bFgx5ju7MNHdac+pB81/L2EhG6BCAupXtAGX9+Xz1/ESwROKywcd6QXJQZMbmJBMeoP9EWDGCitqxgBwFHJsoED6dkMWg9qAoG7xEhnSq2Jo2kSJXd9tuep9K/wWJ+qLYpysDljLM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829468; c=relaxed/simple;
	bh=yQseu6gM2haEIm/ayUoG3639fNPMyxWFXUHZI+hw/MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQTPIIvo0UlFM+U0aMNpSwhnnaz6KhTicKIf7iq00mXPA7kLmkWlmeVuca2HI2viVCwnfzM14T+K7BzoNc7/taACsuCRtUoasr8UhGmHjhqI4+fn867a2ouAcXboqXpQTClb0W6IFZyZOQmpdsXs9p8/kF796T4hWC8qVQ57OLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4NLqrtP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4NLqrtP"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e699310a8so4762683e87.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 22:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771829465; x=1772434265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htXBvNPgxXNOHZBCLFJRJ5Aq3ZtCWpOxvSqLp1RXyrk=;
        b=I4NLqrtPHh+gW6u5qIrPsHNzjyQWwfyP16vOKgmm01EACoIygnFeinBzIQcvahnX/s
         zuy+6G/C6T/ELNl5jnZoU+RqPXcd0qymeB6GhUDdgLh6TmlwdeVFmtJ2Pz+UblRAq9r4
         ZTB3HbaCAIu8ycEnneljBBFVCmmeY+kqlcpj6lamNBcTE8aSYgyjgwpNuoGuYQWjFWs7
         yPz3IT9AJprs5GiHAOkm8/oxZfo9kCVURt4ZlQZlpowBbvllgFUsZwixH3W2ACOpBWDx
         H741DrlmP1m6/HCCK5SSj9LGU+6US0RYf4WS/hNsziiEeZ0vxvZ9BwnzQT8e2moaFAMX
         YtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829465; x=1772434265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htXBvNPgxXNOHZBCLFJRJ5Aq3ZtCWpOxvSqLp1RXyrk=;
        b=UhYMgj9xQdt0OPcDLdwZRDbuWGpYBbDKBzUaBmAV65ARU9HDf2nHtzy/b1MnoJL868
         b00OJP/xp+ame2YW0m8oM8UtdsFOLRD9tZi3Y4s7/4V5rxSm5C8q9pObuktcGaDYS89p
         RqTMksDIdeGup3Cnca8CpK67t2n+l400aYTNqCc1PkmuhplEjubSUPjuJ1QPzqupRBgl
         h8mEdOH1PV2XyFO2LDIUEMDqBM5KeLjJx6DE4KajGmDi4OPWj7IE0DuYWtBzQuR+uZ19
         XdqUixcchKcVW1XyY518hZwOcQsuY46dh11GOtwaY4/h9zIIdLlHKGopXn1/D1ccIZSb
         kitg==
X-Forwarded-Encrypted: i=1; AJvYcCVM+S4yXnDwtS8r9FMDrdbStnraZMLnYVQtHyXTfAeGtQ+dqWHRu0+u7wKislpnrsWRNlq/W3VIj0A7rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmBXmBINccmFTjfQoklA8axGWQY8/b0NoGNkIT1vcmyZ5zWjy
	eykjLR+xppXgtJXb97Di7eeNwrqRJq9AHKpZkwXj5MJYFvwJwjj0yw+b
X-Gm-Gg: AZuq6aIbLdB7TBEGLvgYGAh24mu8te1TFzmsMLNOkq4M6+d82jy1D/AGmQYbvSbjebt
	4vfUnpHNLwDHdcLzi/raqli/PIlmU/F5V1N/ec9lRwn21DuWTYFBdYBmNMt6Gr3rKci0ZW+rsQ9
	sFT2c/ABHhowIiA1YBoK5vF0yCW0fCO8Uzd8KS7TsJFfPfxOuYXMxcxoh8iOLetAvuBz7+3a8NC
	VppXMcRQV7QvXkOEGKM4lPi5QmI4r6oFCRXKON+sF3xNZzprOyR84CaQTs6SAKu/NcuS+2nqg0e
	RW2BxshGAnzU//k6r6p62ODqWKM5F+5Tl8l/qpBcCuMBbFTLS2DfaOnY+SmBCHvDZw45E9K4HYC
	OL/nFWH9qwcyJ2c3Q1NN1kIG7yfzP6RIPR3HHRX8RETbT4Fu+zS1OnY4znbopKEi4JatncrE9f7
	yyc22kW1jsrlmG
X-Received: by 2002:a05:6512:ac5:b0:59e:5589:26c6 with SMTP id 2adb3069b0e04-59f8abe6f22mr4724303e87.9.1771829464668;
        Sun, 22 Feb 2026 22:51:04 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] ASoC: tegra: Support WM8962 by machine driver
Date: Mon, 23 Feb 2026 08:50:50 +0200
Message-ID: <20260223065051.13070-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065051.13070-1-clamor95@gmail.com>
References: <20260223065051.13070-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonas Schwöbel <jonasschwoebel@yahoo.de>

Add Wolfson Microelectronics WM8962 codec support to the Tegra ASoC
machine driver. The WM8962 codec is found on devices like Microsoft
Surface RT and Microsoft Surface 2 Windows RT based tablets.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
---
 sound/soc/tegra/Kconfig        |  10 ++
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra_wm8962.c | 165 +++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_wm8962.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index dd58525b7079..fdc954028d62 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -229,6 +229,16 @@ config SND_SOC_TEGRA_WM8903
 	  boards using the WM8093 codec. Currently, the supported boards are
 	  Harmony, Ventana, Seaboard, Kaen, and Aebl.
 
+config SND_SOC_TEGRA_WM8962
+	tristate "SoC Audio support for Tegra boards using a WM8962 codec"
+	depends on I2C && INPUT && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
+	select SND_SOC_WM8962
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the WM8962 codec. Currently, the supported boards are
+	  Microsoft Surface RT.
+
 config SND_SOC_TEGRA_WM9712
 	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
 	depends on GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index defea7f53f11..3f396c87802e 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -43,9 +43,11 @@ obj-$(CONFIG_SND_SOC_TEGRA210_OPE) += snd-soc-tegra210-ope.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-y := tegra_wm8903.o
+snd-soc-tegra-wm8962-y := tegra_wm8962.o
 snd-soc-tegra-machine-y := tegra_asoc_machine.o
 snd-soc-tegra-audio-graph-card-y := tegra_audio_graph_card.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
+obj-$(CONFIG_SND_SOC_TEGRA_WM8962) += snd-soc-tegra-wm8962.o
 obj-$(CONFIG_SND_SOC_TEGRA_MACHINE_DRV) += snd-soc-tegra-machine.o
 obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
new file mode 100644
index 000000000000..31f9d9181595
--- /dev/null
+++ b/sound/soc/tegra/tegra_wm8962.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra_wm8962.c - Tegra machine ASoC driver for boards using WM8962 codec.
+ *
+ * Copyright (C) 2021-2024 Jonas Schwöbel <jonasschwoebel@yahoo.de>
+ *			   Svyatoslav Ryhel <clamor95@gmail.com>
+ *
+ * Based on tegra_wm8903 code copyright/by:
+ *
+ * Author: Stephen Warren <swarren@nvidia.com>
+ * Copyright (C) 2010-2012 - NVIDIA, Inc.
+ *
+ * Based on code copyright/by:
+ *
+ * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
+ *
+ * Copyright 2007 Wolfson Microelectronics PLC.
+ * Author: Graeme Gregory
+ *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+
+#include "../codecs/wm8962.h"
+
+#include "tegra_asoc_machine.h"
+
+static struct snd_soc_jack_pin tegra_wm8962_mic_jack_pins[] = {
+	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
+};
+
+static unsigned int tegra_wm8962_mclk_rate(unsigned int srate)
+{
+	unsigned int mclk;
+
+	switch (srate) {
+	case 8000:
+	case 16000:
+	case 24000:
+	case 32000:
+	case 48000:
+	case 64000:
+	case 96000:
+		mclk = 12288000;
+		break;
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		mclk = 11289600;
+		break;
+	default:
+		mclk = 12000000;
+		break;
+	}
+
+	return mclk;
+}
+
+static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int err;
+
+	err = tegra_asoc_machine_init(rtd);
+	if (err)
+		return err;
+
+	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+		struct snd_soc_component *component = codec_dai->component;
+
+		err = snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
+						 SND_JACK_MICROPHONE,
+						 machine->mic_jack,
+						 tegra_wm8962_mic_jack_pins,
+						 ARRAY_SIZE(tegra_wm8962_mic_jack_pins));
+		if (err) {
+			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
+			return err;
+		}
+
+		wm8962_mic_detect(component, machine->mic_jack);
+	}
+
+	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+
+	return 0;
+}
+
+static int tegra_wm8962_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link = &card->dai_link[0];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	wm8962_mic_detect(component, NULL);
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEFS(wm8962_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm8962_dai = {
+	.name = "WM8962",
+	.stream_name = "WM8962 PCM",
+	.init = tegra_wm8962_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(wm8962_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm8962 = {
+	.components = "codec:wm8962",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_wm8962_dai,
+	.num_links = 1,
+	.remove = tegra_wm8962_remove,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm8962_data = {
+	.mclk_rate = tegra_wm8962_mclk_rate,
+	.card = &snd_soc_tegra_wm8962,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+static const struct of_device_id tegra_wm8962_of_match[] = {
+	{ .compatible = "nvidia,tegra-audio-wm8962", .data = &tegra_wm8962_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra_wm8962_of_match);
+
+static struct platform_driver tegra_wm8962_driver = {
+	.driver = {
+		.name = "tegra-wm8962",
+		.of_match_table = tegra_wm8962_of_match,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = tegra_asoc_machine_probe,
+};
+module_platform_driver(tegra_wm8962_driver);
+
+MODULE_AUTHOR("Jonas Schwöbel <jonasschwoebel@yahoo.de>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Tegra+WM8962 machine ASoC driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0

