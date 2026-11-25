Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624134;
	b=Ft6xwObsaCzE0mtzbamZvLl0rFFDTX0Rys7NcZvDAd8/JXC52IoDLjp0BWXo9vqvstvT
	 7LWNfBAZpUFT99CDrCB9wpfz94/GlXqiz8iUeaL9SpSccTtAjkRghryUcaFPMAKU3AIdQ
	 yvUl6yBkS8Nx9a0PvM1EeeiyuMbiUqr2ZQaW6JS1+iGKZdzgZLbejVqEsm5tJe7DiAbMn
	 RzxyOhII3L3dCuV6uX/EzwNNnnwjNabjbRPec8UPO4Q+E1EpuDEl+qQmIW9pwxQKmNJXM
	 roCt4P7vNwTFs4JBJH++uThF2/EZypAIc5lezAntL7xbK15uBtb7u81nr9zEvD7qVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SPkEQFnlch3M826K1nbOsToo0QTPVL1AgbPrEWQdOnU=;
	b=evN7qx4ZYx9NLMXzzCagu4CdDtj8UbDBX011/TUnk8aAEPxnTG2iyNQa4ONdqycnLPL2
	 Y0DDTBB+fRQpFLApWrju/MK5i2O+rafpacPMPlX2blwbB7ZsyUnfgS4OisJc35Ksl/H3q
	 o3bfK3ZsRLioz6/cI4UNov0B5gaSiali5H/ZeaOHR+jjMzeE9M7f5RsT6NWJIuo6kqCdW
	 hctlQ6bmVoQXT/49fbNqBoSQwCOxs4ZvQN4aZLxquiIaddaQSQjr+H3mbyFaL/Yv4B7qC
	 cHeof5WSHu+DKq9htnJQPoktAycZJSMno2hy7smW1ZSyT/dahKBMce16Fpmn+IbRrnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L8zSuzuQ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0ED606A336
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 16:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E0ED606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L8zSuzuQ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3475814f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 08:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624131; x=1796228931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPkEQFnlch3M826K1nbOsToo0QTPVL1AgbPrEWQdOnU=;
        b=L8zSuzuQniCHKiyDyLWs0a76OuVTpYS6pogJKczireN7mnlU6xxoIBUo31LJph+RmG
         4d5p03jQsrR03Xx8q0D1mMhKmqPyLwYHLuRCKkg6FHF/8yekB8ncjizakfQ2GDuupcVO
         DdmU3jdAmyOAPNXt2MTjG+O9zP2j8nONMzMtTPfJV5HO27FMrGE3sfT1w5YKfCxTDfES
         0QEb569J9VyNK7pwbEbgQsi/jNHG6BuhPUYgHeflAHv9GoWEaHj2ziC1LTFar6Ch5sND
         Z/8ATnq2D9wpY19zDAixCh0M5GLQIKWRNMTydjJpEjGiJBtsdxhurMMj7QBuyp3qGYV+
         UnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624131; x=1796228931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPkEQFnlch3M826K1nbOsToo0QTPVL1AgbPrEWQdOnU=;
        b=AxsWDMmhhxLU5sB+0V6v4WKZdUFbbhscY2GadDWMVCrPIzRbrD1iaODY4/XB0iJPKI
         PMTwm8T7kQ89BzH4XcaRuhgKaRht79PTV5T3CHrFmPOxFJbej4fP2C6bnva6JcrvT7dU
         gki33pLEFTfWUIo0/ROLZJmqZUpWaM3SHFXWDAKgnAuBhq9mjia9PBOjIOYmJAy12kKc
         mMfDbUSxrMgRBPMm+OZmVVPA3N7ckUyDgBSiJzG+bYQmJQghsCID/qSHFF19b4ynYRDU
         usLM70dz+lJQ2MAc8Zi7ksVNzIUES6vi87F+v6Bkv4amzuFa//B0m/CMkAh1LOn42H7A
         H/Dw==
X-Forwarded-Encrypted: i=1; AL+hErHu1hLMRuv4XSMLAFyZdlGwdZ2B9WzMA0BHkKIowSFC2rx9fpdbXWTwu0sbaGCz8pc9YUorQKejuJ3mzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PpCL2e/AUdJTLGDgg6RstqKbg5Zg5YANPCc9rZQc8Z4kJMn4R
	h8juzirbcC2+jv5IVPrupY+XiiRuOfcsl6fMF0JtOUDJcTZE4t5hswLoD0Awi3jQ6FM=
X-Gm-Gg: AZFdTZekRR2XjkEgPrys2z58gdb9RLl1UVHSbq5poyt7iScfDaDWoCmzc0U3WuQgVKZ
	95lb4jR3h7OGTiYvjd/XYX4UWgwtXZruRSbSRRURsBPYRtUZuYZlSULj8HBN5/C+YAeFfwu311T
	+f7dpjU9qS2k8DRXM0+r777K+1p3GC2XSNPep6TRjSMKBa2+7ADsmueH82JJOqaj4I2vHz+Vrg9
	U9lpED2cr3rDz9TR84T4wVSGwykBkT+s0g2/MDvqqVTiXaM7D7Xu229ZMUa0rYpWSKwBnQ7FdB+
	SBEMTZGTmcJ7sIt7yMolJc4r81ijyqK33juC+55Q3HZPtmz3Q6ovQfbypF5zI5ymYYi8zQ5L4gl
	PeSQ7Q2dE7EdunXffXufoLDB2886xTXZ+j2US9Qjj39mRTxS84rkcZbO0w0UcIVscanfsReypqu
	j9iO9H5coTyaPxPgmbZ0uST+kwCyPezohVLvg7v3IK6urMj278e+xvs6VMdidf8LA5OuG+CA8m6
	MuToBO4tdwWb0ZYv6hcjLkA1qlh2ocifXR2YttfIm5p11wN5qHoTRIy/Y4tD5pWz0NnQVySKnMa
	0D2dV5PRBJvF//7/GFZj3zev9+oDqO0HAG/b4MDc9eogeg==
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr449301605e9.12.1795624131341;
        Wed, 25 Nov 2026 08:28:51 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:50 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:32 +0000
Subject: [PATCH 06/10] mtd: nand: raw: Unify list terminator for
 *_device_id lists
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-6-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=29220;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=ogN35igAdmAQARye14kV66pF9fX/X8mhynfCot9vq2s=;
 b=oqaHJS7K80qz+dmd+raQd0Nore7mYsZ6gc0u74j64TH1P5RCZOKkGJLKTUxPoK8ViqzdSqlca
 deOA5tfWovZAaO4GYpcDMpVN67tLZKuOMU004zmRiX6cVSRFyI5reBS
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/nand/raw/ams-delta.c                      | 7 ++-----
 drivers/mtd/nand/raw/arasan-nand-controller.c         | 2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c          | 4 ++--
 drivers/mtd/nand/raw/atmel/pmecc.c                    | 4 ++--
 drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c          | 2 +-
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c           | 2 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c              | 2 +-
 drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c          | 2 +-
 drivers/mtd/nand/raw/brcmnand/iproc_nand.c            | 2 +-
 drivers/mtd/nand/raw/cadence-nand-controller.c        | 3 ++-
 drivers/mtd/nand/raw/davinci_nand.c                   | 2 +-
 drivers/mtd/nand/raw/denali_dt.c                      | 2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c                  | 2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                   | 2 +-
 drivers/mtd/nand/raw/fsl_upm.c                        | 2 +-
 drivers/mtd/nand/raw/fsmc_nand.c                      | 2 +-
 drivers/mtd/nand/raw/gpio.c                           | 2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c            | 2 +-
 drivers/mtd/nand/raw/hisi504_nand.c                   | 2 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c       | 2 +-
 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c            | 2 +-
 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c             | 2 +-
 drivers/mtd/nand/raw/ingenic/jz4780_bch.c             | 2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c          | 2 +-
 drivers/mtd/nand/raw/loongson-nand-controller.c       | 2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                    | 2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                    | 2 +-
 drivers/mtd/nand/raw/marvell_nand.c                   | 4 ++--
 drivers/mtd/nand/raw/meson_nand.c                     | 2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c                    | 2 +-
 drivers/mtd/nand/raw/mtk_nand.c                       | 2 +-
 drivers/mtd/nand/raw/mxc_nand.c                       | 2 +-
 drivers/mtd/nand/raw/mxic_nand.c                      | 2 +-
 drivers/mtd/nand/raw/ndfc.c                           | 2 +-
 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c | 2 +-
 drivers/mtd/nand/raw/omap_elm.c                       | 2 +-
 drivers/mtd/nand/raw/orion_nand.c                     | 2 +-
 drivers/mtd/nand/raw/pasemi_nand.c                    | 2 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c          | 2 +-
 drivers/mtd/nand/raw/plat_nand.c                      | 2 +-
 drivers/mtd/nand/raw/qcom_nandc.c                     | 2 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c       | 2 +-
 drivers/mtd/nand/raw/sh_flctl.c                       | 2 +-
 drivers/mtd/nand/raw/socrates_nand.c                  | 2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c                | 2 +-
 drivers/mtd/nand/raw/sunxi_nand.c                     | 2 +-
 drivers/mtd/nand/raw/technologic-nand-controller.c    | 2 +-
 drivers/mtd/nand/raw/tegra_nand.c                     | 2 +-
 drivers/mtd/nand/raw/vf610_nfc.c                      | 2 +-
 drivers/mtd/nand/raw/xway_nand.c                      | 2 +-
 50 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index d6c3ed0f858c..99260764d8ac 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -413,9 +413,7 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id gpio_nand_of_id_table[] = {
-	{
-		/* sentinel */
-	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_nand_of_id_table);
 #endif
@@ -423,9 +421,8 @@ MODULE_DEVICE_TABLE(of, gpio_nand_of_id_table);
 static const struct platform_device_id gpio_nand_plat_id_table[] = {
 	{
 		.name	= "ams-delta-nand",
-	}, {
-		/* sentinel */
 	},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, gpio_nand_plat_id_table);
 
diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 7ff57abf61f7..6f36de9f0b99 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1497,7 +1497,7 @@ static const struct of_device_id anfc_ids[] = {
 	{
 		.compatible = "arasan,nfc-v3p10",
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, anfc_ids);
 
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 24bf93409364..2651d5d40f77 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1985,7 +1985,7 @@ static const struct of_device_id __maybe_unused atmel_ebi_csa_regmap_of_ids[] =
 		.compatible = "microchip,sam9x60-sfr",
 		.data = &sam9x60_ebi_csa,
 	},
-	{ /* sentinel */ },
+	{ }
 };
 
 static int atmel_nand_attach_chip(struct nand_chip *chip)
@@ -2584,7 +2584,7 @@ static const struct of_device_id atmel_nand_controller_of_ids[] = {
 		.compatible = "atmel,sama5d2-nand",
 		.data = &atmel_rm9200_nand_caps,
 	},
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, atmel_nand_controller_of_ids);
 
diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 37ce23d526b3..c825996810c0 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -921,7 +921,7 @@ static struct atmel_pmecc_caps sama5d2_caps = {
 static const struct of_device_id __maybe_unused atmel_pmecc_legacy_match[] = {
 	{ .compatible = "atmel,sama5d4-nand", &sama5d4_caps },
 	{ .compatible = "atmel,sama5d2-nand", &sama5d2_caps },
-	{ /* sentinel */ }
+	{ }
 };
 
 struct atmel_pmecc *devm_atmel_pmecc_get(struct device *userdev)
@@ -973,7 +973,7 @@ static const struct of_device_id atmel_pmecc_match[] = {
 	{ .compatible = "atmel,at91sam9g45-pmecc", &at91sam9g45_caps },
 	{ .compatible = "atmel,sama5d4-pmecc", &sama5d4_caps },
 	{ .compatible = "atmel,sama5d2-pmecc", &sama5d2_caps },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, atmel_pmecc_match);
 
diff --git a/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
index 51b1125d036b..d5316357a2f4 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
@@ -111,7 +111,7 @@ static int bcm6368_nand_probe(struct platform_device *pdev)
 
 static const struct of_device_id bcm6368_nand_of_match[] = {
 	{ .compatible = "brcm,nand-bcm6368" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm6368_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
index 674fcda05bb1..42aee603e8b6 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
@@ -106,7 +106,7 @@ static int bcmbca_nand_probe(struct platform_device *pdev)
 
 static const struct of_device_id bcmbca_nand_of_match[] = {
 	{ .compatible = "brcm,nand-bcm63138" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bcmbca_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 78937498cc02..220d47acf852 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3241,7 +3241,7 @@ static const struct of_device_id __maybe_unused brcmnand_of_match[] = {
 	{ .compatible = "brcm,brcmnand-v7.1" },
 	{ .compatible = "brcm,brcmnand-v7.2" },
 	{ .compatible = "brcm,brcmnand-v7.3" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, brcmnand_of_match);
 
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c b/drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c
index 8ed64613fda5..850f8ae3dc1c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c
@@ -11,7 +11,7 @@
 
 static const struct of_device_id brcmstb_nand_of_match[] = {
 	{ .compatible = "brcm,brcmnand" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, brcmstb_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/brcmnand/iproc_nand.c b/drivers/mtd/nand/raw/brcmnand/iproc_nand.c
index f2ef3b7a0943..64aca9e45848 100644
--- a/drivers/mtd/nand/raw/brcmnand/iproc_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/iproc_nand.c
@@ -128,7 +128,7 @@ static int iproc_nand_probe(struct platform_device *pdev)
 
 static const struct of_device_id iproc_nand_of_match[] = {
 	{ .compatible = "brcm,nand-iproc" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, iproc_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index e19ceb2d5dfc..0bfa1fc4a0e1 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3255,7 +3255,8 @@ static const struct of_device_id cadence_nand_dt_ids[] = {
 	{
 		.compatible = "cdns,hp-nfc",
 		.data = &cadence_nand_default
-	}, {}
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, cadence_nand_dt_ids);
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 20aebe101e8d..41ede6b55e01 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -530,7 +530,7 @@ static const struct mtd_ooblayout_ops hwecc4_large_ooblayout_ops = {
 static const struct of_device_id davinci_nand_of_match[] = {
 	{.compatible = "ti,davinci-nand", },
 	{.compatible = "ti,keystone-nand", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 01733238dac9..77312ef6f36e 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -74,7 +74,7 @@ static const struct of_device_id denali_nand_dt_ids[] = {
 		.compatible = "socionext,uniphier-denali-nand-v5b",
 		.data = &denali_uniphier_v5b_data,
 	},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index c655d27bc4cc..64cf21daf34a 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -989,7 +989,7 @@ static void fsl_elbc_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id fsl_elbc_nand_match[] = {
 	{ .compatible = "fsl,elbc-fcm-nand", },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, fsl_elbc_nand_match);
 
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index d5d0c7c7bfba..396cf2a90baa 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -1108,7 +1108,7 @@ static const struct of_device_id fsl_ifc_nand_match[] = {
 	{
 		.compatible = "fsl,ifc-nand",
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, fsl_ifc_nand_match);
 
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 8896720be505..3f24efd5ce64 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -249,7 +249,7 @@ static void fun_remove(struct platform_device *ofdev)
 
 static const struct of_device_id of_fun_match[] = {
 	{ .compatible = "fsl,upm-nand" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_fun_match);
 
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index eee00c6f43e0..40e5f6004c25 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1220,7 +1220,7 @@ static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
 static const struct of_device_id fsmc_nand_id_table[] = {
 	{ .compatible = "st,spear600-fsmc-nand" },
 	{ .compatible = "stericsson,fsmc-nand" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, fsmc_nand_id_table);
 
diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 63853d7a8104..552a8b09b934 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -178,7 +178,7 @@ static const struct nand_controller_ops gpio_nand_ops = {
 #ifdef CONFIG_OF
 static const struct of_device_id gpio_nand_id_table[] = {
 	{ .compatible = "gpio-control-nand" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 019df54c4bb0..b0ba72530d6c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2778,7 +2778,7 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 	{ .compatible = "fsl,imx6sx-gpmi-nand", .data = &gpmi_devdata_imx6sx, },
 	{ .compatible = "fsl,imx7d-gpmi-nand", .data = &gpmi_devdata_imx7d,},
 	{ .compatible = "fsl,imx8qxp-gpmi-nand", .data = &gpmi_devdata_imx8qxp, },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index c5063d681476..4eec071826e7 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -847,7 +847,7 @@ static SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);
 
 static const struct of_device_id nfc_id_table[] = {
 	{ .compatible = "hisilicon,504-nfc" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, nfc_id_table);
 
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 631db0e93a36..9a08d4778d1a 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -541,7 +541,7 @@ static const struct of_device_id ingenic_nand_dt_match[] = {
 	{ .compatible = "ingenic,jz4740-nand", .data = &jz4740_soc_info },
 	{ .compatible = "ingenic,jz4725b-nand", .data = &jz4725b_soc_info },
 	{ .compatible = "ingenic,jz4780-nand", .data = &jz4780_soc_info },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ingenic_nand_dt_match);
 
diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
index 2d0e0a2192ae..8fcf0fa51e4c 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -277,7 +277,7 @@ static const struct ingenic_ecc_ops jz4725b_bch_ops = {
 
 static const struct of_device_id jz4725b_bch_dt_match[] = {
 	{ .compatible = "ingenic,jz4725b-bch", .data = &jz4725b_bch_ops },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, jz4725b_bch_dt_match);
 
diff --git a/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
index 54e377754a6c..d2dc3c435197 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
@@ -179,7 +179,7 @@ static const struct ingenic_ecc_ops jz4740_ecc_ops = {
 
 static const struct of_device_id jz4740_ecc_dt_match[] = {
 	{ .compatible = "ingenic,jz4740-ecc", .data = &jz4740_ecc_ops },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_ecc_dt_match);
 
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index 12b5b0484fe9..ced16093b692 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -252,7 +252,7 @@ static const struct ingenic_ecc_ops jz4780_bch_ops = {
 
 static const struct of_device_id jz4780_bch_dt_match[] = {
 	{ .compatible = "ingenic,jz4780-bch", .data = &jz4780_bch_ops },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, jz4780_bch_dt_match);
 
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index cfb4b231e067..b26307be3265 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -724,7 +724,7 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id ebu_nand_match[] = {
 	{ .compatible = "intel,lgm-ebunand" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ebu_nand_match);
 
diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 320d009ebf8c..dda70973863d 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -1003,7 +1003,7 @@ static const struct of_device_id loongson_nand_match[] = {
 		.compatible = "loongson,ls2k1000-nand-controller",
 		.data = &ls2k1000_nand_data,
 	},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, loongson_nand_match);
 
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index a54c14134f75..947953801000 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -874,7 +874,7 @@ static int lpc32xx_nand_suspend(struct platform_device *pdev, pm_message_t pm)
 
 static const struct of_device_id lpc32xx_nand_match[] = {
 	{ .compatible = "nxp,lpc3220-mlc" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, lpc32xx_nand_match);
 
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 9c5412dd3891..7389f57d8d71 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -993,7 +993,7 @@ static int lpc32xx_nand_suspend(struct platform_device *pdev, pm_message_t pm)
 
 static const struct of_device_id lpc32xx_nand_match[] = {
 	{ .compatible = "nxp,lpc3220-slc" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, lpc32xx_nand_match);
 
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 32035c8d43b8..ceea85b25a61 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -3138,7 +3138,7 @@ static const struct platform_device_id marvell_nfc_platform_ids[] = {
 		.name = "pxa3xx-nand",
 		.driver_data = (kernel_ulong_t)&marvell_pxa3xx_nfc_legacy_caps,
 	},
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, marvell_nfc_platform_ids);
 
@@ -3172,7 +3172,7 @@ static const struct of_device_id marvell_nfc_of_ids[] = {
 		.compatible = "marvell,pxa3xx-nand",
 		.data = &marvell_pxa3xx_nfc_legacy_caps,
 	},
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, marvell_nfc_of_ids);
 
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b2a9d4043019..61aa83955b9d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1539,7 +1539,7 @@ static const struct of_device_id meson_nfc_id_table[] = {
 		.compatible = "amlogic,meson-axg-nfc",
 		.data = &meson_axg_data,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 75a97f735ee3..4bfb6befe519 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -814,7 +814,7 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 static const struct of_device_id mpc5121_nfc_match[] = {
 	{ .compatible = "fsl,mpc5121-nfc", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mpc5121_nfc_match);
 
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 8f943b53b016..8e9d35894471 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1499,7 +1499,7 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 		.compatible = "mediatek,mt7622-nfc",
 		.data = &mtk_nfc_caps_mt7622,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 52fe64f4355a..d42a8ff5db9f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1390,7 +1390,7 @@ static const struct of_device_id mxcnd_dt_ids[] = {
 	{ .compatible = "fsl,imx25-nand", .data = &imx25_nand_devtype_data, },
 	{ .compatible = "fsl,imx51-nand", .data = &imx51_nand_devtype_data, },
 	{ .compatible = "fsl,imx53-nand", .data = &imx53_nand_devtype_data, },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
 
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index f07770f9a424..5c04803b4172 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -567,7 +567,7 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 static const struct of_device_id mxic_nfc_of_ids[] = {
 	{ .compatible = "mxic,multi-itfc-v009-nand-controller", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mxic_nfc_of_ids);
 
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..86b31c9e377a 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -248,7 +248,7 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 static const struct of_device_id ndfc_match[] = {
 	{ .compatible = "ibm,ndfc", },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ndfc_match);
 
diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 1a36b227ddeb..ceb1ad14482d 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -1007,7 +1007,7 @@ static void ma35_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id ma35_nand_of_match[] = {
 	{ .compatible = "nuvoton,ma35d1-nand-controller" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ma35_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 6736dac26b2d..1530a0f6d621 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -548,7 +548,7 @@ static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
 static const struct of_device_id elm_of_match[] = {
 	{ .compatible = "ti,am3352-elm" },
 	{ .compatible = "ti,am64-elm" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, elm_of_match);
 #endif
diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index dfa49ad1f55e..2767fa4102f6 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -205,7 +205,7 @@ static void orion_nand_remove(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id orion_nand_of_match_table[] = {
 	{ .compatible = "marvell,orion-nand", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, orion_nand_of_match_table);
 #endif
diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..aef2cb002315 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -225,7 +225,7 @@ static const struct of_device_id pasemi_nand_match[] =
 	{
 		.compatible   = "pasemi,localbus-nand",
 	},
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, pasemi_nand_match);
diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index cb7eb29a182a..cdf87f2550c2 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1192,7 +1192,7 @@ static void pl35x_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id pl35x_nand_of_match[] = {
 	{ .compatible = "arm,pl353-nand-r2p1" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, pl35x_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index 915ea5361592..bf02a5c41ad1 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -159,7 +159,7 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id plat_nand_match[] = {
 	{ .compatible = "gen_nand" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, plat_nand_match);
 
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index abca02f54d74..52682adfa950 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2295,7 +2295,7 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,sdx55-nand",
 		.data = &sdx55_nandc_props,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
 
diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index dbc195db9ef0..c7292a22db8b 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1370,7 +1370,7 @@ static const struct of_device_id rk_nfc_id_table[] = {
 		.compatible = "rockchip,rv1108-nfc",
 		.data = &nfc_v8_cfg
 	},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
 
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 7d7bbf764555..c870a12b5f85 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1083,7 +1083,7 @@ static struct flctl_soc_config flctl_sh7372_config = {
 static const struct of_device_id of_flctl_match[] = {
 	{ .compatible = "renesas,shmobile-flctl-sh7372",
 				.data = &flctl_sh7372_config },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_flctl_match);
 
diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index a5125e0c8cdb..b3f39617b70f 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -220,7 +220,7 @@ static const struct of_device_id socrates_nand_match[] =
 	{
 		.compatible   = "abb,socrates-nand",
 	},
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, socrates_nand_match);
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 56c34328ce24..e0b90364569c 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -2143,7 +2143,7 @@ static const struct of_device_id stm32_fmc2_nfc_match[] = {
 		.compatible = "st,stm32mp25-fmc2-nfc",
 		.data = &stm32_fmc2_nfc_mp25_data,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32_fmc2_nfc_match);
 
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 38e67d350300..f3e1a9a03b59 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2809,7 +2809,7 @@ static const struct of_device_id sunxi_nfc_ids[] = {
 		.compatible = "allwinner,sun50i-h616-nand-controller",
 		.data = &sunxi_nfc_h616_caps,
 	},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
 
diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index 56d257fc2c2a..0e365168e10b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -203,7 +203,7 @@ static void ts72xx_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id ts72xx_id_table[] = {
 	{ .compatible = "technologic,ts7200-nand" },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ts72xx_id_table);
 
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 199b3a8e552a..72edc6d8d771 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1268,7 +1268,7 @@ static const struct dev_pm_ops tegra_nand_pm = {
 
 static const struct of_device_id tegra_nand_of_match[] = {
 	{ .compatible = "nvidia,tegra20-nand" },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_nand_of_match);
 
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 6ab3c440eac7..cc080cbe89e3 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -719,7 +719,7 @@ static int vf610_nfc_write_oob(struct nand_chip *chip, int page)
 
 static const struct of_device_id vf610_nfc_dt_ids[] = {
 	{ .compatible = "fsl,vf610-nfc", .data = (void *)NFC_VFC610 },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, vf610_nfc_dt_ids);
 
diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index a946d4d2cff4..14d5ca28c8d5 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -250,7 +250,7 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id xway_nand_match[] = {
 	{ .compatible = "lantiq,nand-xway" },
-	{},
+	{ }
 };
 
 static struct platform_driver xway_nand_driver = {

-- 
2.53.0

