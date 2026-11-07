Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046640;
	b=G0eCJukBFYkJX1BhFm4axT1ze651iMf5u1k3p4h/O2vv1utnkrsjqxnz3qj16OEDHJCe
	 R0QzVnD966+ftab2tM5hguE9i7ayk8X/YXqDmw0VQ4zrqWJ0StUrum8EGb6JfhhToAY63
	 sHFNvmctZefTv+hjAGahpYV1RfHw/w8o9oZWEZ1ELa8SnEQ43nrSdTi/oTjBnQrScaEgB
	 93uoZ3dCZfbh9RNTYUleLiamx43gf6hSFFKIzTZezCcaxKLNbKAXoMx8b6UoU8FTCAWC2
	 uZYLgKXpvp5fRS6TbP2lIKzBIb9JJOgteyFRlsKyvv150xrpz5jJNHUosOGylL8r7fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
	b=CFiaXGyn2nV+6B2xtKFBZC/E1tMVCWiXbQTqacgWOBijUC8dPzAu+71T9O9hxFguBzpG
	 M7K6GeoqTvDB0A335eAD+iLcnYVGGV5iB8uJrFTHwLjNGbGWhSVkBBRF5objfSsGLcJ0r
	 gIG7X/4CqhAOYIsLP4Y4OUn39/qudfYWQWoGpSL1NcdpolAFlZX0kI1JsybYoKT66aitI
	 3GUZjyZhP9yvv733dxxoGWaO6K6RJY4zIH5rgI7N3X8PNdZIgoHnslwHJsgy0p0Gtba29
	 ADPwgS2QmPB3n1R75hR/ylNTKziWT9Iil/VvS1qoz6cxpJQqww5k5Ug50u8i68mjr1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHUgbn86;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD0F60A6F48
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD0F60A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHUgbn86
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8490a7d6696so973895a34.3
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046639; x=1794651439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=yHUgbn86YqwQOiacZRyNmE3TVXyFkyf52wf/O92NFm1zTow3d+AyXnqY0kBJeOc1G+
         Mqqm7a1TeUjxxtja/U+7P2iWNyv8qfVOQ+5MhpVeB1MWUn1YhWkLJ75VQhX0oP4ZKmmG
         HpVOkjzToiDMSp21/T6J2W3tUI7a5IWD7+8riPB3ao0kFfp8br44JNVpwIpThD36x1qV
         Tu8oFiHQysf6s8JSKzCJy7K/y9z7JOM8nNzjbuHEoAmvCcXb/B6AjUpOOWjauTd6mWCo
         iWqOCBaWxoAHrN0VJXziRKXPl+bfyFJQbb3wRxMBezXITPUyyGNE9Hm6BiOmIybX/KE1
         D/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046639; x=1794651439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=krqqzr7EsoqPy37bgbeYqAzIN9iYF0Uj8EDcbZxnn4uv5ep/ktcI3G/KsvXTGuUkzz
         h5POg3GAkyNBAAwf7EHi0lWA/aa5dQJdg3xUbaPhiJkYIklzXvG4tcB1fEeeoCK5Rgjk
         HT/u5AxTsinklbLIma+xtrVK2RrX3nDrW0tOi8HQyBLTs7CRq5UPBXlrc6CMK6svGQ4Z
         UD1iuoIkD2vjNMm4azX7M1qp9imX4AiD7u5ondkvoctlsdNzUcy6V/jUk4Bzxk0NvV7b
         HIwXtDrlOQ0ddqbkNlrgmRnLTyyijnxUAzAu+rfBXsbT+nXYAOOmsXd0lGhvOu+JD7/E
         0Q+g==
X-Forwarded-Encrypted: i=1; AKwUvByAMRF3XflszBmBBMnmdOQIElwWTU22w3NlVlJzvAHYoEPUyHE3XeKEQndLk1FezxY537Sldb+CZKKc+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bingETuPjrh+jt6dT+4xPyZc5CdYWaJvNaCzfqMgAo3z3oM0X
	htVFXcJC/+sHlUhWlQciShzq/hEHgSY4MOxfjrVowWWzSwd5Q0OZuscT
X-Gm-Gg: AYBFou3xpGIvEa4KK/r9QeGd1VZzTAwbOCKGkAsjiZozsow9axPuu4IW8RXyyU2+1PP
	VXL4n930pvA0xJpHJaowtco9pa4q+TkfC6Nnkr9Jo8t4vbtsIUVo/L3bffUTKxr9rHXox9NkaW4
	Yfzwz6J4RZPbpmI7tfHq++TpKEZ8PMm0eEpkac/+NauEqPCFTWxJYeoTOfN6PFuDuxcy7MDT2Yx
	uWJjzCwlKSU/Kq8dhVBhiQR5ysHpAShqzCdhx+YyvKYiv2mEBn469LI4ZNKIg4vRt/w5IM+1FfP
	iz8NZZ3DRVkDMl+75GnP/Oyr4Spz64YQNz0WVhRaysXL6kQKDrBRoWXkHBIrAaPKy4lCZF9Hym0
	4cw1IuJ8tPmu9Ps5Zb1FI0OATJ4zt2fOuDYjDX/8QCb0GyBGcya7rQ7x3Lwk+uhMTf7jySDt8m/
	Jjz1njmvhBibmsaTv1JQaNrp94p3g7K63GEzzpokIxSuEUheOZAmWRTwO6WM2oprMf7POMkt5MS
	sGiu3wY2rGX95EH6puHn4JkZpi5r6WD32NsaS/LF0XzaZGB3cro5ZczCa82zDtQjsdAakT1CgUu
	w+EQQJn2OcgT2u5HV77kHwBftKrdWqIZBRboMz3QiQ4+78cDrWwgQYmoCMSt8GlDniH1hoUo8XJ
	fads8vbqMjU9W8X2a5z6LE/DlhBnovK7KFXBtPVMSd3kSuqOmpxJvTViotfdXQDe4v+o6/IPA4R
	1mlYjbbJzNqW00E6oLNjhwEv8U1DBU+C9vegwjny3wPOpemjZ6Of8/fQ==
X-Received: by 2002:a05:6830:34a6:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f1cbf2fa6mr4361234a34.0.1794046639191;
        Sat, 07 Nov 2026 02:17:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:16 -0700
Subject: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
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

Retain the embedded chip and its copied name through the shared
allocation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

