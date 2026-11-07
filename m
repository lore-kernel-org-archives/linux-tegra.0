Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082444;
	b=BEjVEMV0baDNz5FwDsEgA83YHjsI4mF+NdTXkE60PknFNPZukRjWEjnqgENpOu8Tekdo
	 3YaFYR1SG6br2Ft2Gta79Z2/JkTt8hY4ud7YThke/hs007qLz/FPMsKrMI7c7t7SZozEs
	 Ck18cVLPwvCt4bZZ9/0CSC0MfD5guEeh7UwHM+roIcCcqWg6jlke5vtnblHniaC8jfS7G
	 JC+s+7skGv0Hcw0IvavUIC71vEHyhzGT7FN91UeC5nysOdRybVHEgqle9fpD1OUL+OlUt
	 4Aam9zFvWyK6S7D1EbwCCEOrxUolV2833MIPkx8NTECrqR/fO5rFARfW2qITSCAQCHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=;
	b=C9Jxo03Z/Os1zXwwTXGPj7+Wc2nju8CFSgfSJ+BAzEj61EAoN9a01sILEimiiae27ayc
	 MKMoxP2fgtfE7PsXkoxDn4dRg5zb3mAsS5nbi5o7y8UYCFDTkqk0FjRM+0ea+z2h9802U
	 zUF/xdyfUXlPeTPe5Npx+8L+Q+VF8j/q77Br1YAYa6W9X0hbe/ekFn5/vbEslyUd9AnwH
	 tUdEA1hNAFEJlaPUSVNYUj34ZK9FY13xAiZwhFvZ6J2xJv8ybIzHw6qplPEB6toF7WYOP
	 hXCRw5r6ElQc5gmzpj9GW2KFkDvSwkZpiDcdJh6TV7cxks9AKQSzqmN8oKggEv/V3Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B136082BD7
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B136082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43bf9548df4so20520fac.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082443; x=1794687243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=;
        b=qsUOje5Cy+AbiSZvNgeOV4r2n8FuTMRkB+7KT+bcu0rr+PJKzlQlJAgED8VgVN/8U/
         kDfleFsWndwIulzNE1QLmaEUyb5Qk4+6+5KdBwbgJXvBwBtJw/xoOFcZTmRgqvjBOBCj
         JnpowtVAkfTIN/4sg/DTn/aRSQqVfkd0KKPGmOv/DYBDfJtwunT7NemvNzhM/iWnxVNc
         Ktd8I3EEZRwhFWb3zKCJRxL0w1l9pqzOeq7f1ngE5Hwba+Xl6gzzF4QACoCQh/W5bdIb
         hI6G3UaH48zQZBPg2WdoQjgTwUClMPdEZ8NJ2A7Sbb/phBK9zci8P7I28Tbsb/+tAuHf
         Erxw==
X-Forwarded-Encrypted: i=1; AL+hErHdhBNHvmJN7rSr3ewROjl90It8R5BHM/mfH0hlpho5tKBDaWzkPpBZtZAi4JD8wXyXSU32ubq96LG5bQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bvum4Ec5o/ECXL+vCg/NjzOT8Tm8HmKyXVNC3eYm3V1dDZKm8
	uadDPskQ5bc5Ir7vPFOPNMwwkRm6FrXVnlPsKpU90wxcNHJGTNpNw6ZQkVXfh6h964g=
X-Gm-Gg: AYBFou3T0cKOzah/WHozbtR1eLz/gEtc/lrAhX0icRIJnSD7i+Yx616lIeDsl3FtuqN
	lkNqbKKXFw5UhurEB84OGt08r7+9mSiUVmyocUq34Qo30h0KivTViRxdAXNgIjx5EZfAC0V+suw
	H497CnyiL1PEtwhxHyu3M/enEee/MytEO7T83/f1Ri9V8CY5uy6qTlhd8/Ydc0ASyaLpbrH1eN2
	sCeH6fYr87RLok7h1PcXvTXJiD62TKWyL/fy3nzHTNdn7UB+MWQbs2rx0EwXHa8trEpsPSdU+Ub
	WmJjkT5v3fqjaE9Sm/+RWw6xy0eDtVOs6sPlNv1pGRZdKgZT3CyDPjeN3zniCKBAJ/FCtjTExbj
	VfRhLrHL3w3hjnEfK9fzgtPYGtjrBXqkaKK5I0SIe13s/Lb6Gu1UvL7MOFY4B2EzSI3qhcy4s4Q
	kdxjT93b+DPuUxtDotGZSP9H2nctE0LBiCVetkTfeDH8Hlj57HX171WROdieNQUp6Wr4hRzLYbR
	kdYoOqVyL00wONSx1eGu9iMYTBd8WX7ZCw8C9CwLen6hfAtdx8K5Wm687jyxuMun8pe2u+gM98e
	phpF+58bF2Grmn5PYZ894kDzdFhGMY3bmUuq8cIjNs4WoQecO4IzuScVfXV4
X-Received: by 2002:a05:6871:3a10:b0:459:fe2:ef54 with SMTP id 586e51a60fabf-4ad984fa6famr4620570fac.1.1794082442478;
        Sat, 07 Nov 2026 12:14:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:48 -0700
Subject: [PATCH 51/58] mtd: rawnand: mpc5121: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
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

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index e6594548b7e0..1618f46f69df 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -611,6 +611,11 @@ static const struct nand_controller_ops mpc5121_nfc_ops = {
 	.attach_chip = mpc5121_nfc_attach_chip,
 };
 
+static void mpc5121_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mpc5121_nfc_prv, controller));
+}
+
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
@@ -636,6 +641,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, mpc5121_nfc_release);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +656,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +789,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_release(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +822,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0

