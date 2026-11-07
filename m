Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046647;
	b=YzhqXgXeJexIs5ac3TE/aXywJlAXuTG+eaMpv6qsd+RUHIguUZtrIF9aS7B0ms1GbhUc
	 IH3jS/+8oAqoecMPjncwkbeYU3S+QUEcGskec4d7ZGVeIgDUGG6AHItCcTLaUfbG/AA7I
	 iEXMLlUB7nQ36O4f4egXRSGTfDMwHIGYoLVEjSYIjeBEVgyZtMvmh88X6oFtvPkZ5ZBFO
	 pgPlOU1gCZfEVOYdi/+cSaY5AglS7BhyAUqw2n3lbWBjm9AQKy0IuhjAC7ZXnv74WCRdA
	 Q6C1QRkn/EBFaGUOj1fj7s5ZuMI8NKOcs5e1xNPr5STL3OtJNaFTlBEBJ/dnB7Id3GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
	b=OvgvrAKfp9tGG5DNGTk2wp6c27bYeNvHVIvaqR5ZADwryIROLGEXK0ju5rROYOa+5ArE
	 /0B51ka9svAmwcn/vpoEn1+kegVJnbXfNFUiNv2cLX+gtNXq+o1Q0pnChXI/PfZwWmiVa
	 mEp33wChnx5VPPG+XVxL0KXrF3BsvttxSrikv/azvLjW7L6Q/3JE2q8+ayUhokLgaZt1V
	 IKIiZv/hxRDl7F++LP/A2tKOBbFJhqtWiDHpvuy1JFng3TQAThHy6CbcXExeece5/ZN0f
	 LV1lCgnoRQSTDnaaSpmafjajqFJ2P/jBFt4w0AJ9lYziM0IEqLcZ6f5/VTow/v0yeGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wv+CUEiY;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C660A6F66
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21C660A6F66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wv+CUEiY
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8256106635eso629499a34.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046645; x=1794651445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=wv+CUEiY1sM4sElwKxgUv9NKbQeOUHHQn6wXuba3Ug2bjjWgLy70VK5Mnav3QXiTpd
         st353wsHMixSLpOEbAnDd4KltfBjgXcqeCGJ90BSEBvLIXpOp7ghomeOpMA/ulvH5Twl
         LBATyUbjnfix3lnx9grIZNQHGcQQEamRYWVO5YWKRIuWxtNmAcMLZ3ApaxWFMHpr1S7H
         HcjXfP5p1AYzItg8ogqolZD1K2/ETu4AN6OHLmQSiAt1DqRy4GHkSJL4UuKLR10PFkSy
         Q7tjalz5vhFdAnBuC57W301PSCHUgLoveAjI5l8OgHo3fwT7MrDevwqeFgrhBxyOOtlb
         exEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046645; x=1794651445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=Yku/rTo/tnL9Uw5VvQE9wBiI2KaDR1bQS3Zq0S+5ypUHY4SdMTTqupLrAL+fpwFa+e
         ruukMzX6LodxnSBJDO8BZOT5ClbWwFEMw34VvMW4XhX0/vkLmcK8AdEVgHTMeM84kVGy
         KkEm/M/ctTTflUpIexIKNrY10dTdEuMgqIAn6ZUAAbaBw6US2666SQZPSijaywDxlNbh
         dMdBSBKzl0sP4z37AmOsxZUJIqXKu8E9cMko04o+WE2d/zY8AzotuCx1qk+UiA3qiXI4
         3EsexLImh4Ns3rI6AsmAkP8WIkQtofTw8R+nQZ69iHD1c3INCr/VVdGWYa1+mjhsfC2q
         61UA==
X-Forwarded-Encrypted: i=1; AKwUvBwTRVxhz5cG7znc+hb2wxp2uB7ufef11EhlzIpo4JAY5PYcQ6NFpStEUFLIMj60eSPv496xG4ChRKOqLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+IAYUR3YzsLWwTaV+jD1JDPOaef0omWLw0tD8d97z1OI4I6hL3
	MCR8bijx1WeCFd+qJgUBDO98nuEUrZh/omzz3tLl1BxV7GeonZcVSOQz
X-Gm-Gg: AYBFou1isylkDr/B7cP18JN9C59BRBzIEYGQIdQXQjL2j+ue6wx/YM6bD28BIt5A81x
	P2SQ6Khu8VubReImpK3izheEHd44ENkJHbOLN501hZ8IlGY6wNMTx09+dWCQKUhlkgaGacnjtl8
	HVgsSVMW66NDXm5epyfAndJ3afa9gBvkm5dnJyWa0mNedXs8C+weavP0f78vl3ezsZx9slr3FGd
	5ee98fdcWtqei9UOEym86JP/12rWQmCgC7C/KiGn4yQ+WPQbFnH0vAdWWL3nYVxB2JMMxdRVvWb
	1ZarxLf2CrA8QlBNhyU4PNPNdiSwJ7qKUUv1gLJV94uPJaI6oT5MwRDBNAV0At2lpTMlYrlfbUY
	VBDrQy7F2cIyOdDwO1zSWvk8xIvKzsT3h201hH6YK2UDV9R+9kYz/gI4YQW4nNbmB7VDN29UlqV
	9YoIhwfpdnqsJpanmcmDqsB7Ok/hE/88IvQ2Xm3CQJ8Rd+vAJYACE9NCjPpiKo32aQeKmU4EvfZ
	GP1ofxPoXvlJOyygYgmsovcpgUFsda4BSmFuOHb0W+/s+8O80pldm25Le6kDjbL3oCZYZ9FSNhz
	ksquuf4Np4EWm8w9Bjft+9qL7up+v4+gTOaGV6djFp1+ExK3geVEuLW1gkDHdPem72cHn6a9K/h
	wZVnTFc1zgkj/64QXtN6sa2L3NOrXh5LBcIrweAD9zG3Klgj/ywmS3zONc3AC9lYvawHmRhGa/b
	yvG5gzSSZttjoz8KDAvbQ4ELAHGNnUAFtnUmUfNGvtDMmnt/icbV67
X-Received: by 2002:a05:6830:2546:b0:834:200b:49b7 with SMTP id 46e09a7af769-85f1cf63bedmr4454506a34.17.1794046644873;
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:18 -0700
Subject: [PATCH 21/58] mtd: rawnand: fsl_upm: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-21-0181ef0cc4c8@gmail.com>
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

Also clean up scanned chips when partition registration fails.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..bfa4f450d7c6 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -160,6 +169,11 @@ static const struct nand_controller_ops fun_ops = {
 	.exec_op = fun_exec_op,
 };
 
+static void fun_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsl_upm_nand, base));
+}
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -169,9 +183,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun_release);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +239,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +260,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0

