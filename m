Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372349B465
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 18:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916365; cv=none; b=oYDMrX7BNR+AiYVfllwuMuJJli4T7EKj+XeiXRq8zqO11OMVAgR6+Oou0C0IEc2w+Vq25Ejl3hqO4Lu9AgdooX3qC3+OrjQqw3x7X49HvwVmBfEOl4BCg6a1qd+aUdqUPP7/TVMXw8rJEM7nGYULBb8YBs30z7KDRzFlQNFAOAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916365; c=relaxed/simple;
	bh=Bs86v3lbyxE6NRoXSABEXIQnXCClN1E6c4K13PIelMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sf2DlHHObnmof24gAhWT67GXpeyJXxWS4SEvORpbcYj+RWohpHtb3LhlW8fclIYRWKJW9IJx7engrYxVoPqyVD7aZirf+HXs8Vwum+U3csvSa0Ja7ZI+dJzTttj1TxSeFUPA0m6b9Bmfp0bGZp1sg2xJI4y71AQQiGzPWvSrndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkAT/UB+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkAT/UB+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so30068035e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916360; x=1792521160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI+lWug+CF+zds+VngY+4+EE14MEntbx1ydEJnf/IQs=;
        b=DkAT/UB+UL0ZOYfjrVtVyP3cVry5UrQzsM3Ccxun3wvk0QcN/idEKA/WJLAo8Q0M4J
         wNJ4EcybqZn7MDrQ7RE+lJP6rF02fSQ+b/41fEB9Caq22/MwYSvCGZVPa0qkRkqY4tJU
         JB1tRPXRSirsaV4u0fVOLlV0QUkhEFTA2NMu3xiEwQ141Tlo2QpQ4M5l3Z3sKFAuM7co
         b3smR40djCuxj8Z0pgn3dphEUUya3Rz/n5RbT0a4el1NRV/kDoFG9bbtKYhiq0P1BZ9t
         Y2rr5A8syN+ZsN37DdpHYX2sKpaH1dwVx4EHyKxTBwX+BRwQlzmTh1ZFl8AE9o8aZwzG
         B57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916360; x=1792521160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI+lWug+CF+zds+VngY+4+EE14MEntbx1ydEJnf/IQs=;
        b=2ahLLJ9WPzBSnU9jicDqPhQyuowkPmfIIGg+jjcVrssJIf+f6SpxBy9edoTYZdLkHb
         Sr4bFu6TA/1srrZl2II6HDJCyyv0mx6Efa076nFkbKlj7pVRmPEZJzqG5f0uxtEIWnHX
         u/FENR5jhaVV0xjwbzYYZU1DrbNCzY2esMQPzvcylis6p+yVKOhthtHjHgSekymYns4N
         sV7rfC0YjbgowM4IJ9tqu5t0lJ3q5wQo2q7BmtLX4hCvrdmgTzlqpevlN4ZyDMwGuRJW
         8ZIZTTz4iLOfykES72Yl0l+DQBslzcIl/gZ2vsBS9VlQKJswbIVZkgwc8yROywPhriwc
         M2iQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+8qP92M0z41zia0Ab9WfAAhkV8lA7SVNHXrWcpzSq+myb+FN6oFMmN6WxpScmDusua694kTxNFpx7SA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIDJN4gNps5FPhKvKRbAB2Otr8KnZ4k6bdEqMbG6hnwSRGn4A2s
	nsEVOd+mN+gwJbDH3ynSh+IbqVl3GhCiu0G9uDF1sPvoz9Sln1zKza7W
X-Gm-Gg: AYBFou3M/8ql/O6cxosEfxA9poK9mdQSvS4X0LGMSN6y/7ZGisZJfNh5E3nbAB3jI9I
	fbKp9PTlCTREnwZdEYv5FReXnFfkdgq7L/XvfL9srPWwmgZnoqhUnZpbCHrobPY5mAMBL0TMXB/
	IbJJypEjcjrDA/D3D5ShdCtPUeW1K/8ISF6P7gKKlLsO6ftgzwPKLIR31Yopgog9tsGnfAWi620
	X74migGBrqO4NSiYUjuVmdhWYZnLRrgyIa8AVOYiyp4Hl9Fzz2J6k9XkLSpnh+iqAjd8MwNy9up
	FYs5+KFp7Ob/l45yRTGL2LIVrgfucod3jU7HNR68fJhq1ucB5jl6HPZAsg7MZ39vSCyIXk+tBPt
	3IRGTVEKpBUSSktzICRy+oR7ufcX5yr1nZkR3u/AIFgIs3tqwcvGj9FWtMrPrc4eAldZoXp6mPb
	qdn1qKSvoSZTjb6c4wCGDBinAWFbK6ROB58QT5vcUeE3r43nmq8SrakXCcPrd5vuSUoYW9ogEmj
	1xn98Kvf8CYRWdtSn2qOKGwGC3Cgw==
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr285728915e9.16.1791916359916;
        Tue, 13 Oct 2026 11:32:39 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm548921305e9.9.2026.10.13.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:32:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
Date: Tue, 13 Oct 2026 21:32:26 +0300
Message-ID: <20261013183226.513658-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013183226.513658-1-clamor95@gmail.com>
References: <20261013183226.513658-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/Kconfig        |  10 ++
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra_wm8994.c | 169 +++++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index fdc954028d622..dd3b2d3d6c4c9 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -239,6 +239,16 @@ config SND_SOC_TEGRA_WM8962
 	  boards using the WM8962 codec. Currently, the supported boards are
 	  Microsoft Surface RT.
 
+config SND_SOC_TEGRA_WM8994
+	tristate "SoC Audio support for Tegra boards using a WM8994 codec"
+	depends on I2C && GPIOLIB && MFD_WM8994
+	select SND_SOC_TEGRA_MACHINE_DRV
+	select SND_SOC_WM8994
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the WM8994 codec. Currently, the supported boards are
+	  LG Optimus X2 P990 and Samsung Captivate Glide (SGH-i927).
+
 config SND_SOC_TEGRA_WM9712
 	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
 	depends on GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 1c18ef6971c09..b8f90149bfa63 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -43,10 +43,12 @@ obj-$(CONFIG_SND_SOC_TEGRA210_OPE) += snd-soc-tegra210-ope.o
 # Tegra machine Support
 snd-soc-tegra-wm8903-y := tegra_wm8903.o
 snd-soc-tegra-wm8962-y := tegra_wm8962.o
+snd-soc-tegra-wm8994-y := tegra_wm8994.o
 snd-soc-tegra-machine-y := tegra_asoc_machine.o
 snd-soc-tegra-audio-graph-card-y := tegra_audio_graph_card.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM8962) += snd-soc-tegra-wm8962.o
+obj-$(CONFIG_SND_SOC_TEGRA_WM8994) += snd-soc-tegra-wm8994.o
 obj-$(CONFIG_SND_SOC_TEGRA_MACHINE_DRV) += snd-soc-tegra-machine.o
 obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
diff --git a/sound/soc/tegra/tegra_wm8994.c b/sound/soc/tegra/tegra_wm8994.c
new file mode 100644
index 0000000000000..950fa6ad388f9
--- /dev/null
+++ b/sound/soc/tegra/tegra_wm8994.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 codec.
+ *
+ * Copyright (C) 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+ *
+ * Based on tegra_wm8994 code copyright/by:
+ *
+ * Author: Sumit Bhattacharya <sumitb@nvidia.com>
+ * Copyright (C) 2010-2011 - NVIDIA, Inc.
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
+#include "../codecs/wm8994.h"
+
+#include "tegra_asoc_machine.h"
+
+static struct snd_soc_jack_pin tegra_wm8994_mic_jack_pins[] = {
+	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
+};
+
+static unsigned int tegra_wm8994_mclk_rate(unsigned int srate)
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
+static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
+	SOC_DAPM_PIN_SWITCH("FM Radio"),
+};
+
+static int tegra_wm8994_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
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
+						 tegra_wm8994_mic_jack_pins,
+						 ARRAY_SIZE(tegra_wm8994_mic_jack_pins));
+		if (err) {
+			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
+			return err;
+		}
+
+		wm8994_mic_detect(component, machine->mic_jack, 1);
+	}
+
+	return 0;
+}
+
+static int tegra_wm8994_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link = &card->dai_link[0];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	wm8994_mic_detect(component, NULL, 0);
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEFS(wm8994_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm8994_dai = {
+	.name = "WM8994",
+	.stream_name = "WM8994 PCM",
+	.init = tegra_wm8994_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(wm8994_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm8994 = {
+	.components = "codec:wm8994",
+	.dai_link = &tegra_wm8994_dai,
+	.num_links = 1,
+	.controls = tegra_wm8994_controls,
+	.num_controls = ARRAY_SIZE(tegra_wm8994_controls),
+	.remove = tegra_wm8994_remove,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm8994_data = {
+	.mclk_rate = tegra_wm8994_mclk_rate,
+	.mclk_id = WM8994_SYSCLK_MCLK1,
+	.card = &snd_soc_tegra_wm8994,
+	.add_common_dapm_widgets = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+static const struct of_device_id tegra_wm8994_of_match[] = {
+	{ .compatible = "nvidia,tegra-audio-wm8994", .data = &tegra_wm8994_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_wm8994_of_match);
+
+static struct platform_driver tegra_wm8994_driver = {
+	.driver = {
+		.name = "tegra-wm8994",
+		.of_match_table = tegra_wm8994_of_match,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = tegra_asoc_machine_probe,
+};
+module_platform_driver(tegra_wm8994_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Tegra+WM8994 machine ASoC driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

