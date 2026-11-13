Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593735;
	b=mcIGruVtQwWFFeeKmg5TdYkFbr/G2kOxK8gWhJHZzlOZM6mu2ZydArZKCv6MGK2koMrT
	 +eYbk8vpGUZKI0C+Ev7PcHlFpun4KbQfpxxIyfAtbiKoRucQR/JmsUXH1oQa4l48n2Ugz
	 ipRP0/vJXRMdoQY73a125D9EQ0IIxwaAAga8AeMKijav1o/PZbbpL9V8jEe0O/n0uTPae
	 0MT72JPhlqI3CbbEGwnyGc6g0m3ay2gYupdgjbJDh/yaEB2jmRod84kNwX5eppQ2d5gA/
	 OWlIq1fwaNO7v/WVpps9po1oFyGyEZEDU7WZQNpazouXJtp0OiZXkssay6wYDXcZshQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
	b=c2GoSOzdTNtQK9ZykdXXaDunBWo333MBUthnXkouGp8DkLfRTG7A+RYPARuT2rIAG7v9
	 NlleDyIMLFxty21ft6Po7DjBFGMfOhmD4JSsYSzcTiWSw2eOLvrI/ymany/NJPJpJrZp9
	 EZjyi08CM/Ij6I2CylZSGT+qnxtC5tg3hBLQW3w1fa7lzWO5SWVn/pYpP4CuXln8RV6Ue
	 e9O3FbCJcXMKnRktVMW2khctMHNIL/WtYcgtT5fTJJcKfPUqlMZEfLhNjcJO6g/YJc/bv
	 IoQdi86kNhRtEuGdJyQbVZa33fEhQGfCvh0DeqsuHL4bnEIlJ+hwZpezU5nKXg4bbSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vL8JNU8c;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A660A5BE0
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 18:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168A660A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vL8JNU8c
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-703be215729so422726eaf.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 10:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593734; x=1795198534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=vL8JNU8capIlGUkmK/0rBjqquGRvUq5D0FCaQC1AV3AS3bgjkpC3Q4F7FGncJlSqOj
         N3FqIRoNlGllXvWmVhpICLCRAW9fkwdrDbexFEjbPzACz/vCfx5DcAf7/Q3pcZz9aPwc
         aFXSyY0lshBASiy1HVR1hbAmENGfny9GFhhrBEx53y6L0DDjWTZhAqKzcVG7rlsY90FI
         I8oPYrx995Ral9qjcnVtBOddJEhJGD0Kt4uEckShiPkYoFJ1I/jsbKbrBbvLsEMAEMZv
         FX13JWaC3ScHfS51f6p/YVHraGkANOpaKzp5VesYnuwjdfLx7PBgt0buyEpztmztEZCv
         l1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593734; x=1795198534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=b02o2z2NNc79zFCVSD1U/c1SaeRvKy8WQDw8agP8MVNs1Dys3cye6jfKi7WmMlPqfV
         /Q9O53ZAT0LeBBvnyEJ6xoGEoeGq4jxLyinWdLWzIj59nmT/GXcVqgzgIPJiH12WBxBm
         MOv4QmSvIa0Z8GuTIE68YgKvjIhSVoCGB7rhOOhazGkRJXVdkU614J1ER3Ju8zDzIQ3M
         xHmvX/y9lMwLNGKLHvGmWpFyqrN2Bjdtp4fr2q8Ahu3RRwDZfV2Pabn9VdSRVOegraSn
         dFD/kTbMVjvloWzXtWYrLsu9O30dktCFDeugY/5aZddzpwUTFOdTtPyHxpJPd4A68ePP
         9dkg==
X-Forwarded-Encrypted: i=1; AL+hErEAuwmIUqmksY8/uFoT4w++nCLnC/GeRiazyp8wgk+zG0tsnroCLH+T6ssl0tKDpqUW0jnH4idip5mBGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tPaygB/IBr4KlHeF5dNF2pd8kQYQJOv0//RlEMK6ob0LVMH4X
	1mi1kUMdMREMq75Q09JxiuFjDpMLVad9XZ3exYSyNDlZ/pC2t66U8igz
X-Gm-Gg: AYBFou2TtKrWFVvboCHE31e+OvEjkc5h6UwZ/2cxhEs4OtS3qcwe8znhsp6GS09FvjS
	rFi0v7G1Q/dTFY7t4fDmANF4p2xbPKys3ZE6P3IeixOBqasaPWSjmu7xTGC4WYCFwsIg2K8ZjME
	Tt4V2votviEpzs9a5sNfixPMKRKqh3272luvyNhGrDmvCWdEZu4V2FPqQFLD0t5gYhGTxM2+p+w
	8S0v15+VpQzWNsTOmPVCnC7ehWpbKOiweSZJuE2Zn2qg/RuBistIcrVBzJeglG3AKO40avUt3AK
	4aVVyvmZGAVmlgc4A60Jkj/IyBBXJTeBSWwYY2GvBCiK73HvL30LHGIks06M+GJcxikRZbsLyOl
	FgEozMI62qOoNEz20Gc40AzERE7lkYcBGpMyJV1dp54NubLlEQ1Pko2KREgQzOGEWYF0h0ELV9/
	ssqC7byODfE/BEuRcwBi6KJ9au2HINhAtAAk58m3oIv2f5lvM4Ru0nt4UU/kP5SApia5waJ6B1e
	4WGQgv6DCZszA72lImFcEpSmqa5RSJjVlsbyEeWuLhsk65OtcrttBVPv8mpmnw+86Nzb9zm3aSH
	ZPO3McbmFFBt/rP7kRufkb2lsfiedtxY/EbnZG+2hWZOeX45P6rrizRbnPNKPH9VuZKkfZTj7Uh
	bTpikKuKaeNqvuLPMFB7ZLcauHWaHNpJLMLh2y4BzvNrFjEkpu/9cuMaSHBU6RqyUSMtHGkPGb9
	GEdgk/AK5uV/yhRrxbmbecrTs0s4wxHRNA3+bX/0krbdFZvFhiLNk=
X-Received: by 2002:a05:6820:f012:b0:71a:cee1:caa6 with SMTP id 006d021491bc7-71acee1ce75mr26036eaf.59.1794593734058;
        Fri, 13 Nov 2026 10:15:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:31 -0700
Subject: [PATCH v4 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-15-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.15.2

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
allocation release to the final core-owned put, including
registration-failure unwinding.

Release the probe-time child-node reference on every exit. Lifetime
ownership takes its own reference before publication.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Lucas Stach <dev@lynxeye.de>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <thierry.reding@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index ef765fa21e72..4b9416ecbe43 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1068,9 +1068,7 @@ static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *np_nand;
 	int nsels, nchips = of_get_child_count(np);
-	struct tegra_nand_chip *nand;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
 	int ret;
@@ -1081,7 +1079,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	np_nand = of_get_next_child(np, NULL);
+	struct device_node *np_nand __free(device_node) = of_get_next_child(np, NULL);
 
 	nsels = of_property_count_elems_of_size(np_nand, "reg", sizeof(u32));
 	if (nsels != 1) {
@@ -1096,7 +1094,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	struct tegra_nand_chip *nand __free(kfree) = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1116,7 +1114,6 @@ static int tegra_nand_chips_init(struct device *dev,
 	mtd = nand_to_mtd(chip);
 
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	nand_set_flash_node(chip, np_nand);
 
@@ -1130,11 +1127,18 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_lifetime(chip, container_of(chip, struct tegra_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
+	retain_and_null_ptr(nand);
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -1149,13 +1153,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, ctrl);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1235,13 +1241,14 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	WARN_ON(mtd_device_unregister(mtd));
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	writel_relaxed(0, ctrl->regs + IER);
 	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+	mtd_put_master(mtd);
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)

-- 
2.53.0

