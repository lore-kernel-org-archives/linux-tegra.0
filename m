Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079359;
	b=OFyxh5VlY3zo92woIwUUR8WH2U7HFw3waFmzDrSiXUVRKQS9d+ao3SBTJ+s/je87tnA2
	 LLrMM83z/mP/5GlgOb3Fw6rn68ysUMphRA23ly0puRP3J9RRC9BQUTxJFdharRvZtDsV/
	 pJ2ryEqLIAEBn02dfjamH2UxQZZwr+OiMvJa/LNcyNhmUK5vhYi8MsOTQGdpmilNSdFgs
	 DvVKxKVN7sfYnamg7YuspxemOU7Zo/uLIbLU2f6lbxybuNY6GaAmBJQl6gXfQ5kmScfa7
	 3snnka/gg+0KMLiyxqA0mrwab0cIP8lbJvma9ec+tJ0GmdRZqtAsYckjsUv0NVPTRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=lCqIiraGWLY1XpFLEV3+JtGWIL9eGnl40x0TfpMANXnOEFsZM7otgy1pO9qRNOw18W/z
	 RvTFoxHksdL/2LvVgYq0+jVJWWQChJPLOOyZrkc00G7hcDSHJpbm+2+2grNNaYzN4wQ4P
	 gy4/+B75wsgkAqWNfAaGgQtta6cmk1VR9LoqpPL6tftbOA82CdsO6re4Xel6LL2yePTtJ
	 lA0rtWyzAPqQ78N++E2A+9l/F+ovuIuCN+BgxbjMIu0rUUTRWd3sFB+WqjR20Ot0ZZPTm
	 4Z26WmIbwLufofuxEi8CR6K2AbrBumew+t0/T4cHot2vKB1QOEng0mA/MZzXl6czaJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE9606D80E
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 19:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FE9606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1032575fac.2
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079358; x=1794684158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=FPlZPym2uXrEKfatPBCADeNjTybQJXizuucFUnEvjPFiQrk6RFjrPRRUf1c8C5HjUv
         iXSgKpx/eBeS+qItB9pkvi+lNcHf7Q/wk7MEj9Kb2lKWJnOgMbFnOG5ICVIS0r5EHGIP
         RuADCBkJKpCSptLef/054xG9ggEVUmwk8VNM39oJ3gStkDC0OeWpFXYAeYlyigfr4H/b
         pKZui1WlPk2zpYfKnOuQWi72Uk9yPBltOwq1N7CizXvAjbtVORCyYiSWP/4BDldotP6W
         fwGkCRB7dN5Jml7MzkLdrUjqC2HxRmqEWBQCzVDwKV7m6aPWoi6uVqIBecfAwGO3jSod
         YcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079358; x=1794684158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=qXXquuGiOGZ8Jbn3ausO3+Fiu7i5hjyCjsAaIl7236EjHOpIW1F983PNgYCksAl+BI
         u7oxKk1lKkPu8Bta76D7zEj4/MzW7pkDvjG/Zu9h6iQWMXZoYj0H4dlna0PXZf8hPQzp
         gBDvLL76xe78LJezbm1JbiYPK4y1HfERS1ECIMF7tk785mggSwOimVNwAt7k3EeAhuaF
         S18L0kFXirPHczcmrkgGOeVqV+/h/AWhuS+jaIMyu+UtR7riwapZZcV/baW4qf8CCHb4
         XgVAa3i8/Kb4we+7npOsl3BTPORs1LpZrwEreCZMaPqPHOmfQGivQQWmEFneiZnxig7p
         ws8g==
X-Forwarded-Encrypted: i=1; AKwUvBxbx2IpCvVPKikcIJWJV+SzpwnzC+KW/lQ8auIBF0GAbZuvQNNqYkMkKxwojN/U8J+g12CF48KgnNR/vw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9wBFcvtlurgiXlsmMSbyN7gVxTeGKbXTLfKg9OM2GIRanJ0T32
	CY2d35hLGUEgmCRKTi/WZvy82EUwGzmJfjpD9avvoXXVkLuoBX2lfyNa
X-Gm-Gg: AYBFou3ZeKPvV8XfuqzoXkvVC8CBsybyEnDY5WGbPPPl6X7S2rPmar7nH50uuVL1shp
	ySwPyMu8JGHTF2fFr4Az1klh4wfw+OYxQxBfcQewaTYAiGdlpYX9qyiYgT/FzENjhfjeQ8VPFCS
	7qTNFg+2Od3JQ4SFBcfIW+qtaUqqfDV8Gxql5sgYzzGWI0cJIYGQpDKigdFm3RQtHHVXIn7vrWR
	ZjwGgpFMbPs+Tzrk3owImxGz9aPtf92YKM1fEKc6foadJkatLLblwq4FWpwPoNrpYKG1GXI9mTt
	Pee46+mkZTvVUmqT//DOx6kcyYr0zJgpiElUopmvxkv98mgJnR7mPVdxZBnkV+BxdU4Cdp9jvG2
	E3o3xhPdCas5jr/aQ2/4Fc4phQc7FsJwFn2kBhtikDAAsdwvz0rSKU/nGtxuOm/k+cLWi8bgh+Q
	Fv3CzRpMKg/glre3F8b/olh47xR329q7DebN2D+dgiXpJRitKKHSZAw7Ad0Oe+gCBW3BDTdJ4qN
	pdIwh7lJurmgjP7LQyUI5dq281uccQ0nOmZKReb9uGtBtWMqeZcGFffGNSBWGqBNWXDZjoy9H8+
	SA9PoGbfIDOmZRMbLIMKGl66e/d3AuWDgEFe6E4tgihzyz1Yn6OLgyodaK1csKQRzgNnPk14MYm
	/4y2yrEJ6nV1ZCKerH+Mg/6aZSOwCo8LchhskmHDPQByl4gFV7MnZxE6dhDGxq/wrxWmhGIOO6q
	3hnwpv+QEmafzkwGFZ3v6OPPQ0Xjywcf9c31CVzx7Jt90h9YS8pXHxAQ==
X-Received: by 2002:a05:6870:e091:b0:49d:c88d:8bea with SMTP id 586e51a60fabf-4ad98e66b72mr4108041fac.42.1794079357895;
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:23 -0700
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

