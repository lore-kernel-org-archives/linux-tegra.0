Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082421;
	b=XY7+un9gl2QmAtkWinMBta0AnRCVmoel3IF9KmDs9+LWMLIkIIWb87ICevHaI6YieV+d
	 QwmlIR3f8HZJZGQiQ5sHiGkRVbll76cFvKk7KapppLiVg63fDfUpMjM3fwpH3WH2RZ54D
	 ToCHRl0yqAFJMGqgDz7EdQGLiq08EAcGbWb5XtoRRxpQvVmfo5r0OmU4Kng0Hi7TjHulY
	 DIwXUNuy7NPV0AXmHvt7/ocAcJt7unmqYE+RZVWeRyje1D6Kv11jnpWYnPgF+1SzHf2G8
	 NtnXHOztciwQEWVaja3dolTZnvp5K8dAyM0WpAAO5D9G66ON+XPD3eNiX+L5EatVNnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082421;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
	b=AMbMkN8UjNi/SD4PO+NrIuLmgm3J0tcaW4uVFiXWBuCjUi2S2QNtdfRQrCQqBPwQ+9oM
	 kRtGGly9fpiGd5IBx8EHn5ro7ft5Q0wVzmgN5tzncFdWJWsUoQe/mbFZAaQp3DC3ctm+S
	 KXnfjKNt0iLoBD0reenbXUByqDVSgf05RtsuTZkWx4iCepY0bXWR4Nm9pj9JGOX6vbhDB
	 migI9EJ1G5eAQZl8K26HpBF/4WKdApbeCFfU5+jPO14lPW4oF9xQJiQakwhdguWkbTIN3
	 HtC7oY+QP4qG1A43+ontBBSr/NJEhAgRwYxbSWWIAvPO+M2M65XSYwxrStORkIr2xXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ADB606D822
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13ADB606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48eee44b908so4016fac.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082420; x=1794687220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
        b=RJpdNg5dyFonOT9gtUJkvnhDD5GZwjxyw7y3PG1TW42oqQST+M/vW+DVf8JakmFi+g
         zn8d6gQO1t9s7RP4dkHWNp7EfkTK+vxneAPE6AHRpa0h/EAZTfR7L9aIGKH0W+oROsf/
         Rj/ZPviL+Zo/XEZvsb8MBNQY1Gttk7bfHvz0sauKJppYpcEP1Mud2JGUwJJwnabpW7kf
         2jsXx11FGjGr4YBxD1XTKxl4SUuJBa9jTbAPlZ79ag+4xCDIGbdaQWwMNOC1r9z50o3W
         X4w5Cw0bbka4/OoaUaIQPEG056ZNnu1wNapiVTSDSMuT5v7Sc43pSBNmi/hw5cteJ0GA
         dzwA==
X-Forwarded-Encrypted: i=1; AKwUvBy8hcbHc2OBHHb4Ojfyf/vGvBe3WoZRWrBiFl5t8r+PP1Fp4K+7zj/wpydENwgueTuPKMGian8y94xl1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9E9tivp99jBHbyyZH0pMpLiLMx0oQd4yLE3K4dLLFVCDr7m39x
	JASuhf1x5hkfdkzMRwDeoCpn0kC7quMNc5wYGlqhrbsc27EzpZlvPaD/pSebzmKv5J0=
X-Gm-Gg: AYBFou3bvLdeN/QPKI3BHeaU6T4kNjhwdwQSwGiY85V3hxHuAhmXQbFcRJ7p6Zjm9YU
	HjOfitUxc+2woF6mA7OVbonQ079C6vD3oxMerSvsmSdFQroxlU1j6otZlXeza3YalJbomwgcRzu
	De5Y5Do3kGkJFL3dQbLc1jr7eNsKw++hWyI1dxX0lN5OZRLhuXKLfPRp3TXTC8Esyhc8kA0XBYi
	p93EsCamG7BY7e37JqJDKfzVAGX7Fxt0pLF6XbRYvcJObXhJKZv3I7nHc9jsM0SGrAEV9Xz3Fp6
	6DddxMGXvNCBzbyOqNow8OZJ/90JRB1eZNJ87cazrpcoGD47ipZjQ0f4u5lpmTAQEyw1lh2LaLq
	zZZ4eGZkvZ3Nc9b3aUSk1GkvJmxswrYq93FHCQFuIz5wNYRFSSxxg575odZzQxLIOLqhZ39fdEw
	Zkaamh3aCTP3MAUdDo0GH8ZuPkYzZuT4TfVtyX4Y+1Ck1HjA0/Xyc43F9bAcmKkEiQ6FASdiLbT
	ltvMDMuTY23HiAv/jrW2rmEVzCvxvmMfuwhyX8OKWwgXH9KnyYrX+N58pEVmdndBcHzAdb+6Oq9
	O0bOBL+XZWQJgTbc6TesmwKZ1Yk403/LDfHSmgKLDZSCteX05saJGX7a6Jqk
X-Received: by 2002:a05:6870:d394:b0:4ad:8124:9235 with SMTP id 586e51a60fabf-4ad9881005emr3579674fac.9.1794082419546;
        Sat, 07 Nov 2026 12:13:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:40 -0700
Subject: [PATCH 43/58] mtd: rawnand: sharpsl: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-43-0181ef0cc4c8@gmail.com>
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

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 4154ab74f169..1ffd2b210d20 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -114,6 +114,11 @@ static const struct nand_controller_ops sharpsl_ops = {
 	.attach_chip = sharpsl_attach_chip,
 };
 
+static void sharpsl_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sharpsl_nand, controller));
+}
+
 /*
  * Main initialization routine
  */
@@ -135,6 +140,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl_nand_release);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +162,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +195,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +216,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +233,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0

