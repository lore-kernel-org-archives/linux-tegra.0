Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046609;
	b=GcX3t4RwPOny+y8o1ifBM3QJDCmthbgcUwbZhv52kM9LSqThV0SFGUz7Uc+M8n5bZcKM
	 Z3H7UhAFPXzyVPT78JHJkw5TtZEy15fPJJgpZufzNvj1ehreYNoChEiztv7/n5tYVEzbC
	 j8nAvL0LwpyKf4BEErdHzeUBpbxiq7QAEYIy46j4b4/S50nREmLlxDDR3r2vriP+3b8PP
	 J7JmJmIVhDd3M13UjFyDjmSw4Fk3YHOsSOgVKTIHMZ2gQcRzn4iIvZpw1I3NFGD/RNuJJ
	 e68B1nyljmi8nGyIT+uEYQIPwyWJXCT1atnX9yAGiQt9U3GYVRdJfpvAVUXQjep7ncQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
	b=tfaA7ApL6W/+2isCEmqz3rfZz2XNtYOkSlAV3WFF/x1tMHYRVYyRlnCjb6+uXkfuZ3Qv
	 E85INwyPd68nTaf96LmRAe2xl5CFpLZsA6RgLuzQ8UubP1+SqW4uMkorPsu7A+0GnQMk/
	 sT7cfrba0GAX2s9rfhCbbqklSEQ6rzKbC1ajCN3rPpd7b5cpjbrjlbISgkaOoVNsC51zN
	 xyUCbKqAh2LXkxtl5TEOCwvT8NdjAKMpS6gJvHpp9rh7+w2FqOw0+OsJxSl9DDYo8wCjh
	 GyC69rqsgLGoZ3hZtT/ggpxflZQ3QUulSnAiLam3aZn2jfia0ZiMIwiTp60YBduzhPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20F6082BF7
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA20F6082BF7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a27Vni2U
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8451a619da7so947089a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=a27Vni2U4vhty3zCHojWT/sjM3GihDhQuCWecmRAa+CezosijLlI6ibQxtsdw5MD3p
         AcflRduOvCCXFyIadx03kqn0gw1p5fKhRzK5uLg2x6aGDEoC0gdSmlJrdCtNHhb6DU1k
         uoHJFW/0WxgERqZ9NBv017koirznsDX09uFeboHHI0cN6zvnWaY0/R7nMP7jZKWIIENG
         PBbvpu474GVHbYwPijjL6xfyC4gggP8zn0hONQzmuQ6vCUMIu+LiqzOD5gNr/LUpI9eu
         IX0uk4EyFVH/XOrX07zaFiqgtR35V1w2cggBN07xSR7cBnRR0BlSxD68LknjJmA2Agu9
         ZASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=0kUi4vJP3i2LdNLXDKDoBN9fM8JczJMalpDDscXUkVKO1y97VlMWPqJtOjZKQznbcN
         Sl0ymArpB5yDadUvqe5FeND5uFroUpj+nS1uVdchFJPiBKFHfRh7YY7j+il1NjgL8RDH
         fXElfXBlKEz8T0RjbLIy5VeC6GaBBPyG5whVkMQacJRro38MwUDg7xhiqj+5g2oY7t1i
         00ESlZbBvyjPAUj9ULslk+nXhQppWGK0+dEDnsIELp8PMgr8gYDR4YwNRAD32a4eefgs
         Z8sym2mU94t2/5MTm39AGSnwAIhyDxtiRcft/s+DkR4eWRS1DvJM7rCaI/0K0ebmatul
         +xmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwikH+bwqbu5HMtvu33TFOZ/bNfC1THTbfkquMM4RCjQlOrWGnLNqj1nxgVOA/j3EWQmMblCPAAcSAiRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fyfqq+aDCJ7N1yp+zqptuoEqo+gtakJWhL8rQVOqr5qwdKYin
	Bt59kSoDek7WLykEseVnzwVLgTp1qKiFa6WMt56TkNby++Drl/M91423
X-Gm-Gg: AYBFou2Yc0A/zEZSq+1JHdhZ/gyKYwcoWkXwY/PI5nKOfrPRBww8Pt2cvdaU8hb8V1j
	sobSiVi5q4RfeiE8Gs9q14QznFd/oFcyyzCMwfewKKPl0rIa91vXwfO9awC6PswqGIi7ALfe3Wk
	YVFi8Ly3t7Twkgpa8paM9vYSflGWHe1A8SjWqsBJ0D0isMoQatjBiOOdKaq8A/Z8aje2+zE2SFf
	Dpkw+VZC0Ko1ehas7vcf4KmsBV12jFxlN++c+Acg8OhxKAeP0pLrYGJMZAIJ8qCQQRU9vrP/c0T
	xxTO0NqpZI0pHpNVqr/av2x+udaev3CTwJtLNl9lSOcqihEAAQ/dduAV52EAkVUfjivzT0mYNwU
	K+/QBKl73ZPOUpowfknSOk9wp6yBj+H1GbM4TDOlDFb3ha+tKByRt35XtdfNkGvIHq9f6ibIF+T
	Ri28eUErJ8gZVGMWzVVBBCHiCn09K1P68ySNlZMHOAw9o8gMALxRmINjYd+tskpJHjtamU5pdZt
	q5tK4gvcX6vkY7b3jR0rq7pzDdoIV1LagDBCgo9mw4gXLI4wU7hySs0JrzGPKLTP96yGo+i/zpk
	/ww1hJ0HkZ4ZI+w/SraiTBn62H1O/uoWnhReIvNm207BmsVNMmV5BNPsfdTZXQukW8jVl45WI5A
	xQ39fvIYcqt2OxG1i3BU4gk61MD9u945th0gaTbTbymSajl83pdGl8rgTl7QwWj/clMrwmEcJhh
	RnKHec5B8yf4oRyFfVyNgdbq69zzbZWldrMKgKT9GSwb9I5u8A6eQI
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

