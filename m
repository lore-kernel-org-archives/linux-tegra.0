Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046623;
	b=Ysjhm/kniRXHSaX/Jq0qNlT09Tuts2An11hkpdoAbifaKrl7jrmttSuUbbzqQjt4G9RG
	 LPD9shq1PQ/1uhJQNYGRQ7orzT5JrRUa7VQ4Rfv5lNrS8oeUgonNWGqIx9jEt37rMgH1y
	 hJstF18Uw5VmY7IcCVgYph3DspqDcaVXOFE3sZxBCq+vILQUKRORzlsoCRsYlTKy2ywzB
	 7YXa1+Qoz85tLERnPaAg+Ud0chZ1HNB4Hz/eKpWYffOlxZ2FtZO4prXPvQpjqpSBoveXg
	 A0vt43FWP6y/UVbLGEuVcLupWFxc4hfYytxj9sO5cArGPNIjbX4j50V0XJ7VB8+19DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
	b=kmFkhgbKtpvQFZzIgGG/NkfahAnDsxC/IqpeXwEqfuhduXQdMzcssCh/OJ2r02TFauAY
	 W4TUJ1cSqfJgkNsfwr/KQcFIMHlfePjTtwOdWe7vdT1/06ifws2ltT2M0PqAqW3AUr4Mf
	 N2kCRTBXNCED/uYpyXLicQUiTvXjCZ9JSIoh07Cl2nQ4w1z/3eu4sc32WO0NWI7U0sExl
	 OAN+QR46zDCRaAE+R/QUA7drm7pJLCQDKr7bfXLKWKKJ1BSCtoRkNJvOLgd1h9FxwvUA0
	 JQzIsnK8TeLCgOJTqb1s1WbfHCgTzHbDUMtv5e2yqqveiydb4u2G23SYrC1PDBjJ4qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+LF3INd;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9960A2626
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E9960A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+LF3INd
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-85d363fb73cso858802a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046622; x=1794651422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=N+LF3INdWHOa1LQEzPobcgxI63dbHnd0H8pZjbVzauzqmkrXHbrEjUASJ4GffZIKMv
         RwVRuQGZElTkOcs7zBOS26UR196UuLW3qbFu8H0JliVF4ijV3ptw28Bqxe9QxzIqN4w+
         wGXVazF/Sywxxb+XZhE1WGngJvyrZojxfGtkaBHiD0ASyhycgHrpgIFVfM4HVGt8Mail
         I9FikjyPJAhmboTlIXBMeWY/k3CoNbT2JjhRx4Dv0/I3uPcwCg8sL5vbTRgM18zzYkYs
         trckmfeeuu49v7vJ2KcSvwH8hjLQBNNv+WXHdz5zT89HjsUTfkpoV1Of6T9iFSIric1J
         FXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046622; x=1794651422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=VWall6hrRhYWE4ueIjozm2a523wQI4ThtRFd54MG4PRfUk3hluVfSHbpOCDqcSmr2x
         SlwXHBehjSJKm8zHgPCyUq0Jdl1oBGHE55YtVUee9szqJIVThULrQVKeQV8uapo52CXn
         mFynSw95CLSlkWvziynG+5qMhDdCJlr7AKno4TUsuHtr7RW5hXAzuBMEI/W2uwDI9mtc
         bHLvxVZC7OklyWR6ksCAcKPqolpRZOPi5twoNkCMFqxkDBP4PKBml6bUqM983SXhP5DS
         yE58HMvXQTOAsFrpldMjzWQrW8zlJ8PxNYo+zR6hJOfviLpqt+3HXDFYMmKQFp6WzKsn
         S1Qw==
X-Forwarded-Encrypted: i=1; AKwUvByAxbKrLePmxI2mnK5aLCpXmY2JyqrmA8oJCguwwnOCMAjZqgk9FgBpHzUGSop87JahEjwNc8ZRx+jeXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jSAzEkZ5RfYLVRAtSj8JEeUQRQGN4WmECnjO3WMfnHwrlDZ3F
	flnz8RQlCOYnRFkpPM6iEli9v/WEtM6fcBGf86Z3qmd7FUS8aCYcKR2+
X-Gm-Gg: AYBFou0UhSC9xBfmqp2dp+GtaiT5Hxg4HHpRM4TmdzB/UJ8d6Lm3dIDX+T5je9xCHYm
	K/7StDHtn4pQt+iylvgkL+f8qEc1olul1DWo3LMbnbyWewIgQNfB+k4sl3fhvHIlPtTYVR3pmMN
	qsTcJrNPyeqfmO6vLBEImXuP0Q/+iLPHNACzQCE+EGlcLHxVEau+buXH3q9zfqcp4Rieboa2Ii9
	id1d1S1NqUekRhvuFQwIiTwjh87fXBz+DpjVzcYr+OdZ3O06vnM7QoEWiLKJ+a/SjjcE5nckW/2
	ZQ3F+0WqkrNjdlWFmmw3+hPhe9nvKQQ1jFHLNI2gzgyi9z69GoVl5pgSBZoqwOM1GdIY/Hnk3Tg
	qpUrTvUxD8IRtCd+S3HsP+KK42Kg/lirRoFihrxvatUTGCIF2O1e4kuJJgHgYKRCE+0I6kwEKva
	vg+BI/X2ipQp8DZVHURugud9LhHx5hNMkZrjOxhKhkd4uZIkzkYk8FuFvo//HhTqH3okWZb4fFi
	3125TguNLESnamlHHyVMuEx0YGBC1xyei/LhQDop8r/g8DHS+5+4GibkNpnfmZmbH+/R2Tai1i6
	OwgxEYXPw8+d1K/F0LqxpGwFXm5ErC3Cw7CaYec2uo7bEWs/BpjX+NZBmSApzLIgKS9GKfhpUo5
	s8Hw6J6MIP1vl41dMKUTHTKN7/yvsUsetx3ZW4E2EijVKcSM3bqWk73OY7DvxE2U7LxPDVXeXsQ
	gdwtWL/YCHLQXME6yipTf2hJW5Z3m/rXYN5tB6EifyDgltQo15fHc9
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id 46e09a7af769-85f1d00201dmr4359887a34.14.1794046621892;
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:10 -0700
Subject: [PATCH 13/58] mtd: rawnand: mxic: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-13-0181ef0cc4c8@gmail.com>
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

A retained MTD handle must not access controller storage freed by
unbind. Disconnect NAND operations before disabling clocks and defer
NAND metadata and controller storage cleanup until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 92de26697359..0d20e6ba76a2 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -483,6 +484,11 @@ static const struct nand_controller_ops mxic_nand_controller_ops = {
 	.setup_interface = mxic_nfc_setup_interface,
 };
 
+static void mxic_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxic_nand_ctlr, controller));
+}
+
 static int mxic_nfc_probe(struct platform_device *pdev)
 {
 	struct device_node *nand_np, *np = pdev->dev.of_node;
@@ -492,10 +498,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, mxic_nfc_release);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +531,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +548,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_release(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +576,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0

