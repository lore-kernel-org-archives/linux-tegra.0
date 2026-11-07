Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046615;
	b=1R2K+4Ur3EsRRlgXukxZa57TnsioPHwwJBVn1j184tPoYniOmDBxhMPlYloQgMpUg7mZ
	 7MV550pfam6PfH+JsBJ5a4Ck1WInitr//oVPdlAATru3ypXvSXcmVazrDMYobSF5iNPkQ
	 +EznoWySkjw8q0mi3xsBYs0IUhvmcMLjBrzSt+c9JujDKR3ZZ3ylhD7Xk+BLpBTr0vXLn
	 guRdi8OmggZheTAHItevqiythUhtPOPAdojlV0hHO+u/lVgoIzTH7LOjDDp15LTzvXT/C
	 u+FzYos2XWovpKNx7xI/l+f4jzhNRPDWTTqUEGilNlrOnGb93Bu6jv6YAvtH/PXAmHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
	b=QWYEEWCJ9ulYMc24lJEb+hYKadYE0+hcoZd5r0KKoz3i8+SkPcqeMGiq9lmEM9egwJxc
	 um9LEe1rPriCck6wzm9s4G4E2nacfjQBgBXKv4HXXbFPJqWcgpkGPTQfDa704wZzypHcs
	 AXxKEQt+yumpF+F1Hf4XCv77Wh1t9t38p9GMqq1NmrDhFPln2+A2x3a7yC+glXCoVLq9X
	 GFxApoOHjfcMrQkFBQKGQNjELqDLLa1HgDcUKzEciYmDK2T8fQ94jXc2uD2blc5iujbD7
	 oolvbbb9sQke8lBbZENa2UQkHT1gr8R/LSsDVmq2YHxOGaEM+Y4uAC7lO1xbW1kCNCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/KgnUmB";
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24916083631
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24916083631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/KgnUmB
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8451a619da7so947129a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046614; x=1794651414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=m/KgnUmBA9asMUd0f0fu9UeNymkB/zCExsUaYUMGeN6r95uexyBk+TMkbG8BeO3Ez+
         CdC/bmx+/IXfizSS9hcG1E/NGlARwrW/GK7EwXhOg1Uf5A2SK5aF4hkUPKSghGVsYx/j
         sIVpJFKIEWVnQu5zwkOsQTZkfBkuifslXmYrslqkh6QFjRPptfQrEx4oo4bAADRxLxg4
         qic/s7aSXW6UlzuCdi+mM9REj/pB75p1MCwYgskiKBT/crK80LQSJCnALeasHJmdeDFG
         H4uA/oxHTe5Hkm/J7JBKz2XlUIMzGHB4KrrYhzZzZ5fKKDW27FRg0GJag9Z+A4/oXoO4
         U7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046614; x=1794651414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=hgCzF98Ymgtfce7Sdv9KEdAU3A5zK3kjImBBe2rG6WrAB574SZV5gnhlmIBEALNzIC
         tlfwW0JtUcbMykRzCLOxnybnc1QTMNtGo+tvygTvuZH0sIcxJ7C88d4NGO1pFXcAGEm8
         aMSyC5BLrQiUcglmjPuMNCOFumrnjOaFp6FmqIKe3al4kGyaL6d1Q4qJq9jVCKQxhIKj
         b6iP6UAq3CHT91SDjzoREFEzorc5DfJIYhM2992/r7BrncIeQch28qT1ZWKQK5ZFcyqh
         RQsVcfX4tlPU4SV6dQYEySRHvCcFbC2oqg1QeM39HqzXoxRKiQg5RZ9ixnykdP27CGBV
         gzfw==
X-Forwarded-Encrypted: i=1; AKwUvByuYQ1K8QIlA2uV+2QdEp9rWAJ4lMYm2SsseBMkzT0kvkQgDJ0NDfdiTY4Y9NdUKfhgUcyDs9obLuS/vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OF+BYH2r10Sa8bfko1WPvSFbbHyfpQrpGwXvszM/sg64/06s9
	ny5QQV879nsvKdYmZiKgkVH+H08FMwunWLFJNQIhXf6iI1WJ3Ja7hc8K
X-Gm-Gg: AYBFou0N75cM4KifIRrcgS3kds8dr4LXzLWAfazeDzrXZpOBc1vMJPR/qIUnRw+ANZJ
	XpsdFTWS4/F0/rOJEa4mAr/ddm5XFuDgTZ+avEymaIeOPhHVrsCJUr/oW8C4GWsK8CmWb73y2LW
	b3RAdtwYhEUGEMe8YB5qD7jQOISx2xmzIL1SrE4ftkVT07G5ppdj0eC6+mRN5VURpQQfBi3VwuD
	6foDyB2WF3hFHxrJh7kkfrTQzxrGwvFg2G1DDBNT8sqg/R68feUm2buHI19j7uY+cypugLYBDwX
	u/pbfa04x/VD/+2uh1ZUt248GQ9PJ6hHlAy11DesP1uJdiw0o77m0BQy0SkPwm8OOUDYtk6ly9m
	k8S6BvXpo6y8799FIlYCY0pg8UQluX1JbMUlT7ATkyMD+HcP/e8U4iBFdkQaC6483uExYv6Lu+y
	lU59Bl665bgFHJmXIwAXZkOoOvUBXThTOn9qx+rXWZ+GY+K/AG2154w0qFAvOpsDtrwOnjsDPSj
	eRhWVXG67l+vJLuSQ3cJywmUmKEx5S69fgAVDi3LW58fmLSYkFrHkOrTv64y8uA8iXR0xetpOdX
	sDLkEeCHAihK2C7kR0pTyy0wm/NBgUCSttvAFkA5twEkegPW/qQEyOHhwObsRCEcFo/EtUK3rPi
	b10CmAabErpHs6n9dwFtZ8q0mXoIxrkEndzKSgbEEIjfJz6g7LTM6Ntli9PWQw6RE28eAVBAWKv
	EmuBWughKPyApN8QqXaqsbGZqD9yYG2hnHY1No9V7Wv0lTBr8288ME
X-Received: by 2002:a05:6830:640e:b0:814:8259:780c with SMTP id 46e09a7af769-85f1d012c2dmr5221596a34.19.1794046613684;
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:07 -0700
Subject: [PATCH 10/58] mtd: rawnand: stm32_fmc2: retain open-handle state
 on removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-10-0181ef0cc4c8@gmail.com>
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
defer NAND metadata cleanup and controller storage release until the
final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

