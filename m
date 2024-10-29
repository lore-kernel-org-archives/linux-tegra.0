Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38508201111
	for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187492; cv=none; b=sLNS1jdcB/GBMLV+YoyEcJYJiMViod6wv+lGuSmODcff9MHC9FdNq9dujsaSe5zbdlAySEqIRsRrQt2BnFAWpAkqXm62ItU+7RbAeD0McUQ+r8a5UFRnhb5hyK4P2nmzChFDwPr+8UON3UHvvh0bG7QXAAWxSeo8be3y3bQKcOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187492; c=relaxed/simple;
	bh=bofb0GXHAy72+VfSg4Mly92y7jtyu1u1iViJjOuNI8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zfk0WnMLS+ZmbZkeoCPrNV78XlHuazaRfRMx4h7Fu19UsqXjVPGKlpTX2xAtbCgqk/+hTPoOic6Nwp8fWi3YoKwHg2tXphYo5yLnR7RsPh7FrmcBDbIdu9/ZAcGoFtCnYioADD3uuU4WAmBm46uKMWTeJLuJzLaoM2jubvte7WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vwpJBXzm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vwpJBXzm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso49934355e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730187486; x=1730792286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRBCS21xbUg+ZtyrX+0216a9IgyvQrvSGGoh4bdg5Wo=;
        b=vwpJBXzmjKfOE2sHAUT+ssPeAWEhkb/VKqFWareYc1zKaKsVBJnylK9ZTWZ6tqb/t/
         ncivuz2AOGy05OezfX1EJXrAKtd/a+bPyZezpoQ8LRf4mHVj/FUbqsQ+BMEdC8JGQ72s
         G3+GwZ8liRrULzjiEj8PfAzbrmIvN1MzRgqwtasuL5YG/iD/QPC5kbAhSE0X8MLb2Ruc
         RTzCz2QABUazaPL97Dg+H1772JVh0HD2pjMDaQFuVzbFAqqLM2qrVfGmnCKrOpMG3dAT
         bToBKYnieEHGe5qgCM0I0SSqQUe247DlWvuAbX2WTEOhUpu60RV4DDJhcsXZkkevL0JO
         0N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730187486; x=1730792286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRBCS21xbUg+ZtyrX+0216a9IgyvQrvSGGoh4bdg5Wo=;
        b=vDtPbNYT98H8lgncp2HcLtCzaswKa1NJqdpF1oQYv8v4e5yG532IXKjqXuUQpfsTm9
         fOtdUJFfJvebZ6euNPIo5iEQ4g6LZ99GZ7PWshxyloVlPogasYPhgi5g7Pwh3znDUb1e
         IP5f9poTbJVGYqhZwbLSsqt2jkMmc6qenHbXXO6TZFBWVtRxQg71oEGQrPbufEjdFrK2
         rw75BdNJsMLNk4Wpw0ycXPzZtAptC45TWXfoS17KEihTelCPqmy40ygMJA3y91UarA9X
         c6EeZ2ZARd5JVVKe1/bqyVlH8GNGouOwcc7hMDcE6qfSYXCv7kpPCj1OhcbMPM5Bubhl
         30Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX0OUDtBX9+QBYOqGH5+OGBNcqKxI2jy7D7+97e4fctJSgwYUSL/yORVK27NOT1GFhJKGcD++j0UJB9uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfxf2fwYch88/niXIGjXiRSWJrxdi3NP9aYHZHAcjxeaeHITU9
	osdWmBdv8+U8Kii8+QxXTBa1IdkYr6+RYvcCKmq0uWEmV4vIdxSLfWsv1UZlO+M=
X-Google-Smtp-Source: AGHT+IE/QTlrTfqOXWM8zSxaY+sQmjccOShgerlk9HjJclBzVZ62XYIIe6dba6vKrd4PnXhBaOl1zQ==
X-Received: by 2002:a05:600c:4e0f:b0:431:12d0:746b with SMTP id 5b1f17b1804b1-4319ad294a4mr81325345e9.35.1730187484985;
        Tue, 29 Oct 2024 00:38:04 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5706c3sm164752335e9.34.2024.10.29.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:38:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] sound: Switch back to struct platform_driver::remove()
Date: Tue, 29 Oct 2024 08:37:47 +0100
Message-ID: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8427; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=bofb0GXHAy72+VfSg4Mly92y7jtyu1u1iViJjOuNI8o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnIJDMDMnZBV7DocFNxEnCFbvqTaMWTOgrRJ9/c IbcL2jDvQmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyCQzAAKCRCPgPtYfRL+ Tu98B/4gJo9q/Fgct6hluhXw8q+tQ5dF1BSpJ6nHeqplYujtgo382D7jTSdgvdP966ghu0jLNZW 3YS2mOsukJil3wG1Lz0PhuS+BlSNQKUB+fPty+hhAZIABLcgmmvrUDP0iM2slhEO32pKl6qcEXV fikATTb1hjzZTvc18EECgkaxjM+ZDES2vxXFQlXkph0b4WYlvgZPOvvAGrpDfgE6UXIIPbb05Iz 7D8QaBk5d0/dVI01H0vTnV8EBiwSVCF+KtehiUNLAXm82iqpENvT2DocfWKmPcFk0czA+osxSpe VsHmtxbe1pesSbw3cJrdPFf+3SdmUdnOCeXOtRUck/Bxz30j
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below sound to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

On the way do a few whitespace changes to make indention consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of sound. sound/soc was already converted
separately, so isn't mixed in here. While I usually prefer to do one
logical change per patch, this seems to be overengineering here as the
individual changes are really trivial and shouldn't be much in the way
for stable backports. But I'll happily split the patch if you prefer it
split.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 sound/arm/pxa2xx-ac97.c             | 2 +-
 sound/atmel/ac97c.c                 | 2 +-
 sound/drivers/mts64.c               | 2 +-
 sound/drivers/pcmtest.c             | 2 +-
 sound/drivers/portman2x4.c          | 2 +-
 sound/mips/hal2.c                   | 2 +-
 sound/mips/sgio2audio.c             | 4 ++--
 sound/oss/dmasound/dmasound_paula.c | 2 +-
 sound/pci/hda/hda_tegra.c           | 2 +-
 sound/ppc/powermac.c                | 2 +-
 sound/sh/aica.c                     | 2 +-
 sound/sh/sh_dac_audio.c             | 2 +-
 sound/sparc/cs4231.c                | 2 +-
 sound/sparc/dbri.c                  | 2 +-
 14 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 4c367e73b2c9..77b11616a7ee 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -271,7 +271,7 @@ static void pxa2xx_ac97_remove(struct platform_device *dev)
 
 static struct platform_driver pxa2xx_ac97_driver = {
 	.probe		= pxa2xx_ac97_probe,
-	.remove_new	= pxa2xx_ac97_remove,
+	.remove		= pxa2xx_ac97_remove,
 	.driver		= {
 		.name	= "pxa2xx-ac97",
 		.pm	= &pxa2xx_ac97_pm_ops,
diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 402b5f66dcc3..d8f8e08f1bb7 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -861,7 +861,7 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 
 static struct platform_driver atmel_ac97c_driver = {
 	.probe		= atmel_ac97c_probe,
-	.remove_new	= atmel_ac97c_remove,
+	.remove		= atmel_ac97c_remove,
 	.driver		= {
 		.name	= "atmel_ac97c",
 		.pm	= ATMEL_AC97C_PM_OPS,
diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index 6fc255a6754d..17f215bad0ec 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -1008,7 +1008,7 @@ static void snd_mts64_remove(struct platform_device *pdev)
 
 static struct platform_driver snd_mts64_driver = {
 	.probe  = snd_mts64_probe,
-	.remove_new = snd_mts64_remove,
+	.remove = snd_mts64_remove,
 	.driver = {
 		.name = PLATFORM_DRIVER,
 	}
diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 21cefaf5419a..72378f354fd0 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -640,7 +640,7 @@ static struct platform_device pcmtst_pdev = {
 
 static struct platform_driver pcmtst_pdrv = {
 	.probe =	pcmtst_probe,
-	.remove_new =	pdev_remove,
+	.remove =	pdev_remove,
 	.driver =	{
 		.name = "pcmtest",
 	},
diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 54d818d2f53d..5e4ef25a83a4 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -794,7 +794,7 @@ static void snd_portman_remove(struct platform_device *pdev)
 
 static struct platform_driver snd_portman_driver = {
 	.probe  = snd_portman_probe,
-	.remove_new = snd_portman_remove,
+	.remove = snd_portman_remove,
 	.driver = {
 		.name = PLATFORM_DRIVER,
 	}
diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 3c26334227bb..991793e6bda9 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -886,7 +886,7 @@ static void hal2_remove(struct platform_device *pdev)
 
 static struct platform_driver hal2_driver = {
 	.probe	= hal2_probe,
-	.remove_new = hal2_remove,
+	.remove = hal2_remove,
 	.driver = {
 		.name	= "sgihal2",
 	}
diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index a8551ccdd1bf..4e2ff954ff59 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -917,8 +917,8 @@ static void snd_sgio2audio_remove(struct platform_device *pdev)
 
 static struct platform_driver sgio2audio_driver = {
 	.probe	= snd_sgio2audio_probe,
-	.remove_new = snd_sgio2audio_remove,
-	.driver = {
+	.remove	= snd_sgio2audio_remove,
+	.driver	= {
 		.name	= "sgio2audio",
 	}
 };
diff --git a/sound/oss/dmasound/dmasound_paula.c b/sound/oss/dmasound/dmasound_paula.c
index b8fad12f9e5f..8d443a3663d3 100644
--- a/sound/oss/dmasound/dmasound_paula.c
+++ b/sound/oss/dmasound/dmasound_paula.c
@@ -732,7 +732,7 @@ static void __exit amiga_audio_remove(struct platform_device *pdev)
  * triggering a section mismatch warning.
  */
 static struct platform_driver amiga_audio_driver __refdata = {
-	.remove_new = __exit_p(amiga_audio_remove),
+	.remove = __exit_p(amiga_audio_remove),
 	.driver = {
 		.name	= "amiga-audio",
 	},
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index d967e70a7058..b1e30a83dfb0 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -606,7 +606,7 @@ static struct platform_driver tegra_platform_hda = {
 		.of_match_table = hda_tegra_match,
 	},
 	.probe = hda_tegra_probe,
-	.remove_new = hda_tegra_remove,
+	.remove = hda_tegra_remove,
 	.shutdown = hda_tegra_shutdown,
 };
 module_platform_driver(tegra_platform_hda);
diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index 8e29c92830ad..f1b0cf9ea555 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -160,7 +160,7 @@ static SIMPLE_DEV_PM_OPS(snd_pmac_pm, snd_pmac_driver_suspend, snd_pmac_driver_r
 
 static struct platform_driver snd_pmac_driver = {
 	.probe		= snd_pmac_probe,
-	.remove_new	= snd_pmac_remove,
+	.remove		= snd_pmac_remove,
 	.driver		= {
 		.name	= SND_PMAC_DRIVER,
 		.pm	= SND_PMAC_PM_OPS,
diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 66b33623549f..39bf51ff43a1 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -599,7 +599,7 @@ static int snd_aica_probe(struct platform_device *devptr)
 
 static struct platform_driver snd_aica_driver = {
 	.probe = snd_aica_probe,
-	.remove_new = snd_aica_remove,
+	.remove = snd_aica_remove,
 	.driver = {
 		.name = SND_AICA_DRIVER,
 	},
diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index e7b6ce7bd086..e7b80328f0ef 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -383,7 +383,7 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
  */
 static struct platform_driver sh_dac_driver = {
 	.probe	= snd_sh_dac_probe,
-	.remove_new = snd_sh_dac_remove,
+	.remove = snd_sh_dac_remove,
 	.driver = {
 		.name = "dac_audio",
 	},
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index a1339f9ef12a..1b44119edfbc 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -2107,7 +2107,7 @@ static struct platform_driver cs4231_driver = {
 		.of_match_table = cs4231_match,
 	},
 	.probe		= cs4231_probe,
-	.remove_new	= cs4231_remove,
+	.remove		= cs4231_remove,
 };
 
 module_platform_driver(cs4231_driver);
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index b5d53c5550d3..69f1c9e37f4b 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2682,7 +2682,7 @@ static struct platform_driver dbri_sbus_driver = {
 		.of_match_table = dbri_match,
 	},
 	.probe		= dbri_probe,
-	.remove_new	= dbri_remove,
+	.remove		= dbri_remove,
 };
 
 module_platform_driver(dbri_sbus_driver);

base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
-- 
2.45.2

