Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624140;
	b=ezKr0J9ywWghd3N+oZA5XlPwVz0KpFZtN0xxt5mSm40nIDc8H3LR2Csd02CWxpGUoQWM
	 +tkVNW+CixcupKXr3Sms5+MGJRm4tPnvOUGrc3fJ4Baf9HmwZdR6Gml4jawp4c7r/fdfL
	 4YJnUI6xUVw9DwzzAb2us3VCNVw9NR2yYQcCrN3eNqdS5vqUrsG2CgpiEdhmsV3xU/erm
	 4/POltrclTH7ykC8Wai3J02kRzoPd3jhInfUgaaiRytoFVKMtBraF6Nv2BSSvQKSBk0qC
	 LmcaWV+afOZXJ0CXw/TfYlcYcquJpl8BBUYvDzBjys6C46U4iSx2hch15ichcZ8TzNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=usivc3aw+SwZhFpcmlLANBBx5LV9rhkWEtYn4/TGjV4=;
	b=gaSAKaYAtHe3xzdDMM5WHop8cVyLgtriMiTCO6jUPFSVKPr5QIhoqMIHY9LaRRNv5tz6
	 dvWg8rhBFYrDjfQQwfjZa1IxJ8pVjAJsb0R/lVRPf22QBGcvnVVjbimpNTXhtTh9YTiI5
	 uaQVlt2ixtFxfZ0Ka3EN3hcn7cdkn6/+z95EU0T48lc3EgPPTCERU6JNuwK3kprPNGHJT
	 uy2Qw596oSKj0/tMTNN2wKTa9a7tOffQft5bvErbxtxoglicmN0WDJEaTjU/MY1+bhbAQ
	 SSJ781oPCcJOabX6nzvv0Tpv3o1n0GiZXoHezDPTczy2U6KaDi+59tVA9eZAigw76PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q75IOC6H;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE2606A32C
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 16:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFE2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q75IOC6H
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so48210665e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 08:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624138; x=1796228938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usivc3aw+SwZhFpcmlLANBBx5LV9rhkWEtYn4/TGjV4=;
        b=q75IOC6HdZt2zgHxtl2jyyUDOUe0TzG2VeBGKag0EqoJgtT6LkyQAkc99ZjY9anujf
         gJ99RSdZEAwMizhK/RXdxbD+XWzp0hW+775pmIfkWGuNi8xI2LWmdARm81hMKalS/mSC
         YTWq27U2bCnUcXKJTz378PdEdCQscOAo4vp7gLmVs7Blz3TCFRAoAhd8gNdXgpP/RzPs
         WHoiJrooZBGjWhMvMWfr47CTJ3CulBE0yM1WKtCsQqwywekiEALHJr3NjS384nH25nLh
         miQFObUSo/OwFIKUjvSFWyxKx4RyTc4UTiuAR7oOJRg6TXdcB+/2DAfbmzcU4i63p8TO
         MQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624138; x=1796228938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usivc3aw+SwZhFpcmlLANBBx5LV9rhkWEtYn4/TGjV4=;
        b=ybJVm8QXjcm9C0sJuwGJRcFEAtbedxGA5hnl1+XQ7OxwCcWoC+XP4I5u1DQMyacAAL
         zMBn7bsY0GWqC8BNZ84efU8j89MB56ZZyLKpm5URUjkr8KFHXNXLPenggKakprPpsNg/
         c/YrLFmmQTkfaw/q8xD9MFANiiX9W13WO1/PhWGjyVevGFHDn9e0PTwpOg8kI4gfe8P3
         +ZlN2m2Fe9U5S7YiDnVsD4kvzleNJGEaQktiQ4qUFnzleDFLIfuGS7tzd/1HmssQOIrM
         +NHcH9z358o0p+ip5piOUCNEhvKHUAEJDIqa6V+M4SIEgY8YUf6KTagxYR6HSgY/P9hv
         8o6w==
X-Forwarded-Encrypted: i=1; AL+hErE6O1StFAuKgdRP6FnM06qCkPVLKMrBYivYetLugqEnDeKAPP/07ZYo+zQl6fIuS5EBTTXJhTqXcKoeNg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GAH6947lE7zOt7eTYj2pRtugNVOtY6yMasy3dAJNZVtpuy7pP
	rUxRTD+huKMhHQSNfdVLhb3eN8GOo5/Jyq4k0aLtm5DoPsozCCA1+rPVuXVxq2bpnRs=
X-Gm-Gg: AZFdTZenuU4mjse2QGHbmr7K9cDzQ2qY0iPMFCC+yD7ECu7k7NN1CiOWxLWpB/yUmHo
	oxb4FG0FAT+n/EDRiozu9yCIfZP2By88wa13knaqtmzFxSk/StNKuC2GpsKbjZiDIacYqYbX2vs
	tjlBhEy6hwPJdSc8N1ge5G0GlE7w5UoxAvgmou7o/En7MMjqsqJ4s4b9tn+kqklXsVQaW3Ayoid
	9gkznIWF8SRy0bx9d/AYBP4t3A9HN1wqz+az5PHw2seK/gr2UsrkpLyYwelonmRBaR14z00NtuF
	55AnstmVjx65WBu6x1gpoo8coLslcoe5kcUQ79aR9C2sajIdpBfSP0WZpsHSGlXrb7hoomCdYV7
	o3PRfJzHc77mPHegkXOzaXntpndlswFF6xq/apYOsCoO8RttRDLF3OAs9EksUzZ6bp8YCAsbcvb
	G7kQOvmX2B1rGB17pRthM5DAChEkilHufgx0mxXL7y8U9J3uPeW66cLNQPNVVN+V7fSIxSRtPbR
	pI9YchoMuSlDc0a2ZS50ZxJ3nub9InGL9vgGcoM3r6Z4aJyGR7SAD+7JuHQZIEmNekV00Da1KAC
	em3qJtJ4IYozWqNXnqQa8rj7lVVAFKmK2/KhhVBH55TyXQ==
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr326163005e9.33.1795624138113;
        Wed, 25 Nov 2026 08:28:58 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:57 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:35 +0000
Subject: [PATCH 09/10] mtd: nand: Unify list terminator for *_device_id
 lists
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
Message-Id: <20261125-acpi-mtd-v1-9-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=3557;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=9ka96uW8uhmroEA/0ZZ34Gp8KmZZTisL0Zd9lgRMCU8=;
 b=yB/JEeg0v8nqIyAE1Ke9wfd7YSoLKw89W0zAl6SaarFMyVewyRV7wv5K6GuML97H9SyfICVK7
 YkN/iHx9aUKBHks9vSsfAxGp+5LM/eiSvtDjgwuVeS/5BBkSfzY+erw
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/nand/ecc-mtk.c                 | 2 +-
 drivers/mtd/nand/ecc-mxic.c                | 2 +-
 drivers/mtd/nand/ecc-realtek.c             | 2 +-
 drivers/mtd/nand/onenand/onenand_omap2.c   | 2 +-
 drivers/mtd/nand/onenand/onenand_samsung.c | 3 ++-
 drivers/mtd/nand/spi/core.c                | 4 ++--
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index a3a285170fcd..854f513c4952 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -530,7 +530,7 @@ static const struct of_device_id mtk_ecc_dt_match[] = {
 		.compatible = "mediatek,mt7986-ecc",
 		.data = &mtk_ecc_caps_mt7986,
 	},
-	{},
+	{ }
 };
 
 static int mtk_ecc_probe(struct platform_device *pdev)
diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 41ee49419798..30434ec8f6a0 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -859,7 +859,7 @@ static const struct of_device_id mxic_ecc_of_ids[] = {
 	{
 		.compatible = "mxicy,nand-ecc-engine-rev3",
 	},
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mxic_ecc_of_ids);
 
diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
index fb573c7f2280..a59b6ecbdd19 100644
--- a/drivers/mtd/nand/ecc-realtek.c
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -448,7 +448,7 @@ static const struct of_device_id rtl_ecc_of_ids[] = {
 	{
 		.compatible = "realtek,rtl9301-ecc",
 	},
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rtl_ecc_of_ids);
 
diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index 4c1379343fbd..9efde604e0eb 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -587,7 +587,7 @@ static void omap2_onenand_remove(struct platform_device *pdev)
 
 static const struct of_device_id omap2_onenand_id_table[] = {
 	{ .compatible = "ti,omap2-onenand", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, omap2_onenand_id_table);
 
diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index 8c2d3866a6d6..bf516130130e 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -984,7 +984,8 @@ static const struct platform_device_id s3c_onenand_driver_ids[] = {
 	}, {
 		.name		= "s5pc110-onenand",
 		.driver_data	= TYPE_S5PC110,
-	}, { },
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s3c_onenand_driver_ids);
 
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 22756832eacf..75a012770f63 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -2104,14 +2104,14 @@ static int spinand_remove(struct spi_mem *mem)
 
 static const struct spi_device_id spinand_ids[] = {
 	{ .name = "spi-nand" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, spinand_ids);
 
 #ifdef CONFIG_OF
 static const struct of_device_id spinand_of_ids[] = {
 	{ .compatible = "spi-nand" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spinand_of_ids);
 #endif

-- 
2.53.0

