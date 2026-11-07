Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082409;
	b=l2LEA8yf+MjIX7DFgqdMlkMt6prew408QcqGCzk0MLCcFcwZRsnaI9YItGzVij9s5ARl
	 v9SjFNL5MkLSQTnQAqcYaQhdBo0rkjUbFLQsPabwSJ2Dc6sSwcs8jtMEMyVEuI48NNMlR
	 6aHz4m68U+G6GWPAynJmW37gg2i9PfLoDxGEogWNvNH2n2zE/JS73QR1PqbchY0JftHkt
	 JDdMOGlNfLt+j1l7QjRRg3E0YHYuIRg6bT58cjzPkQh0KrbdRzmUY5RDH13Rz0XXsynmv
	 ES578MjeHw5KPrqUAaHwzQiQ5JGCDke8N++3TESK9uCYHGzt4YrgIKC8rNIgk94KvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082409;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=d6C42oxILqzAGe2XSYpJ1wKWPDH0Wjq+6Bkl8QonrCw=;
	b=UjNc9MyVzRFiffuBLhcfUORtsfSaUS4OZrUUjathL8UgXJ7hOUwEEXXnU2DIZCnu7shn
	 kLf6GX44LrMZxYRJPA7rY7JUHTvHGgOePNKXaw9uaJioSJdqpMKjUyW3cyQN1GlQaLfL5
	 C1+Dm78c8gRhu8FvA6mZ4q1mcAZfcezSqIMjKiM6l5XF8G7TGuvOUrCK2HPtyp/aZfSZd
	 Xsp+hLCOwjpkwzV02JM5I7cb5KLO+GWZo4hey6O9oPLan9Z9SHago3KBqxrvK0++q4Gas
	 Eb//dCSVVpjr7/oaGHFI7EswA1+95F7OQcBsCN2SOHzLqhkQ12xzVN1KVlZZS+FSJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BA5606D812
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BA5606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-490d838b425so3304fac.3
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082408; x=1794687208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6C42oxILqzAGe2XSYpJ1wKWPDH0Wjq+6Bkl8QonrCw=;
        b=rwhnHD3uf+0rVDkqF00JkZltyVAbDE9v67izGb9Rm9MVaH6haFDRASJcMhF4TDzNfU
         gB9ccqQ1VIw9VlwUResMro9K3gtqFWAyBG73IibvvYAlvL1wIAunix+Tej9tULUHjKzT
         b/P1UsAo+jO1d5DtZvMLz3yo9VHolavAW/k5Hd2P042aauDSkbrXNdp16sQdfFAkjZHL
         JFg/SPkYvdGY10A9Iwmx0c4Qdno4uyDGh4saZbxXAdJZohaFUFNcOASAZCUla/JnP49s
         GdOZqMz481ydWeHBMNuoQmoVPjjUpRwBXGCf+8cI9dwxsx5hEFFhufdo4dPEMKFUayfs
         +QyQ==
X-Forwarded-Encrypted: i=1; AL+hErEfbF6K8lMVB5zXR/GC2uIfR9AtkG+z2j6UqcU0QsUHqpGETTOrsktfiAOKg0o3zD6A2ERYZhGfiVh7tg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ELURC205Ag3w2TodnQZ+q9bajAiAkZahocqufs9DInyFjWOBW
	ShdVdn3QXVAXijN9K/VfcGKhfgfMotYOAOc5hp7rUKwwu8Uch5xSeHx4vh73DHwDiUo=
X-Gm-Gg: AYBFou1lzMP+ASM0l6upoKSqLDNYhfmbBJGqXnVW+n4KzLRGSK4LRe8bHzlIUdvSEt7
	S++FYcMKnYF2nxWiim8QwPU85eNivY+COvBP+q3T+sS7V7ZrACy/cmT+tdu3hvXv4A0Lh29icdm
	8v2+c7OAC47u3kS24A0j3Axg+f2qudhpLs9GH/lRYIOoxYDrmGaAHDDO1ZxfhM/7sV52W3DZtdn
	XfHcJLKzTJNhy8C7tcZ71k4VApi6VwrDWvFyBZQqRHNxjgLd4CCgIc6UqMYzHEsyukMuN6FH0kV
	chtLZTQoaeDCZW550STDILnO5Z3so0AobiBXWDoeXxoJcn3RJNjphbpRB/vfKPDRQPPfcxRvY1S
	xSuEgEaVPPM3Q6qEjWa8eDGyK78oOP12djIgBoFCUD+A97vNmRQ9NGPNjl75GGxRpG3xKwZ28Gk
	vqnqjYa2o1AgNOoTApSeWRa3KVg93iEAs8CobuMEqt3TTG0YLJmR1+8kf4Vz75yR+pOZlqzhMzT
	7wTCPKvyupJlQ0PE8x7YzY/+Z2lhe9jkOQCddlOwaTolhvLjHj9gZl+onpW3CxtlZvOfoFrEeCh
	BH4Eb5qtUkK4AOBQJuIH6XpezZoH8FgwpnF0tj2ort9Uu1LhtVF8Mm9bKycCzA==
X-Received: by 2002:a05:6871:2b26:b0:4a2:c175:d339 with SMTP id 586e51a60fabf-4ad98e4af21mr4151086fac.39.1794082407651;
        Sat, 07 Nov 2026 12:13:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:36 -0700
Subject: [PATCH 39/58] mtd: rawnand: qcom: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-39-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Validate boot partitions before publication and unwind partial probes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 74 +++++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f812de1d776f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1900,7 +1900,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2007,6 +2006,11 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
+static void qcom_nand_host_release(struct nand_chip *chip)
+{
+	kfree(to_qcom_nand_host(chip));
+}
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2019,13 +2023,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -2050,11 +2057,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
-
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2062,10 +2065,21 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_release(chip, qcom_nand_host_release);
+	if (ret)
+		goto err;
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2077,15 +2091,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			continue;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2119,6 +2131,26 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 	return 0;
 }
 
+static void qcom_nandc_chips_cleanup(struct qcom_nand_controller *nandc)
+{
+	struct qcom_nand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
+static void qcom_nandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct qcom_nand_controller, controller));
+}
+
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
@@ -2127,9 +2159,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, qcom_nandc_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;
@@ -2188,6 +2223,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	return 0;
 
 err_setup:
+	qcom_nandc_chips_cleanup(nandc);
 	qcom_nandc_unalloc(nandc);
 err_nandc_alloc:
 	clk_disable_unprepare(nandc->aon_clk);
@@ -2203,16 +2239,8 @@ static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct qcom_nand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &nandc->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	qcom_nandc_chips_cleanup(nandc);
 
 	qcom_nandc_unalloc(nandc);
 

-- 
2.53.0

