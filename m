Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046632;
	b=N5LAGefSQyTBryMsh/7BQ+aCgd/qU2gJM9UCKL7REO486ACgnlPxGrHDcQ9aXaQyxeP3
	 HRbYZgPuxQnny88WpGCsKH1kuRX5ZmiBX9z086PoF2Vb06pb5lrPzEh0lrIQxrZQCtuKu
	 lDN48+oIsKV+KSDICQymPpp5q9so8r68hzKwhNu6YvjI+Uz61gFlRcGGLSuPp4tNGadvo
	 f/IuYS2TsMEw4xnlOltwWfpEliHC1SWFI3YQ01EDk1VaaZmfIVe9SNudmFDHyPIUq0tCy
	 rGT8/JNAQm+pO85cJdzwhTwoBg6pt8odptMmI0Fbl7V7ujSShk2t0OnMX8shutVuHRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
	b=za0YCMAqY/iJ0eRUyhrjePHbKRXL8gwPd+pFrv5CSKaTS9j2V2Iiuf1JPJO7gwsIc10z
	 ehjV4l0vH1JFrsgikFrdZH0CHc9SOaFloK4TcnrqAi3Xj+51PSK8l1JenZ6sshBfINL2K
	 yEPjpvcvs3oP/wkiiWD8ETlJNWlc7qfkeAg3g1Yo6O5kwerkHTm748svBl1hDtcISLPS0
	 5NNFrgh0mTy4xYogAYU6AViToC3tpQDMPSbawZVCpQlHstW0f78UlsrI4ZlAvcQe+XbRp
	 51nHVf2Ck0k8Qos8Qj4wWD8L0srAbFsnpkDOHvU9th35vIY7KfdRE8EmCegi31r9TLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0LgfEjO;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9559606EE95
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9559606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0LgfEjO
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-823b938464fso1112724a34.2
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046631; x=1794651431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
        b=R0LgfEjOjvxttUR1bPYLTYVAkb1Fw62irx7OpW/yoP02O1+0EvX/m9oOqxtseooMW0
         n0GBG+lQbdA+j2vcSKDgDnkt0CLti++IuuCHFAkgRuBYEVPOi2gxsKUbCjHGUC67RjCW
         eIad64+hn/ss/2mtEbFxlzHYjR8EIDrne8AERy9ogwJNwJySvufAMsDPIItHd8Wx1pQE
         uh3uugifRKiEua2l+Zzgu7iLqJj0FqPv3k/tD7R0IurT0iVrZk5jH2vpbPQPG7kGtmDw
         uhno24UlqSsR0UYvQ3115JSpdYl0RKvYHlP5IHxG2JPJxA3K+WmRGj/aT/oGC8M6sZUJ
         Cw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046631; x=1794651431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
        b=ACD3K3FXKh+VlcuJd/C4Rv2kC48KodYeGw3lIB8dhTIuaYUTV7JbJW/iErxZESz7AM
         1f1WN5i3HEZzHhmv7pzwoJlfFf7FYue1CYH9ab/CNX66gwO4386oRMdhBUOzcdHiZZpx
         xZ7VZ+aFhRBDV6v8jB7jz8AvXPa6Ag7T8XvxnTuw4BIyo8TyKFlwvXLDItNrJuC9xavj
         Hag2WmGyG2iSE6vA/iHXU33DpErN0X6G+A5eFiD7Lq9JMFA/b6VHdspANsYynCHiCmy8
         77UV15iqVLCM751eCvJNFKLwZdN2mQP7K5MPWGoEUhh9THNTBmsyLH1f1ZtdGZoFL9/G
         7dJA==
X-Forwarded-Encrypted: i=1; AKwUvBwk4zxYrCs5j6UwJfdJ2QtXpAfcIiM4DxhREyoc6x3W/gPZ7C9gLR4ewAItShEujyDyN53sk/gDVRpD+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ye8101a0PZ9tpJak1v3scc7SuYM2xbIW5Swbz2UwFXbKiRv2J
	V9aLVWd/8kNSQnVa0Qkkrdvri+kWcsentf5A1uOaJcsTg3e931GtgEI+
X-Gm-Gg: AYBFou0MYXIR/VbNFuhddKRzgGNXs5FS68MZ9gL/3xtzHvF0tDRjbskSuOAsFNRnt/e
	008kUPBSUwIxZg5Jh2iSkfcPz73fL8hoKXs2Q2cjH8bwyaeaLKZEb9TWIvFmdJPIRTbQVwh5jLy
	nj7V/IICxaOtLzCi5ZhQ4IMg/DbeDUH489EO/8pEUqY1BD5IlDHwlKGU68L/GgpcdEqgl0DuNyB
	SYYxI9F+asnV0PQ8ydhsPBy3qBPAn1GDvkAMj+wTvLaaxnmTnPwd7BlYXU0HyzdNbJ6m5JKW8QL
	LZWQ+hLUfgO9H71yDJ+UHXlgtr3AQrC2BCn5C4UXhrlmk7F3JdzSIjw96+WA0kldYj+mpxm5e4k
	Z1AvYF7QkjxsTYL8ncYQp9yc/rJNzFDAyTJtW3oFRzLgnfIPQnULyfJbScmzj0T3C9dqNRiZD/7
	w8KbvQPguiNYo9vVr0/MJD35axWw5CVn/6oTBnySfq6Ik5oTngEJ5mEOG5WjXemo172mHa2yN5O
	7RxovjUitrsv6NWHIirecZb4A9k79QEzklr+2yNMOjrPwrbVb5//zsmlysf3ami29XqDJbdWxfc
	ZNINRV69oPOEfXM4VUL4VpfuwHOR4bVrvzM5+2Gej0syXcnSaLS38kxHJQ8s7uNsjCxAYz07EFP
	wBkWraC9W8tmgrTVjF7hqnvmecSdaXebEzyzPhs/9az1PkdyRLYoz4Xh39++18ZNvkVBnXnexLo
	h/vHp4BseFUea9bhepqmCRmc62ppS2sLY4Ry+speJCCcuOUmKWv4tD
X-Received: by 2002:a05:6830:82f6:b0:844:ce0e:e43 with SMTP id 46e09a7af769-85f1d0da35dmr4740933a34.29.1794046630781;
        Sat, 07 Nov 2026 02:17:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:13 -0700
Subject: [PATCH 16/58] mtd: rawnand: mtk: retain chips across controller
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-16-0181ef0cc4c8@gmail.com>
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

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..bdc3d1519631 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1336,6 +1336,11 @@ static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.exec_op = mtk_nfc_exec_op,
 };
 
+static void mtk_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(container_of(nand, struct mtk_nfc_nand_chip, nand));
+}
+
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 				  struct device_node *np)
 {
@@ -1356,8 +1361,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1370,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1415,18 +1421,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(nand, mtk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1457,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1504,6 +1521,11 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
+static void mtk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mtk_nfc, controller));
+}
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1511,11 +1533,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, mtk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0

