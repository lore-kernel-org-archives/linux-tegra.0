Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48A303C9F
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780101; cv=none; b=fF3EX8ZId1FBA+KtRzriP4zI7D3cjnvBOSy2MnEJvg+mIhhMd8peoGI2tCw7RonGN3YpgWILTZa7J3fpFg/rHrt44cWIISqf9F2wK+oWMNsRsYNCghWcnamlbQCp79B77ZJ06DO6tzmQkBjsV7AtbEw2uqM844I/PG5bGGl/MfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780101; c=relaxed/simple;
	bh=D2udKOIgRxYLN++wJlYNmDyuzLLhyWkSNCE7NFH6d+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGTUrJ2gmVm3GrsBel5zCNqXi1hueMDaVludzX/cYozmLQIxFgaxot/vorxiRO9i/XxZPpRkI75Y7bruXbuBdSISg8iQ7wZt3xBsxjVAYCiBIHJyFsLRoe/HJszLHOFR0N9CqtbfP3TaAPI1/CLCqjvYH5FYjf+9bNA1xg/wDNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJnK2kNm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJnK2kNm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so1831291f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 05:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780096; x=1770384896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKvxKGZ/wM7it4bTsO0Z3rMS2mHTFWTEN2O02PyhYlQ=;
        b=eJnK2kNmw3iqt/rG3pKu3Kgb1Pjsgc2LnOWPktXTT0SCHFcqEdpIX1JfxSwGs3nNoM
         YZZvWqnGqO4zHbJ/jbHE8NCWyd2lEqpEimm8Nv4LVnxDulyBtqScBMkgOtatrfiHd9yh
         Xy3EgcXUHqQuTkmXL6u1mtd7CsnmFv9VC49Y/F9XQFKYwTHOvXSFBwkHLyz2ZL49LLUN
         Lc+4oXBW+APm4gl24uitdYnywYvuYe3zAc09Rl3a/Ai44qKC1dsQY0FN1HEm+3vhsyp2
         PBhkzMv75fgTiwXnDr1a0UxBE2zGMSSMw5YooEk3nLDXOKvkwpfmt0KPNxtK2iM3vSDh
         oMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780096; x=1770384896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lKvxKGZ/wM7it4bTsO0Z3rMS2mHTFWTEN2O02PyhYlQ=;
        b=iVXlWmijjr8H7TiO3kNYY5Dr3+P0nUG3o1qY72VT1dLzj6/qphv4MYx/D34kVO3YRb
         EuCKlN4hhe7WFVGQkbv47ZYUrGIMpLkhkYcT0984YNgH9144vopcHRoHS0wQuThmgrW+
         3Nstdz8UxIic8rpEhn1iPGM6R54H15kHe/oKs4CswR3qA3rdjl3vdxFGTYhOOQWaX81N
         5Sk5wo+IHbhlmGSHChVib21P6duoBV0EabZo6RhH3vX1oCrH9tYsjppQpKjrbldsodfW
         ZCgdYDsQM4PTPe8IEQ6M6kp3GHQlethQjFgz4OCIRTEtPJHMOR2Wxf/E1NkFkFKt+kVI
         /dCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8qt9ZsAqtGlWTJPSagQtZKzRA3XDAZqERJ0oeqxxgwKG9E47Nl2QHt22WebPHL7WOjeDaCGzUfZoTcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB+q3/u++SCMtDCznpII5IqZhXwTMvZQ36MJv8YOIb4H8ztbdP
	030tc2dj4N989ndCKj4EnsOerj4BgFHJS64KPTzYXmSbtsGQVYqpdRI5
X-Gm-Gg: AZuq6aJH6D6oq1ZKmBLiU5WD3Hwj6I9rPPfMdo+wvstywQAQVr23gZtVrGYcPCeWJ9w
	vHblWlN/AsKrTz3RTEAO+Ibkd1O565imjM/s6jHRhTjSY2LbNoPZQU5tv225a3N/EZkZpWYHNSR
	yl8wDympnXjh2lJGp/s9GMNgtb0iyzmkzVOGRwenzpcxkBT9E60IH24fhhY/g2oaRzVHinN9B89
	9wk5+QzkPmQ9jYMlztALHHkQd9lD6dBjJZHyD1AZs8EWXYibTRt+DdoI0vN0T+K7AmEk/eSwMjb
	yjgdkrsCEhlsAsKTWi0dOgNhNFdWhYJW0tK7b2EVcE0X7owlqvHtfy5R3SELXBXhOgK8Sv/OcNb
	WIS5a5/wumO4SU7QhH6zxNQFOLBnXY2F8zAFE9SmIa5wefMiADb/Hs6x00qF2vLqGm/15fuwPZy
	4a
X-Received: by 2002:a05:6000:184d:b0:432:da3b:5941 with SMTP id ffacd0b85a97d-435f3a7b8camr4494369f8f.21.1769780096189;
        Fri, 30 Jan 2026 05:34:56 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:55 -0800 (PST)
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
Subject: [PATCH v1 4/4] ASoC: tegra: Support WM8962 by machine driver
Date: Fri, 30 Jan 2026 15:34:34 +0200
Message-ID: <20260130133434.353353-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130133434.353353-1-clamor95@gmail.com>
References: <20260130133434.353353-1-clamor95@gmail.com>
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
index f9257830daa1..56a2f53df2c1 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -229,6 +229,16 @@ config SND_SOC_TEGRA_WM8903
 	  boards using the WM8093 codec. Currently, the supported boards are
 	  Harmony, Ventana, Seaboard, Kaen, and Aebl.
 
+config SND_SOC_TEGRA_WM8962
+	tristate "SoC Audio support for Tegra boards using a WM8962 codec"
+	depends on I2C && GPIOLIB
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

