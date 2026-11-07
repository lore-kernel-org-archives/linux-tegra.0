Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046654;
	b=oZmpaSkvOueIR1k7uX+Io0ADFVlRr++B88oiN2yh3TrdbdJ7ScY12SAkiU5YRYGA1dHk
	 d1xjD3QqnP54GjvtvCXvnQ1oN8btqT8MSmCFPlsSwMmCBrkwBQJHgTC3IdcyMyd8tSCJD
	 ffnGkkrf1n1OxTaQRPQ6Ph5QVgnPBKUvgP7XxbD0nw+jk/WpL3Xt+80rRjRP/urzQ2ELj
	 +3oeSltsXsHjAynAzmXalLKedo0w24QjWh6gvyNF2ySlpcpVW9Cygdf0xc5FGLrGqaFUA
	 fkXb7cLOfUiKXcffHwOHxfDejzUUAllluVuB0fhi1oign2wFCSTQqAgQHcVNXj4IjEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
	b=ahfd8py5mWT4OkrMg9ope28ZiBuy7nKsl6r+jIz/w39uTvv5ANuNk4kgfZX1exp1hmI6
	 PApe1nuJebrpK5QDaTrQHY/W1TC0hu2PnBzfDmaNRTgH0eRKsGG/amrnk52lVm3/BU+fv
	 0vjgVBe/jmmwknlgeH13O7CNf/XEsavE4I1OBwHOZKxprQ/s8xJNkobSmB6PE93SWqBgy
	 QRVXaUSxmYQx0ETEl6hel2ZZomsdfxUnqg9c7HzwMWtWzmT48B1ynK/x5M86DCPSLGO/P
	 zRBEkIiR0LX6yvoeET52z4IBCr4fA1Xo6Vb9Ve0pINpSz5ByWvDylawpXSlcxlBK+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+2Pngc6;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDC606A8E3
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BDC606A8E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+2Pngc6
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85d363fb73cso858911a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046653; x=1794651453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=N+2Pngc64OPWMAkTL0wtY+HdVSNWRS5ssOjU6wjCQWiMlvQ/y58voNZv1HDc2ucjeu
         nC5VhBH+gOC4ECeYBmyNZrNgyoomfvMfPRZZZNLK6M5XPtAzOc4/XK6yATGwkgYoLetO
         KqB1HSk1eZ+gvMyXhwLqMGaiCR2eVl4qPl1AYLxFYYuFrSCzDBaatVqFK+bCyIgai8Lq
         72I4EUedZiWAfyzN9WgeHZNNIXcSV17EkU37ODCwHs/DXHO4YqdebPTON9srLa6MW7ZT
         zmzWs+VxVSzc2estggAdIJWlnPQoYKQJZxgINd1VmT9HCeZ2d/154RofmBbRjIU1a9VT
         FCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046653; x=1794651453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=Au0wk8IGFTAaEcKkJcumlZL4MpOE0e4nYnbaJZTcOFHslqzpeZQJxXqzRs7FiCKnvo
         Hinh38x9htvRfm2JIU1/jVg5oDjCWP8Y4XBtrnqULGy1J2zCd8Wl+yvT1AWxVIScWyee
         b9JLVJU3KyBweT8VqF7HC7H8VYbI8wwarg311LeGbFwozVItgCaXtNukmjECeImUrmiG
         SKwJVYzKddagCcKYfWHptgrCe98trWEpbXl+gvjkBD0BWJiLnIhGEnk5rob3KEa3zSMG
         tWmA9qv/9G4HzAPBXfcrNJPdhi/ntP0AXeuTt2TigfqCTbSA3NVwl5rITISNfGc9kfOt
         cUxQ==
X-Forwarded-Encrypted: i=1; AKwUvBygLe1wFb2Pa1uUi3QzQjSyAkDUKZbt/rfUL1g+7WLY5jw2AottwxjTcfY0BT1J9C+1ZN1+0rdSEiOJbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hFizoHouWiUeKm9Sq6IoULIzijBSCRv1y5KweTHE1Gh6nNSW+
	fDb7VtzMnLc7eEg/mhdSlUgXAqPkhABu7+Zu1L0wtyPEZPA5qi2otTNQ
X-Gm-Gg: AYBFou2ZRUxd+u5cW2JrjC1VV4xEnEvCgOdQr5QC91yUNQI0vN3wTeS6zxrohTVV2YD
	hAAn1TeAka38P4ESZvpfuNeYQSd6a3HRMrzsDeMYfhhOrvJbeWdB0MA8N0YgCK1D3Oa4dISXbBz
	Oodv0JHjRowp2YjkUR1IWMY2P3sM2jkyPNkvCaGAd9OUDfd1owIaqCklUS1I8WkNE+ITanBP4W6
	/pFIoFQPP2QwNYy0vGAXUqLrSgp9KnzpU5NAyw3qMFskH/vubplFlQshZ0ye23KvoU2j5YHhmyL
	9RHVnHxtMYIzZJd/v5rD/znGpDZb5/04LSoRMNu4jGj47CZPyaru3ZYhO3vR2i6XPcxc1FVJgwb
	n7NMr82XWUWu3kYoM2TTxUHdZRVatlpUhgsSh0H2h7/d40285QsYEabozmz+wAwIFVoNRaFlpDg
	u9wXpIbVlHszUtFhqDmh4vjetD1ZsmprwaqR1NYl8yKt4cSfyPE2hH9p2OaPN43jnhOBk3BJGJs
	/vo4pj35Drg2xRnmVU2jFXa/Z+1YKgHgelrALeyG103kCXX+Qs7M4VbegE+o6JPdpHHvNVQP5VY
	xCJ7B9o5SwoZpXvWFS9C3SYZCNilQIhwkidwCaoeAQCWkJYqJWlQSiTI2Dv9S4mWCeGkikzCt05
	k8lCyAaftrftwLHOelUYrE+6ZX+puRSxF2xTI9KO8Bwi1nLMOKO+uBe0R1duOmJul45wFaUfvW1
	+bUWjQTHQ7fzapZOuPKbB8jsIMKi39scQ7kTsxlQShQcsbbrVWJ3aht1DkO83VUqkPo+f7bteo1
	g==
X-Received: by 2002:a05:6830:2306:b0:81c:5aac:798a with SMTP id 46e09a7af769-85f1d000dcamr4738701a34.13.1794046653358;
        Sat, 07 Nov 2026 02:17:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:21 -0700
Subject: [PATCH 24/58] mtd: rawnand: xway: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-24-0181ef0cc4c8@gmail.com>
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

Retain the embedded controller and chip across platform-device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..4686f28797bc 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -162,6 +163,11 @@ static const struct nand_controller_ops xway_nand_ops = {
 /*
  * Probe for the NAND device.
  */
+static void xway_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct xway_nand_data, controller));
+}
+
 static int xway_nand_probe(struct platform_device *pdev)
 {
 	struct xway_nand_data *data;
@@ -171,10 +177,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, xway_nand_release);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +200,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +235,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_release(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +260,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0

