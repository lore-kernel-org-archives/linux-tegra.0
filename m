Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9354219F1
	for <linux-tegra@vger.kernel.org>; Fri,  6 Feb 2026 17:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399283; cv=none; b=fLddjf0KIUN3h16wGldrVQlRR7PGT+ZntPAIuhKfo+MoIroJR61MQcRCj7fAGgYxcxEoW6yrkmT3Eu7rzBbFA9A4mroqy0sgKyHLyJUZRXOomY8f5k9D2pygeHgpMp8opKnsvFpI4DYhmt6IspCPfX+XPJY7FrpnWw1PDF7NawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399283; c=relaxed/simple;
	bh=yQseu6gM2haEIm/ayUoG3639fNPMyxWFXUHZI+hw/MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jKZNlB3OB6cYFmeyWOWOS28Qd6LPB2O66lms9m/76cYVCf3beCxdnWZs7TC+w9FBGijzrXZXuylj9eZwMyOJbw/5nXFhmIyD/fQLjql9C1gyeii6OVoAUWsn3srklHWhbd/6+SmgybtQcsm8h4Tm+x3fCqW/WrwTh/IBufyiZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htxHN6H2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htxHN6H2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4832701b9b7so4671165e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 06 Feb 2026 09:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399282; x=1771004082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htXBvNPgxXNOHZBCLFJRJ5Aq3ZtCWpOxvSqLp1RXyrk=;
        b=htxHN6H22fQr/tKGomUm5OBCFkj9D12sMw6/K965cBZryy/B5OEPN7H9Dmq0Ve42Ek
         gszRnMchhmdmi33NNEH+JFdEFc/4/EDmbroQ80++H1ad2blP0jRX6RAMUI1uJ3a9kWsU
         ABS24H7qx/9RTAhoVb9KyuL6hh+cjyq5XmFUAVvE3B8dPfb5sGtZhAxMrLzddX9gF0DB
         Mr2ES0zKHByOtK9SHdgL6/cJGm4+NvSw4cl0IXruJeN+lnSjLDFP9NGYT/7HLFF9soXE
         1lioujO79aWT46UO5c88A4P7znIo1v+jTZlhwQSrvBY96xSQ1mezIJVdZVQ0fJKZhKHm
         Oywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399282; x=1771004082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htXBvNPgxXNOHZBCLFJRJ5Aq3ZtCWpOxvSqLp1RXyrk=;
        b=nxnK+9E164LnidONFO4Wf7bgUIJ7hh5dBZrl9hqgG1hJFW/KVnrovmliBXWG+pGBK6
         erYhDq9Eror0dYncvbpu+6rpfr33seypYOOIaPzhSczAZWNPLCwpQD2xyz1yXBQ4FvX7
         eKHtBIlOAigL4WqQ9LWKBwF+yQHcXsDV8yt/ki5WqypZTM9tjM2NU6sD5FH5r3E4qftU
         6VEOkDynfBBNAnqG89GAOOQFS9/Y1mNQdcSjLu5EXPcii804cuy/SWUqS4u00ONyZCFB
         mkb4Unb3gtZNF42iwFJUiPyRG59IMzf2KC160iZ1ZGhP8n/BKpUicFVk+aWxGbSekVAr
         LmaA==
X-Forwarded-Encrypted: i=1; AJvYcCUfFnhtpBjBzEdDU3ZEYgXN7olpOK6OM9OAoQUkjOgcWwsyVOrqs3LSGINkzKzpcpaAXlaXzGgrUE9RKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPffGcxU3VoKxAdQdkLpLUn6dXj3fhZQgyqIbGrTxBhuZdXed
	fx+GMP72Sf27YOapD4GeVKkdTgh01XCMEZIXgNNvcyxo27Px+BJH0g09
X-Gm-Gg: AZuq6aKO3I5pV/hVLJ+3YxJRg0CENaS3qRkc3kfej+UclT0vlgudYY6FVcQScdRBgUH
	phrSP5JOtcwQordYW+7WzjWKvy4qnXMVhMZOrMWkjsvzYx0k1Odn8rvmVUENUpZFzeTkvSiYzUf
	aNNtx5Jrh/5VI/asX/P9rcPiiDFayAnHmmpHLDtzy6IM+/vVpu4Tgvg6CdysDY9upCM9FR0jcpm
	vtJpJcL8eWviX0Y+5jH3Oa5obnrwKXRo8wbt+UxQcoFid7g+aBKWcdnU1cMnKVcTz7GY498aGHn
	8bAEJ7IIGDubCw1PNt701qjRQk9alibQ8gaHgycuFcJtCMsW5ky+s5P0kWlSToD0AH8t5i1o40c
	rX8v91LqV1gZWC+fezQ2pWE/bwu+eZSRE1if0QftASP2VK8rDrp1P7M1Zu0yxa7YiuuPh6+ObEe
	8A
X-Received: by 2002:a05:600c:19c7:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-483201e160dmr47405795e9.10.1770399281553;
        Fri, 06 Feb 2026 09:34:41 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:41 -0800 (PST)
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
Subject: [PATCH v2 4/5] ASoC: tegra: Support WM8962 by machine driver
Date: Fri,  6 Feb 2026 19:34:21 +0200
Message-ID: <20260206173423.145954-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206173423.145954-1-clamor95@gmail.com>
References: <20260206173423.145954-1-clamor95@gmail.com>
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

