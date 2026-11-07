Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082426;
	b=FroJAXNELesmm0S6EmLFV4lVdPAnU6Xkm+kuu5WViQ0X670ty82XiUyBiBKoPyoQnMNb
	 Fb45980Q/tKOt4Khm4nEp9jpAN4kZdZqRu/JZArAqYzobN2rFD13SKgakjmGDUdqWYFrr
	 bXGP9K/qFVlBQrCibR5ZgmF3U6PMkGPcmeuio227VetmMC1s7ncuRSM3lwMaY9/3MfzGX
	 xgs5DKuhnltTG2i7nuKF04a0X2e0gX9XYM/EkuvYlIisnYgdq3Cvrm+urDMzSszQkWleL
	 X1Qf2J4mkGq6n08jxwz8UQfFv0tonDJAWxHHNy4c8O8eKd/WX/5sDxfLd4/jhfkws7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082426;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
	b=yznEytCNO6V7nA03bb2XQMn1URO3Ba9HI3kP6zB8nqXA+bEBZ0jjnbAVyeag8aBfkgY0
	 WrdAw0Q35vXhrDTNzJzbgMRIU7uQrb/uEec9dXhwCwYE8TF1e8vfS2gquoV5OOHN4WCiH
	 URM6TvKFYKc2exidp9DpYtIPdQ4pGkI2X56JpRU6W38mKuqCvgaNP4vC2WM9LEWeJxapu
	 brjCqx2sdaO87eguatzwUxV1OEE4DZVxvVQRIMmnEg36CApOSQUmhxN6VHgpwZenPVWIx
	 bXG2H+/PTbkEQpRKYOqLmMjrE7BMz3ZyAZWh90t5rHeHXrD5UaVvQ4hkMPET7BDpb5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B36A6082BF9
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B36A6082BF9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843a4ca671eso684001a34.2
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082425; x=1794687225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=Mn/Xnet1URz8ahBd/l2e7aMo1P368U8YLMK1ybvuWCRPNmyiGYDGq9gZcwpJuyJGMq
         TCMq4d7dvZcszcv4pyGkY8gUEfI1ZSqp56nGnOMLEhvuO5YtON7Noz7DM/sue63VPonF
         5GndSMbvzCywrJyuVVOVFuiDvoSlRGsxyP7CBFNOH3w9eujRfqpXyqdY9mxDVmAg5ng4
         zbSgE4P/jqNueY+J/halcKLXE6oCvDSUN7DLhVNRH9mOr5MIqaUx4CJlY8X3sd2J2LdY
         w4FkMeGuFNLDtWKjxxWXgtxcmmh6q9e8Lp7Ak5kNYfXD5/SS1yH0clwK2T+0jNWqCO9n
         P38g==
X-Forwarded-Encrypted: i=1; AKwUvBybOpge7ipNdvQ1o5bESPk7nnt5fVJt0zjcX/JwcgPPLiRuRFmam2+VgYPpoFA+zGBEVLwolqmN1W0tyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tTLln7V24PfYpof7s7h12R5XlRb6m8Gyt7feMPsYaWdqJQVfx
	dIKLtNa+6weEu8NaaRaQGnaXvXtCxNX5WyI+THXa+J1UjFMM9kTd6FScjJcPXn+MwpE=
X-Gm-Gg: AYBFou0y0aucnoZasmMzKYgUuDT3RqF064iI8tMu3yfb0fBGxe/4CbOpcUMKfm+KqA9
	DRuVDLqQLjbbq+hUM+s5+4dVJJVBGrC7H8VQh4GBFuHCVZIoxKWrHWnso5JgcycWivSmF1JDerB
	xl6nwIRXTNh2DUW16n78TuZMEjjmS82zTKNJL4TWsvgsu3j7CiLOKcw50qbW5ye4YXgZHhVSzeD
	wi4aBawmyXkenJjYx5z5EaAjdfhMvhRcF5qslvKhAQNdQNmDMsnZus/2vkL8s6teHQVQmweyI9W
	LajiTbxSnsF6Z3FM/0c0t7FUFGYz9T8EUmIUoBMIROVuCos6CsQSJeUhmCtQ93zA7Ho4Y2P4ec3
	0ptx0XR4kk9lL812gZHWZ/F8wCTpODhefjrToHZeQ2WaGwgc2rh5SrEGDnHC7EXZS3jdWPwOpzb
	p636JDQGhY/pLL04+VgYs5wE45aN8EPsDdQwXflvkn0Nvtfx/mB/X6TvokvSDrwuhcbr+ThpDo/
	Eb41/nS765jBNcVKVCFIG/lxktq/qphD2i0TcRVPHleSGJjSxSewQT2omadixVcy7kagDvbVv8S
	qE+uscXmi8txmS1PL1cv+RM6jRn1npzaXxPRls3NxoMnlhyJPBGUerUOiXU2
X-Received: by 2002:a05:6808:1985:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-567e115e036mr4539353b6e.43.1794082425397;
        Sat, 07 Nov 2026 12:13:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:42 -0700
Subject: [PATCH 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-45-0181ef0cc4c8@gmail.com>
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..291d809d0ea1 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1109,6 +1109,11 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static void flctl_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sh_flctl, chip.legacy.dummy_controller));
+}
+
 static int flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1119,9 +1124,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl_release);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1197,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1223,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0

