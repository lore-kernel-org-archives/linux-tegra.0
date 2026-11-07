Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046626;
	b=gjNUjMKKcbdsRdCb/HL4ULcp+vP+DMVG8KJACthT5BV8Gg7KxkuKAEc1vDfN4S1EZ5mZ
	 o1Y3RCe8vOSySGbaIIOdcYA543rw19CpZMrrut/eqNi2ll2YOASJDFmTeysQpw5ptKqyr
	 icG8c0P8ES+9oeDNXDfXDuCpajaiPVUCXQXqZCWVrOHiFLt5nG8ZYLAd+sdfFItMnDFDO
	 JqBtIG6oH+EdnznQfqWflgQt4mf3bYhh+htS0/mY+pd4eFDgqyqWXMtRQREKgup2B5XAn
	 awl/Sqlkqjn/9viqDMXN+D5NY+ewIh2E7oWa0IBkaQLiLPcmvOeGH5Fp5v2lcbohawA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
	b=1zzk10oJAhanhO2edfuwit8sI7gLEQDTB70lVx+Qio00KY6a9/1QjD3fFC4EsKhn7fIC
	 EjeDf5t+GhLxKcJfKw3T/nPXCL5ahBJV/Nxo1LaZwzXiupCPFbhZaiF+k0VvaNg8eLoBr
	 He6gbgJvkWYrGGS/kf4xGd7q8lHyvlq7FWsseuYxzVuJzlfczrr3e69izIXosmOeQcwd0
	 rpVe0V4kERdx+NWT1TpTq88PDbI/h6Q5CtxFEadsmkj9/AsVnDhUST49mP6p+gxoAPPmk
	 BrNzHkKQsW7nSR9Hy7MW3PNCA6bUcRxOXe9ntRc6HWn+2KwLy088YwYqNKjxB0qyD4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1iBT70m;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1D60A3810
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F1D60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1iBT70m
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-833e671ee9fso1573573a34.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046625; x=1794651425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=V1iBT70mVG9wwLbrqhjeZf7YBnAvB7h28aXBX5rG91Ifz0uWckD7JUISKRdc1cNesu
         UDTdDTGugMPkmC/jcPLmuPZjqoMb5v4p4PyPsyQ51ryIx10Jc75oxTDtrxscn/ZSlbYg
         NFVDsDym462lUl8e4dU56lkLbTROl2C6+p9GerUvV2UHlDKdWcwFZsdxBCByR+zA7oiQ
         KoO+uh7ixyp4UlhFT5wpcys3w3RWL2bSLEkX9Awsk7MiWSxeo7H581L5ravwDoHt38um
         S8Ra2RDmtd+S2f+JWuybnOIsdrwVU6XSJpHuceMcHDplR4otS1joyymV81TADZVTzYOR
         2pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046625; x=1794651425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=tSNPV0/4SorUYjvFVeDYbqjyiq6q+bhdqPjc3ygLpHTHiP0jYsYeIPL+4tJTQsHDm0
         +cRsilRqAaavjOjNKNb74+cXoeCIJv5Be5YSCsE0ZoFn9lzxOexa/C4RMcfyh8z+zKL9
         X1CUQUOjSgCdniaxvMY9niASb6C3k7KWO5kSH0++ROTT7vsT/8jGFwucYSLUi+guafPr
         UxAwJdkySw8+0ECmiGHmb+dGu3xgVueVUHboFD7jKtPwJeTMyXCF8DqM1w/168EKg4Wu
         +Nl7sRVQg3iFvHfpkPDXhWTjlUE5zQA6K2ymxFaY7fSts7d4t32tg0EUcf4etvRc5j84
         8jqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBmCSibMf13DuIt1R1Qg4AFMEKk2YGZ9fibOWNRXzbihGUIG4rL07MPtz/aCVHI6y9fEQ5QmPOApD9jA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uWFJcYeEWUR3DqeO6AMgSZ22rQXae+SSDJ6/zVFKyqqOF+umW
	u1e31X/MfXnhKWBFVp2Uf5zaJHALoDNYitjc8UKqjTnRkkqBcug3B4Lr
X-Gm-Gg: AYBFou0Iewbzr1uqUvvKWHUG+WZfm6hwdVGvJH9NFJgHzRDrhDe9uy+Z5az6MBV7wSX
	BpyPDbfOFsScoE27PwM0BiwD3vzPNmjbbgYMD0NpLmxRN2E/LClfQy4QaH3gtmRf5X3BV92jjMs
	v48gC2kubmpp42EYshxNJdAVVG6ZXi0pB4e08j9wtAwbP8EtMndnBI5SoGtlAwuFFbOyi9mDX3I
	UGYpltx00f89dNxez0GyhML3hewfRh5SE+cqVWbRksPOeFllMF2zS+RzjvbUo2t2BFUJ/bbc9Sg
	+ITGMkEP5ZcoTNuLOTlKphzoThuY1o2yet7c6QDa7gmFF1PLvkpk8zwUeoBVTNxWNiaJ/ZAn2Vx
	5s9ii4JKzRITrmqCrj3SQ3SYQptYkmTpuXsLISU14j/efm/wIGnc8qujezcd3MYwiK4fsjthaI4
	DeGZJUMAlpVhowEzjeWxIx4jKULQYIaPfauL0WRaEdJwCWgzKgLgHOkdGtfKxXIxRfV1uvTtHUn
	8PEoIdMA87ahK+epYrmDI/DkvDhUVREr0m1a5D1llz4zUcnkAw8Mw4FOFewiBbfkm73RsOslaRZ
	NxznZYd9xlAU8H6g/7YrU3fopkA/e0E9xhLDIAVYCKw9fS3qNrR6GJ2jvCTHu3P5+8lRdyfURoL
	TPZfSd8T4J3Eio6bClt4a42UvNnvaHnIAoMG9kf4VfjG6rf8iKdnwHaGRhERnwlOCxoSDOZ5x75
	7V1AUUKR13TSy4C5C7FvxKvk+Q4OuO/E6hIKW1sb9FTUuby5YntUxu
X-Received: by 2002:a05:6830:4ac6:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85f1d0d0beamr4517941a34.25.1794046624830;
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:11 -0700
Subject: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..e4a24e69ebbc 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,15 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_dma;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -715,9 +728,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

