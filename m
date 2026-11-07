Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082432;
	b=vxA+hgEp9qy1RpytYGm9DhEYIIy6xqLOXpX5zeQ0Zs17dkwnAX2LkycH9/a8ihWmpK3U
	 mvvAUUzcTO1YQ3UKgbR370KOHX+b3FhqKlnPSvDMKdOwie3cQoxVUlLikdY5jikZYqPXG
	 OwmJH1bSj3/r7zaPPkcNV3vXx3eRQEuzf/KoLY0A8ks401yquPh+6CHhVF4+m3ok55Cy9
	 w3K+tsI//Bwr5GQ3luDBW9WpeX8aOYsqTgZBY85p8JBxJvXu/xCzDe27ahk+XEg0z/g45
	 Zr2KVBUG9hstpu3n/M2mw+h3IsE2Pz/oEjafM8e5iC7ZPeiD3w/HjDDUxAXjq+tlSlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082432;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=z5AWpefGP8ugvxCrGcFnv88cfzYJY+wSyEyfHqNeTTo=;
	b=ffMaFBd78Ts5UP3JQgVmPQW+yTms4owg9linNhQCrCnb9bsfqtKLL/5RiMrrkwbRbCUR
	 L3oaaXH7PLouycysOWHHFgP5gVQvmZO5iGdqak6Gou/zPdASQ2ggubek1CI64q4YEnZgl
	 aH5kNgwuZIE03cFxN80AMhfnn+M7hl9XhUosTrJJ3p6f5Y0cd9txOeUi9KuFx8KJPSKkY
	 ocKn8ngF9NqtaiJ8xAEyW+nt+RWwkfCmo1t2ycmGXexPMaCIDL0VlRBU51Np/6JUC7Sxo
	 qC4fu+e3WpInkVBQxTjwAj+TEQK8AISU/b9JtlTzjMRau5qUUDHkqazcCo5QzWF6Zcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F858608360D
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F858608360D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-46556b9e02cso12766fac.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082431; x=1794687231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5AWpefGP8ugvxCrGcFnv88cfzYJY+wSyEyfHqNeTTo=;
        b=Anxd9aIUDD12kwwt467wHU7nn4jlzY28BSDo2CntgYaLXZYyt7JTASudFEFnxb2p/2
         eDiQazl0SV3HFxumS1v8xNQ91f+0dG1bc8bTsvZbRwLsPim/zz1Vt5HfxMgCgy3o58g4
         Vf4mrbWFbrJ4HsKAv50ypdN/jgqoYI40sqzEd7viwyIADqkcpNoBl+f9jwxHJBYU1HJt
         2k8Vl9IumFGpL5CaylJq3jYOVVT3NAzr8rZBj4ijbPSHFlWUQzsJ1b7vgceOo3GBo1D5
         wqpD8H8CaESCOhssMbNlf9Ix0k/3nQT7ZYWNdEGKDUqbeKAtE7QsRE8yPtDlp1HfxRZz
         5Slg==
X-Forwarded-Encrypted: i=1; AL+hErGGdUfJVD96y5/+yDJVcuvRYe2YLouz2fTc/OLaTTOR/LXaULhT3x1+jKWpyrRU7LT/JXaBBM1+n9sDTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9q27d3lDEs4EjWvlPGS7go8POLpNRT7hQg995+gdQ0zgBmUyo2
	nnlK+LsMR+ak57BwY0BBuxn1pHgC70sf4/vxildYCNmM9v18e7k2/kdMkKXktAFENfc=
X-Gm-Gg: AYBFou1ml4zoqnKgmG8tFG9402FNroul+9D2RTI+X+Xi8fHMO3wokcIuG81uCCQIJ/R
	/81SUxJO3a3DuZCEDcmqewdaYGNc7ldrFQ8noagusASgaP8afeZ6wbJo/9gjdvGD3wuuf9mMXKx
	GCd96+/k1XHno8MIOnxnyCAiEwGvEJzSHk9QaYl8OwosHlC8hWC2q6od16HfxjUQer9s20LDIfB
	q/SRE8GJ8VEAanXEHnpSZnQQubRciFtwkZWQqbgzo01q12+cMb12klW6GriUSmxfu+iG+vAoVMC
	jzpGcbWJ/l6/Xcv6cVMkYnTfhib22Go87+ByCjeJ7FS/FfkqASahAXg+mRQDHnfsXvbF7dCfntx
	Pi6qdehlqqVl8hv91QBvj56gXmNC+w8PePGUoAugkrp9c03Yh5niK8JiN7rK4xHmnu/KB4ApqWa
	6aIUvk3n/Pu7BBOixxvIBqp9/lMhsOa1Yb7xi4swk9tuwTw1fnD1fnX75e9bj71MfkvuyABOSO5
	SROiCHL3h6RxTtCv0nzzkFECPnylioKvbuaphZ3QropggtQmxbKSLlu1jovwlHOH1HDajt+KHZE
	oHEQE8YgufSg1Ima5rp9Hf40iS0Xa8N/JAiWd3oAo9XIHdYuNAoKlVXEnDBeO3aL8a1sPvrfFRk
	+clm+6w==
X-Received: by 2002:a05:6870:2418:b0:4a7:20e8:8d1c with SMTP id 586e51a60fabf-4adc106e03bmr1313869fac.27.1794082431205;
        Sat, 07 Nov 2026 12:13:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:44 -0700
Subject: [PATCH 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-47-0181ef0cc4c8@gmail.com>
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

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4..93ee8cfc0345 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -675,6 +675,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -687,9 +693,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +805,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +847,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +858,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

