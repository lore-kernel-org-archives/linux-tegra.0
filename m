Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046649;
	b=SVPMDgudg9r6mduhSrSRf25uremuI9Wq2V/LZChS4XveaWiK/WoksTlAFUas1y1/FSiN
	 CWVXGYrh/uzlIhTnvKZ1wajvHQM6QTMzYbWbn4Hg8ppOYiw1ff/csBLk9wLMHTs9fSP2p
	 ZjZqOslPq9KvnZmJRPh1xORJQ6N4Y01SYGvvuDxfRhHEPAXM52sVv24wKhrGPf/JeYmFS
	 i49y0A3bPQyeZb/jVhrtXhROjeBKG2voQBTVTJLqFYA9cr62/8LFFqSKrcHCyGyf+CW2N
	 y+cHqd6FtwWZ99TD7Ydftfc+KTHr7uh1EVi6IrArOhIyGVORtrO2Rdq77GRwhUN4dvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
	b=iScwobiMxT/sdk8uv4MZOFfPyztMOROhQibvi2bmGoIh9rELW4Jbo5hzLfqai1PEVosa
	 gTW+yXXlEGpr2A5+tq4qykS2VUBx1gYESBLEFmCtd0Rb3n9Dp0InBOa//57FgAQySYJJ5
	 K2e96X7BAqkdXVHo0uWJJsK2nBoofAsRMseha8ddUgujeGFgatgc1RaBMIUM877cRp34N
	 vNcEHt0ZTjPtU+OdwoeCWZqi9lIDJrc6PxFNTBx3fC81hD2A8Gnc3pg58GO5rDNoeZf7e
	 ATl1O1LjjIeah0ApFceKALhTmaLnSd9iNfKytQKAshvujdzUk0gskd3JaNx07GwsgEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAjneAiX;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AAE608D964
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66AAE608D964
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAjneAiX
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8490a7d6696so973978a34.3
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046648; x=1794651448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=NAjneAiX9B5LbdygA/uJv14nPlztHzNG1nnJoDddfDHfjSenfZ0/WJKppQXdVF4kJ4
         w5dqvY5ISMiv0XB+eMh2MRJ+MPDFXahSJq1N3fCKTYeZ7RoMvHTXPLCVTCQZaURQ+TW7
         yj6Jlx28muOhGpPlRd1oshlqbIQ/8/RbfwlyN413F2EYwvVmMEOv+Mu3PjkxeLjU01vB
         n48ASvBIs7vMw+0lDHRhEq5GkQVPrf8LWwJ2d8cRJM8qItsqtI2vVBKR5359KctD+MTO
         ECukb/LTbu7ULyOxwqnUP6R5/Qo6xYsUQL0bALXgGrqL/YPQk7x/FvMrVct6T3WSHkTh
         3U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046648; x=1794651448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=miqU3IVKGD9BJwizVRqFJwom2HnU/aluQByx4x9+zFb80H7qGQn/7xKe6got7RBw2Y
         PRVMOiXLTn3Lt8Jw3QD25XJLR3fDX9S3ATmw25oh7TH9dkC5sg60dJKqibtwGHBnFo6F
         ALKyvn7XCPVNk1PLT/QSARxNOOL32tvCtb5uIN2brIp8WD+xButxUDP3YrohOYF9X8Rz
         fn2evAfBjrwtRR4Lq4kQUbTBmHQI9DnTBWZ7AbcoJ80SyGfvhDj+O92zQ/SiTXkT4AOX
         s79azHrmnsod7jjJAtAEaphht1HDGc7xQi1CNhzJ9EXKhl5dBiqhpI/cFUBwEw66s53c
         /PVA==
X-Forwarded-Encrypted: i=1; AKwUvByJw3y+JBSapHFOigwBSlxmFKcG/Lbnb06Tl3gs3cSXxcSlo9ruGHptIcN82O3uEC4vi6e8UzzmYD2OKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FZ+X/XbMbJB+RlJpJFNP+tW4Za0GHQOZx+cJ9dWR65o+Gwarm
	Z1LtviXyzmmw7eK8peXxQeNUIt0+fdsaEdCtz9GCpbCkenglo1EPzXaW
X-Gm-Gg: AYBFou0jAtAkaOE2S642NYy6E+7Zjbk8/ZXxdpClIIaFEnc61W8RocjA6cRQKU5Vi+0
	Jj2x1nAUauPwvS3hNISwGTiWy6CCQNhC1xQNWD21oatz9FthxoCjbvA/21VJ9WSUHhRIbLsM9xI
	bOrr2kyM+HmPT1CjsUW40POZqu/UzLwebM+CUdKk7gmFbIO8/JG4nnaSaj5Ev14nMXBv85lwouM
	5CyVlly2DSSm9ohjWMOktYQT++tm7OCF2KRQPXZUT9MwjDJe1uXtxfH/VNo0GGAoSI0IuHTWGnE
	qfOlX956XOmgyC55Z+taQMD+D6htgCXi3WcM06Lkdu57hkf6LBIMKDf0mVU+9O/t0pOk6+aHFtt
	t/SXPqih1xYMSyQtztB5qxu0451O6Pr1+BnvYNK+AhdU9HKteSmqoBwGJ5S51joQc5u57RjsfKJ
	Ms2VQAe1tSEtNrwk/dDowqxKIaK/Mf6Zvw9xusmaxK0o1bCT8DIO2v7xcwgdRTneuHJUZqhnHfU
	/5aslhqEIHNixer2iIYDbXp6nsF8616hTTAGkZML5MOSBUW8hGnOM3+movvUaf2EtVDQFDf9DRf
	y2683l3JHaDrCRz9xFzmA8SuV0EekRm8lu2Jp30/vXJgHnG7AebX5oDgjZicnjfpkFn6vLHeTl9
	CiO2y4II+nFnBq456JE4ReJnSVcr7LthGhOxHrKj1O/VqfXNtZVFZ5/4lPCAKaTI44Ncm8PfJ6M
	A0VUNRhOzExD1CaKmQpOZH6M71cbZijENAdVaTyo30XBzXO1Sl1zs7
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id 46e09a7af769-85f1d18bb98mr4287417a34.28.1794046647554;
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:19 -0700
Subject: [PATCH 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-22-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

