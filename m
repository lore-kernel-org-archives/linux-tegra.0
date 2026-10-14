Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C14E0B73
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979346; cv=none; b=nm6BkZYmH1rX87J6C7/nL5LB5cpufFDO4HT+9zuVyeCJJUl8JrC8NvpheFulUmv0i2ZTWkNLQM6cjsmjKKdqcMTbYxFCgLajkqQkevaE4lbdfOsYzKpiXX1sxww1qUhvLDYpdWGfW6X+HlX2NFNPg4WFSuYRqX1PChZaSsLf6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979346; c=relaxed/simple;
	bh=vgZWAsabxU1sYftc52tRtotWk9n7ABGqA++G9DtjBJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8DT6u5/FXaZOI7fClytai99utiILkjEytTIJc9E5sIBFRzxkqTfGMsbdgwnx1hPRcpVUKxKCtBO9tllzAW1gp1XPCIOJdArC6F0/qEKHWI7vLzVDbJeE91TK/c2uMt7HLBvh1s1xV1e3q+xMxaK2t+etlbj98G/VtVYMh1TeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpfzeCBe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpfzeCBe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so34224735e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979342; x=1792584142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AOHma/lvCGlxwnz7PTUSCC5usStZRZZA/1odUev8vI=;
        b=HpfzeCBeSRX9FFza8z+xOFFS/7grIBijqt5QoPNqmKqvM/9g+/38q56oCR9GZhn5Ah
         CXb7k6SsD10xZljOWjXTc3MZwaTO1hDLuv1uYif4bcxhIjD1BIManAtyX4noN2Hxm7yH
         FeER6cMgybzdxIicAMQrTx45y0Jw/zyP+SIz207H11ftdJFPjbkPm3yWAdTXr54GExpb
         0tFbMi7+ZQ/oL6SAf4P9abwq19rdsOJdBhm78ZtoDfeakuwFMky683K/yNOfuQXtk+Ts
         nl6WIQbcjmzskuvweKjuIM5E8DFtcRNV0E4PZiPHsHD08soSFur5ihSmt9Txt7aqg1iW
         evYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979342; x=1792584142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8AOHma/lvCGlxwnz7PTUSCC5usStZRZZA/1odUev8vI=;
        b=KdwnmgqEQfRl5ygpv+wde//HhfHnZ6v6Zejm3/2LzXSIItUCYYSPU2L32IvY3NLODK
         LWn9nQ9r3oKgudgPnMTI4hx38uAfbaxZlYz/H1meSVIpYsqbYyREjYcZbPd13IaxyAJJ
         E5ZZI7C+OyXaXZYjf/KmpXme3aLNdIf9XnvbdHV2S4bCZW6/2YSv7DMaFC69XjmBJEmZ
         cqJFlrxL7gUvpLSUBDi9VupCrMVfCxpBiD9/MtxIlc5t3N5bv57ZUdklGUXLEvB8XzhX
         FYJ3XjmvL8mfAWa7Hfo/D0yq+QuIqKkNzl/TyG8OVT+i7SA7fiPLE7Rpe0HVPVCWlVDb
         gj9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFAe9S+LsttngP8XgeTKXsbkt8qg+7nYzQQIFrihNeIpF11ZFufl9GXPuVpejXWVwfnIdXKJxoI0ireg==@vger.kernel.org
X-Gm-Message-State: AFq9FYINeduYO2ddtckAgUX2Cc+mCvHrzd3eYjhutoh+qRzefI3YOUr+
	Ryv+eMM9iCsu8YoahYIVqW4kV+AdYKbLx9CW5XefYtUmiLFWQKO2DK7x
X-Gm-Gg: AYBFou0eaLVfbRwpoLk69iJyBKMtroWZvql4qSO1Tpq7IRZXsjRXZLTlTK4uSPKJoip
	h+Ql+CEe+02iPBaqPxBza4th/mfxJjdduChR3KX5sBQWBWDbYGLByUuGgEFGj/6/6vcjgrFQZ39
	PJ+b7kVwNa63rmWbrMAzxh1t7E8ddSphVo4cDb1mgkUUVS3IQ034YJaOxddP1VXZS484qypDT0J
	y9okmVtUGLSPevJEpwlQ9sciyB2Q5Rea5sk8gzokDDjZEuieaY68csVqCkAuSBkEqbG+gF+0p/5
	9IltTWsCPMkh7VF68zakcm9NK3naOl3wv1T07ZpQC2g6zGEfTVrnAaFCBSxNcvECAGujnfOrESk
	Jcu4YoOIIRl4JyFy7QEWo6To3KvYXdRCPbhWuMoKGiAaJf45LwcUyUq9xFnkRws+QCg83sZVwvl
	YAUlbFgwFGNIqDJUkV+lauRmtja8Sdpc1EUc7oXOh0U1TLziH62lNHqvUNtTDa4trH6Xg+M7aCk
	vX4OohR3lqmd/itS5A=
X-Received: by 2002:a05:600c:8b74:b0:4a0:2847:b6ee with SMTP id 5b1f17b1804b1-4a18e4fb8c1mr312727375e9.35.1791979342049;
        Wed, 14 Oct 2026 05:02:22 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm10937057f8f.36.2026.10.14.05.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:02:21 -0700 (PDT)
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
Subject: [PATCH v2 2/2] ASoC: tegra: Support WM8994 by machine driver
Date: Wed, 14 Oct 2026 15:01:48 +0300
Message-ID: <20261014120148.126160-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014120148.126160-1-clamor95@gmail.com>
References: <20261014120148.126160-1-clamor95@gmail.com>
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
 sound/soc/tegra/Kconfig              |  10 ++
 sound/soc/tegra/Makefile             |   2 +
 sound/soc/tegra/tegra_asoc_machine.c |   2 +
 sound/soc/tegra/tegra_wm8994.c       | 175 +++++++++++++++++++++++++++
 4 files changed, 189 insertions(+)
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
+	  LG Optimus X2 P990.
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
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index e4af049fd7e89..e2d0e5947339d 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -122,6 +122,8 @@ static const struct snd_soc_dapm_widget tegra_machine_dapm_widgets[] = {
 	SND_SOC_DAPM_LINE("Line In Jack", NULL),
 	SND_SOC_DAPM_LINE("Line In", NULL),
 	SND_SOC_DAPM_LINE("LineIn", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
+	SND_SOC_DAPM_INPUT("FM Radio"),
 };
 
 static const struct snd_kcontrol_new tegra_machine_controls[] = {
diff --git a/sound/soc/tegra/tegra_wm8994.c b/sound/soc/tegra/tegra_wm8994.c
new file mode 100644
index 0000000000000..1550faeba7256
--- /dev/null
+++ b/sound/soc/tegra/tegra_wm8994.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 codec.
+//
+// Copyright (C) 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+//
+// Based on tegra_wm8994 code copyright/by:
+//
+// Author: Sumit Bhattacharya <sumitb@nvidia.com>
+// Copyright (C) 2010-2011 - NVIDIA, Inc.
+//
+// Based on code copyright/by:
+//
+// (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
+//
+// Copyright 2007 Wolfson Microelectronics PLC.
+// Author: Graeme Gregory
+//         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
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
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
+	SOC_DAPM_PIN_SWITCH("Headphones"),
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
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack)
+		wm8994_mic_detect(component, NULL, 1);
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
+	.owner = THIS_MODULE,
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

