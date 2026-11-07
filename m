Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082424;
	b=FBE9avf7XfCvVdZNQHBXD0z6cnMOOribs8NW+DOcMt4l072YjQYWYqISNLOEVSeXImB5
	 NU4yBlJRPCoQuyCcwJArZ/vLOFYLG1DiyPLvYJV8/PDJ/sG994c6HnIZPclpEdS72uiJz
	 uwT9d1nQVxRgRfRE5YAYlik69OqpI2aQ3OaDwwxuevme44ju8StSyXF0YQZoywwpG2x/i
	 5gFf08Z0t648TdzTq01bx5mLxOmEzYeuGahoKArHR7Zb3JfENILnI2eegTcODghXukqqe
	 LDkLprE2ZGTZfsSPxxveBjuWTGVhrMJEuDIztQNmFfEF3JYjH3hcJV0Fq0GNISfhnag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082424;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
	b=EOF/24/kkzOnyUwDhr+rXJQ7jEwz8xP2eVOs9WoN8wX7xI1MUoneNEp9ZQ5NfiPw/S37
	 RrD/gJNcrFzGEH5yvK+jR6QbPWYe2omF7/psQIve3bk1mfqOHkdvC8gDbkGaJ4SxGMS0W
	 0LAMxpSm0nC2XOr/BTDOIux1XMz1dwnf0vr99Qb/kKjpkbzzNI6q631NoWxUKbdjrtmcc
	 g/JezvabqIYodAm5siDA/R5C/cZsTskLy1Hj3mtGm66IBQ+Gxgqm6Ej20M5OQCHcmd+vc
	 8e9WlmMkwiMyEnCJaGApeVBDg2WGkCa+/sLTmZOgael+uZ7LaziZUSHHNKSj/vHGAtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C20606EEA7
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C20606EEA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4a71d0c4233so5661fac.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082423; x=1794687223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
        b=oJggsdxmT5zHAYqiKsy0JA4Anyan5W5trBC/K/M4TIeIm2YMPi+nEPdVHtFqNdxECO
         WC3f4gmwRPrAaH7aPwMfBR8+bhqJYvmkQKqoCXNEy1UfFT/+r1cfgV+ksdsJBq1FTsm9
         OzKQwHFRH5gbOAw2oTeTGkcYuMGJux4Cj3GkKgmVhoGRC+P2AS0H+a35Go02wMXcXCA2
         kITO/fhNqf4xMJRaXqMx5zBq3dmMCKTIwhHCcU4GUuGOUGdQdkLmrVHy1kEty9KXHPtR
         OiDCN2JRjEwn6bBibP2Wgxgs2HwWjKuchGNyMW3FyIf9ZpTieEjbhJ9xnrJAfoKrf1uP
         Rh0A==
X-Forwarded-Encrypted: i=1; AKwUvBwnhQr0RUb17mLax1e5E4wIiejVYeLdyroa9y46Zwu74sXMlW5P+bSb/Y2gaQSxlNtvx852Vz36yYslkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z65qDR7OoEPDe/cB30BxziRkNJ8lfc6zb7jWWdxYUKzp8I8PJ
	z7H/DUo/IDYJ3EizAHfEhnidLeY7M/mp5OhK6EMP1JubRGT2EllslIk7oX3GsBBMAFU=
X-Gm-Gg: AYBFou3gIXRrW28g6M1yW7iWdPo1WewJMyrjhF5WEs6Nu2boa6plotjrUlq9TKu+/Wm
	kTALPd1UpIKeuCkxZWKlgawfvGqwYtK5geLN87/9ED8odYTtoUp98PrR/oofoMa6T9+BkmJp4LZ
	Bee7n+L/ZTgm4ETe+3U8aj+C6OeaJfdBfvTR2drDD70Dqd139lQyP6lrp1dda/A71c2YAGrHEns
	9MxOKnJj+b74ZBNGe2/mIpqOUzkUOlVj9T4dwu0XrBBFfteFqzszlJfyiZgJIO9Lba45XAUGgWW
	R6m6jINmZi6niTx/+gm4bOtnTDycYdtj5P6Ug4bij1FhPpG8JPzEtpspTCzokZOleYa1oNBvJ8b
	mfe3rMoXTc8T8E/SNBKmaPxyG6tX5/JMYlSNyI2JO7S+P0Ig34ojLdd+IqpCFTM77FGFzFl8U9i
	49y/8OUWQoKHLa9gmG9No/EpIdy3ERPCXRFwgDUtmr84QVNVjwfDQ3xkkx+BPMw6RBvM6+I7MLd
	F0zMe5mNqzyeFIN2wZ5O4HSgq0R6OsoXcy6KTp0/XJeNFmjils3q/A0k+CAmH3BMM6mpa8fIDyO
	VpJ4o9PDdalKF59uomR+TEAYabtse70ztXReDezyLFh7M0nHiCPjFkK1LmCM
X-Received: by 2002:a05:6808:670d:b0:564:5fe0:dd60 with SMTP id 5614622812f47-567e0997194mr5082140b6e.9.1794082422526;
        Sat, 07 Nov 2026 12:13:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:41 -0700
Subject: [PATCH 44/58] mtd: rawnand: davinci: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-44-0181ef0cc4c8@gmail.com>
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

Disconnect the chip before releasing the shared four-bit ECC engine.
Retain the chip and controller while MTD references remain, with final
NAND cleanup independent of the device-managed hardware resources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3986553881d0..2231e6a45114 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -895,6 +895,11 @@ static const struct nand_controller_ops davinci_nand_controller_ops = {
 	.setup_interface = davinci_nand_setup_interface,
 };
 
+static void nand_davinci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct davinci_nand_info, controller));
+}
+
 static int nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata;
@@ -919,9 +924,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, nand_davinci_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +994,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +1002,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_release(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1033,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0

