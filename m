Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046621;
	b=ddq2MRX5lGgifWpMjmIUQt1PM8C24vZjAzb17Fdi9NcFLkwjrccNN/Djfr8mpQHsmoDr
	 wS9d+pI9lGV5NukrhzUGLuoCgvDjEOBp5OJRiCN28PxNPsdCEwfkwy0grCP5HGDBfpxAy
	 wz6EzJ4boY3hgA8qiR8vKVwpD/06gtz6P5CFDOSGh98nmTanTkt1t0MBG9UIA3BulhO9d
	 2CX7FDt1hq1DPG2+WrbcpKn2FZXQp15V6DP0plq+kwidOWHxV91lNrt2oi69PjtY+Cyd1
	 Pdf9JqWwz6NIkv5YGsXingkRdEUHymbr+qwNKUuePAMDjwuwYmRAp0tMMc2pDLQUEXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
	b=1uPaK20OFczwOBP5c9jt38riffNFpVRcdSbfbratYvUK6B6mVc1d1Y6u9Cc3z1EPaej3
	 q3w2JwZZ31dWNnv3jJsyTyLBMV/G55gWouqFTaNXgJay0dKVp4wQDptCfrdv42MSEuRkd
	 qKkZarD5umBR69Vc+/aW7HR/GDNu4dqqjSsdj4f1GBMAF+/7TZ+hkhbQt/jHDpVuGQVEh
	 /SJuSarKPbQ2Q4X8k9Ugq7oLGLHRJRyMVXXMunmatJIBg2Sen3t6yiZaRm41ncRlsqzkn
	 tvL3tDUOsRcG8QZG/JFwdiOaRpoiiL92ldh9Ipc8IVhvWxJHxxI4Wol25jNh085PasA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXya4JAu;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AAB606EE86
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9AAB606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXya4JAu
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1881708a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046619; x=1794651419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
        b=cXya4JAuj5tEUALyKmvNSPlWdirJXyYmgFDcWB/5JVyREb5d8ejPsldlzD12oiAjz2
         Kf54eb8Tr7R2RD/xHP1BTxC/jFoqJFtJ+0ukNcz9HXL/J2UgaJc01cDIbHeh2h5AQMmo
         rOJGLCaG9WwIhkluVCfvxh/o6Zq1ad13DWixV7/P0fbSG0AUCN6RZuZKbMnwdFuAmKn2
         t1M9kLwucpA91jANYMiUqxfNxUHzKPLT2idSF9MdfJ/Mw5HE0XWLKAwiW/wj7cCGL33U
         MN6oGXcjibltHyHF+lzImAHum1q++PzKgwPqw1UwTBs4+DjfNXk89vXLLE8gQWldtHAS
         oI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046619; x=1794651419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
        b=TzkdexJYUllTACY3NC2c81TVa3Ah3I1+jnLglm8Dl/dRybcyPPHB6XeXD7iuuMb0pD
         Bu2lA5Gy1tu0qAFVuo+wNV0nl6cyPYvZPYjAPkNZ4e/esAgzqr3+vHeuVRbpVTMukQfC
         jbtHh5jAPbHsJo4z8eBIcbONBFgiPX/05YP7GyAwpj/spzUfBAuevf5kQ9h5/nstUtwJ
         WWB2XvqQB3s465uG0MqtfQsNOUfw8I4lQJgvVpeH0rofMhe3K3vY7NDrG6EGq1kZ5sh4
         rqtxp08b/e2uQEYZKoik39hhMu47CqLzKaI5hp1KUsXLBKcudl7U6e2xucP+JP5gyCL2
         oFKQ==
X-Forwarded-Encrypted: i=1; AKwUvByhnd3yWjn2fu70I0pDhWtcFWwN0Rk7kVQ5uW+pj1n5/dOebTNMXofQ3e4XPFqVTfK24IAk9zbTVW388g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BR7UP4Ne2HG/eFQq4hr/jYK1l8tUb2L1qxI7AhBHY2KMw09Cs
	tio1vz9p+E0x837gYrVHK2IgoTyIFt9R1XOb5Cn8rI97GQjUWWIXHgUV
X-Gm-Gg: AYBFou1XAKMd0w1ZRpy12E4W9P1+JB3QSRdChO436KMYlVTvKkJGcK7iWT0dBMWxKSz
	HW8GyaYGcOk8AeRLsrmuOB5c0xvqfUpszdojHL6TkwM+d/Zpdx23jJRD+i/057YTi+tupBqvgqg
	8Di0GukVS5bY+hWs8wWN8ru/xdoG1tMAVTWykOph6tJyFhnoo2f+LlU48qpQ95Ueu9nW3XFv04n
	k56a5rEKfWrKzYacv9ptQGKPg4WklX+7Molw3SG3pObxt0Cwmo7Jh3hSFeqw7OJMrQ+WmDQr3x9
	h3p2hJPp7sGm8I0aKdl+dEOzuY2aKqbgzd8Wgj/ym3RC8bktZ2ZUO3KjDL1ulWCN+E5jEgDNEQm
	R7HG0XjCeo+ldXDBDrXUJE9qb8CBeEHuTDMj3pDexRlwgS+lcaCCHPXNpJKhEYT95uwFa4LgTkd
	CMheFjfKu3J6roqwZJeikPpWyWKxJN/qaOaidBnvKJ4oQqPFCFUCPu50s0l9XRBZncYERJ9ghrV
	9IchTb0awgwAyGiZo9Q0Fl3PmltDOdIEqBZalA3SdEY0HTZ3yItOBglg9NUavvsq4w9ZdnpO+0J
	HKL1CJjWBw2xIsVYXLulUvKDnOjdC+FRbcftJuQFhVfL386wRbukFuwOaAs7EXmvCwhEPmxStbV
	x4L/TBWNXV6ozF//c7H+WAxlmref49S9LeNyXhHriJDymeKENMsFtdA9O3ENRLN+OhNZzUyxRI3
	pwWabYQVfsFn44gmzaAn0pUIrQM4Z704E2cKN/33/gbZsLKjSFycDt
X-Received: by 2002:a05:6830:7182:b0:85e:f82d:4389 with SMTP id 46e09a7af769-85f1d001fdemr4006750a34.14.1794046618968;
        Sat, 07 Nov 2026 02:16:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:09 -0700
Subject: [PATCH 12/58] mtd: rawnand: arasan: retain chips across controller
 removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-12-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata, BCH state and controller storage until the last MTD
reference is released. Unregister and disconnect the chips before
releasing chip-select GPIOs, so notifier I/O and active NAND operations
finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 57 ++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 865754737f5f..57b5d6119b70 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1269,6 +1269,11 @@ static const struct nand_controller_ops anfc_ops = {
 	.detach_chip = anfc_detach_chip,
 };
 
+static void anfc_chip_release(struct nand_chip *chip)
+{
+	kfree(to_anand(chip));
+}
+
 static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 {
 	struct anand *anand;
@@ -1276,7 +1281,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1289,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1332,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, anfc_chip_release);
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1373,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1431,17 +1452,24 @@ static int anfc_parse_cs(struct arasan_nfc *nfc)
 	return 0;
 }
 
+static void anfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct arasan_nfc, controller));
+}
+
 static int anfc_probe(struct platform_device *pdev)
 {
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, anfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1509,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0

