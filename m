Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082394;
	b=LjO5Ud/XUhLKEFV4SXwyaLIaA0ZiapKez9VZenY7ysDpkD8ivl2DDBcure3Rh9STxKsm
	 Jz5+Q9gXT5dSdNW3smmlrqRHRtukMlAjB3RlLi28cUcSMD9WS1+T3/estikArRuELBsmL
	 7l0eicFs5E5ZU1D7WqfzBcO+yAvGSqMOjRigWtxUJNwRtAU7stWvCZ/aH6z+idBVxd2ES
	 xJauD0Yr7K7Ozzn+LL18ao4Dr2Ajwb+AWeM+zeewq5mH4YNkrEyD+y89dXRfbX6VU4tiV
	 wH5RH8vKY121/Zx3i4un8Lc9Uk96qFFzARV74vpp0FS75BzwEnnyQS242rx2uDdA5OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082394;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
	b=l9ccbrIYRf7Oyn4qflydrYGPtCRaCfvwKK3QEffPyVk725PPSoeXOI0oymkABhusGvYB
	 TJSoFdXtfDf4XIZCx7oPsk24lEKS6P8En0Tzpw64miBpXfadezBrgtUOvMVX/Cfz+61kb
	 o4jJcGZ5Na9X3iVB2wnT03wrMzUZmJTxKfzU1W7x4XCzeXu3knTcFehvO90CxBcsxneDE
	 X5IH2nScD3Xo5MR4hG/Mr5AXcGYUdrL4NdVi9cNZm0gZbO0yNV+MQCm39DDsIqQmC+f+4
	 A2RACrJoH9lfokH0U1pmcJ0aThhxDx8RxBCniw0Sh5dJzflLjPuMNWgacGJny0UbV7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968E606D80C
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5968E606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-705cb6cedd5so377268eaf.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082393; x=1794687193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=jrC0MW4rq808scsQtSzUBEK0L1A3vOLx51npcHXevj4aRqH4wgiWZACTecnIQJdoiJ
         TGaP9RPkUFzNCGmDkjOm72vnkWlTCX/v9rFHlGVbTmw4mxuw6loRQvS0bk0Sk4/hHUq4
         PpHWv4oK3jH/t6GbmT+yxJeoNilHrnFMjU3PEX/82iqr9xLay7yPED1f83Y0oi1kjL+q
         jeyQnk/zKRsZ2IBD7ux02cpX4eFLTlRFW5oqWAFgchhL6o7aNxBlwm01aoh47lehbsWE
         V4N0XKxpagMsLACHu+9Qmq0br5f9qg+y6VrHL+14B9HuSZxEjO+MTNFLWw+BFu5/MUvQ
         mm5w==
X-Forwarded-Encrypted: i=1; AKwUvBy7Z0z+JiRPwZgSfP+BMJcTcC4W7eogT7no5CS5sD0FD2OwTJep7bOVoD+2N33GJeZE+scMUUwDak12ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z84k7aHu1Y/YhL48syCgT2jKKRGbsr3kun4isAXkh4TxJwnk7+5
	/OzrRKuvGVhdeiaj6tTBWXlGryXtefaArJmfo9ARWhbyHqq7H3YlnCP82iLiG3pyvyk=
X-Gm-Gg: AYBFou1S/aq9FP9bq8Gi8XnHOaakbTevEJL/keIFm9pJWUPbGitvnuA0S8WHHeMb81n
	G0LsTrN+wdSZ2wVNIYHUutH+GJX5vpF9X7zhzg1jlp88XnEGIu/NycUuEzZOzwyWK6No5n7fHyg
	kYD1YMT9PzZzfo7tqQQt34Linv2rxKzwdYMG9QXDU3eYZ0jmNRmgf77BoHhDf05WmR3tSRaPY65
	xhcNHatxBk/qG+Sy/Bz8g1cNTsVSVWjgefQBiTUZLH8vWXifAx6Gft3CG2YD74n3PVYVjVR0w+5
	/xqxMwnCXA1I2WHhOcylWSLr09tzDoxCWt8ij4oNaDZNWH71ZoS3T1OKvkmP6qbyfrIZLTcb85C
	8mtvtn3MeOkL+jy7vb1v5X4vQzKwvXFaX+GdCR4YFWJZqbzHgHpCALF9FWcwNn5VN6WHvHLQEob
	+f7zu8kArBJr3AHxKU7QHUmYFEb5/pRvW7zbpqnMDYOO89nEY8ZX4LbqiC3XbtXdzf7cV26vfRT
	TYRl3Ic3BTy5RJcf1T85KxMtUmvy2OBnTtlPNPcSbu3BZkmogxt6nArK8C2kmyHIHqs/S/NvgRL
	2z5UNqnZsP+LECO+v5OKSnWlxC9WUqz+2g4wDnbzr9mLlDppi/mAL0g4p/2ygQ==
X-Received: by 2002:a05:6820:188b:b0:704:2628:b1ba with SMTP id 006d021491bc7-71700c850a0mr1064837eaf.23.1794082393182;
        Sat, 07 Nov 2026 12:13:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:31 -0700
Subject: [PATCH 34/58] mtd: rawnand: omap2: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-34-0181ef0cc4c8@gmail.com>
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

Preserve the shared GPMC lock and separately retain each device's state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 45 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e..9949d4d53299 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct kref			refcnt;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2208,6 +2209,24 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 static struct nand_controller omap_gpmc_controller;
 static bool omap_gpmc_controller_initialized;
 
+static void omap_nand_info_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct omap_nand_info, refcnt));
+}
+
+static void omap_nand_info_put(void *data)
+{
+	struct omap_nand_info *info = data;
+
+	kref_put(&info->refcnt, omap_nand_info_release);
+}
+
+static void omap_nand_release(struct nand_chip *chip)
+{
+	rawnand_sw_bch_cleanup(chip);
+	omap_nand_info_put(mtd_to_omap(nand_to_mtd(chip)));
+}
+
 static int omap_nand_probe(struct platform_device *pdev)
 {
 	struct omap_nand_info		*info;
@@ -2218,10 +2237,13 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	kref_init(&info->refcnt);
+	err = devm_add_action_or_reset(dev, omap_nand_info_put, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2304,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(nand_chip, omap_nand_release);
 	if (err)
 		goto cleanup_nand;
+	kref_get(&info->refcnt);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2323,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2337,12 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
-	rawnand_sw_bch_cleanup(nand_chip);
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0

