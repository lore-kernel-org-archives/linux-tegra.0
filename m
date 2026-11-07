Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082412;
	b=Jx8aBrpdEgNCdwYJMGzNeB0z8o0KTfr1uKUjLIjoYNZyLlFNVUMrejfF8OAV4sjdXiWt
	 uR+EbVfjF/LMCpfp+mjbAYqMs5zKuko6ehY3LamV6RK2/GH3eq+oXKyuiDSvmAcnaxNf7
	 0MU2p8GihdoMesKelIO5kqr4mYzCIYNRvN2izL+zIQ3A2lM6KPy9XCfcS8M3o3q3Ab2va
	 OwS1GSoxzk66leY2Rr6+SYb4V614LyqjaxRqhWusZwLtmPLISpqLEpqvpHnW1CDmhJFs+
	 +qutoTn+KhbL565rVmZB+4oCqeLZUIqvYcjwmwgMoBJDR89s24Me3vNAkKilisMVmEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082412;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
	b=mjCQoBOVVFldStw6VMWC/+CMqDvzaE9fw05PJSWoWo0KqzcqGUO5JGHzGVANnHxh4f/L
	 ko6/nAq18MOt5zcD4scU7TU+BGrRhxD4+vZGTkH5K9YeCUCLQlWuvF+UiGaLi+xYzRAMQ
	 NceTP4MLvgTcmwt6nK46zNbaS+ziDG/VHyFodBf/pWcDmvh3I3DZ4mbPgbao2lIYc71HQ
	 1JqWebVe8No5TfVO+b6B+CDogzN6O0s764xlr+tEor8SFFTeqwsapx64e3k5PcmcI4jJv
	 99Hl//JaywuD+tblojZVutPjMb0DC4uXStpRxNnpoVEsMnujqxkaCqoVv6RtQrcNjFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B66606D83C
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B66606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f14642adb4so3982b6e.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082411; x=1794687211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
        b=isv0+EVSBd+zJEu+xVgsRycg+W8JZ+I7ibWR9kbDN8x/tKCYOqI1LIWt6gRzOl5qnm
         WGujMHzhizDL+Onefdgr1jvwYUqaeOu0UU+jqwev4PemdkABSE4KjIRqAh2lZBEOQMMo
         bcQK5iPzW7qXnstz62/ZkPqaTNInbGP9VyM94H891MqXwIOkNEcuocW1u56mGSg7Z1PS
         96R1Cu69hoBLACN3EljPfr8tuujZfQvjxeBnOwMv1ehVXSYbTfwShV/WBg4GYWE4nAMY
         6RJn8oe7wf3uSMVBydQTfKSV3MseeqpbT18Lg/a4p1hHXYgbcyehU3moEYVfwsLtuU1w
         TkxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLKoKKh1Y1yy1GzD5wtDR+WYX5foRXRF5EKqF7gVY0Fcf0AipDfkB6rqfLJoiMnWUhXFwfznwiiGh1ug==@vger.kernel.org
X-Gm-Message-State: APuU4Z9iuUGfv3n+BRkpcWzBARkE4rRObdnRIFo1rmTK+wuSDnoJchAy
	zjaYYAzGBloLL4r2/nm4TUKbimVMZSi10UV8QLUP5aSQNrh+8lMZ9CJvPTNSdczAY4I=
X-Gm-Gg: AYBFou0fohVSvUjUzymSTA7iLsCYWfm4Koh3PeVV5YxBWQsv95lNohKnaDk/j6cNI8h
	/2ow8oG3YpA0nQLQ9/CvI5I4VrHn5NYSFSQTGiH+XYnE+19POUScGoSGXFO+f9c/Z1C2gRVefza
	s45hkHn9bnf2xmLeiYcx5ppW/S8mkR8215jlKlDlUU4K70ZVbPdv97APO5rt35vmIaej5P18zJh
	riZqPMYHD7AftR6A7pNWIshL48dTY5fWCGXmB48i5w7yxpD05JtJr4nr5sKZhCedU2xr6DMZEPc
	+apmlOnoX3gpNtMmDf7/XuRvxtGPMlimwf49FmHew4MuuYqR73+Pn+sAG+ttKAr4NKoxLiuOfVD
	/8SbnhAcmSVpe0Mko+HU+vBRtn+AO4BvPSFqC1wq2leq38nEMnLnzvs/UJMP2UbyymhJ/tCT14b
	6PIAZy2GGn4qiWANXivQfXrw0TyWWfYfEzUBYf4Ovq/GMuum/BuHfWLyYdqUhAw23e2JUfPZMJ0
	nUOtbatqCt5xFbIE2D8/ioQ17TzVU/WVVS7FIkpeSGi1O/xBRImN/bA1NwewFD/1yO32h0uNRSO
	I7EaajY1HFDdh82V3Os/2kejJnfq6vC9yUW6iBwLV8KFjQzLjUeijO2udFNd
X-Received: by 2002:a05:6808:6412:b0:4cb:818f:d56f with SMTP id 5614622812f47-567e0f98da3mr4920477b6e.23.1794082410773;
        Sat, 07 Nov 2026 12:13:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:37 -0700
Subject: [PATCH 40/58] mtd: rawnand: cafe: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-40-0181ef0cc4c8@gmail.com>
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

Free DMA memory at teardown and clear its pointer before deferred
detach.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index f3117b031cd2..bcf7482410e7 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -651,7 +651,10 @@ static void cafe_nand_detach_chip(struct nand_chip *chip)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+	if (cafe->dmabuf) {
+		dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+		cafe->dmabuf = NULL;
+	}
 }
 
 static const struct nand_controller_ops cafe_nand_controller_ops = {
@@ -659,6 +662,11 @@ static const struct nand_controller_ops cafe_nand_controller_ops = {
 	.detach_chip = cafe_nand_detach_chip,
 };
 
+static void cafe_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cafe_priv, nand.legacy.dummy_controller));
+}
+
 static int cafe_nand_probe(struct pci_dev *pdev,
 				     const struct pci_device_id *ent)
 {
@@ -683,6 +691,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe_nand_release);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->dev.parent = &pdev->dev;
@@ -693,7 +705,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +797,16 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		cafe_nand_detach_chip(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +820,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +833,17 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int ret;
 
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_disconnect(chip);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-	ret = mtd_device_unregister(mtd);
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	cafe_nand_detach_chip(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 	pci_disable_device(pdev);
+	mtd_put_master(mtd);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {

-- 
2.53.0

