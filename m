Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446926;
	b=YXfOnQM/f6y106xXt+UNc3HdfvBVI2cZHYRA3Xhtq5oCMHDVm1DuL3x4vaGmHPruwW4+
	 Ik9jjm60NU3D8AB1EwhGK2E4v5yLCOjeuMsWetiREzX5fRvCEmuFP9m5Hp1EHQHXJ0VuI
	 4be91h0RpztrJsHbIaBxH+Qr0klSThZ6thq4/3vpF4iRzvQFwck4hAvVq6vRSumgB+jU/
	 bvnU0Eh4yUCAD4w42v7LwL+gVa5b9Ij4TEEcghI5g7rzWdSSMUzOZeSf13xrysBEtXgQu
	 Cjpobb8L+BXue0T2QbJCEnfNlUNoAbynJ0JkdpPHe0qFcCFTDrVKoM8HL+EqJDIehig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
	b=Xqa4waEdPOKNIdu13zGd9XhAeSaRHWHV4QubLQ5x8Zw7+z/SxkdxxMvzRIay8Ob+LJqt
	 7owc/AgvyGJB6LVBT5lFGT7Gwm52qzT+seCnVEBlXbngkN+YI/Yb+ocy0pP+0vL896LN5
	 cS757kOUpKDDYOQjtmr/NYw+q8fVFHEF45/82RbC+WP7EinA4DKgd5w6/ISrRCViZvpo6
	 ieTIA7g1Tx1ScGoCwFMk4JIS9RyT5RkHVius55D00GT+y8vQdz7Xf4O1lGjMmyw+lSSyD
	 PJpr1kI594ttBXskflVyKYmuhnyGmudUDeN8IKSVIRnOzlTwJ1jwCZF/yDCoUwtosYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSZlH6Sz;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456EE606A31C
	for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 01:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSZlH6Sz
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-85a5455bd3cso2099039a34.3
        for <linux-tegra@vger.kernel.org>; Wed, 11 Nov 2026 17:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446925; x=1795051725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=KSZlH6SzARdVv5MTNOW5Z/JLotSlnO/zuxHZfe+tsDMbJVIKTdZQCku2y4m9NhBUqD
         p4ZqZpTn46WJy9x7KxvoHDiVUPUa0frksyif51EORh4OV2Gf2l4L28y33V2ESj/OJ5zH
         cGl034bOkya1Wybf3n++fxOdoCK+IDCoc4To3QFDBkCL0E/wbTG/G6WHXzAeAKEUHHa+
         7itgAtwgD8q/C6eZpnn0QT87wIm8J9miNhxhaI1zOAQailAvBQ4aY6BLWuNCCYKIaelB
         0eHa4kR8rGupMpQ3av9K33OLtUaBrOkyVv4/TYZbhOZXdBfBMy2zUbQM/a6DS7XZY0IW
         P7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446925; x=1795051725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=Z5GGiBIyLX5gBiC92btnKxoS5YAdr9BlaeEErsu7oY/9ziRzkwNiDerc0kig9W+ELU
         NTd8Bkh/hfvGIX9pX57G1MmFmAzC7e4kTtZQr2IaTwQsIiwQwWVSzFAUpfKdc13VJmQt
         Ok1UmxNAuieBd+i/rVabRzYSt/VQABAMWlCXVBNKFs8LcP4Qg84zLpn2DikA4WO1c9Eo
         8VqtGWx++H8wFY6p/wGzLZnHAxqGQi8negBn5abHy3WtTbs6C+MnJ7vn08t3mmcK7//S
         z7BXjImyLTzyuO6YxyUc0cdETjZrTyzKgWH/gvBf8/EFbZrdeeM4S+u62/JrB/XIvD6a
         pk5A==
X-Forwarded-Encrypted: i=1; AL+hErHVu7vXqZZkr85BfQWl5pMwL+vIHs9BwTEpWsMaV/ZrjBXKxIsPxae+YpL86GkHdazkUUiM+BtA9iQefw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FVFr/J5StztNze4zRKglIlaenM3IFYPsgUsdKdLEvjJZVT8MJ
	MsrEupo0RksFLcH9uX+mmL2DwrMSvS+4Ur2gAc3F4c04QiwulAIZRcu+
X-Gm-Gg: AYBFou1vNJrfp7LgXkyiPRgg0VF3Ua22QUYCgsNElSxdKvA92f0q8LFcoYpq3wITenr
	RxCz7/KunrUk2YrXo30cK7XJyviUbGLnYdXhXla3qSrapwUcv1I2Hcd0yAE3DVZA/V7S4THki0b
	ErnfIW8DJqOSo44I3N7qD7VBc+r9GT7inwI7XZl1ctCajDYQgw5/ZBjSJ3LfkeX8qY6wb4cip+9
	YrsVQyb6B40g8vuIL7Y/5jlKhmGLb3ILiemzkRzSYPMzL3QQkUnhfcskqC2/wAkM2WObANYS8x6
	LceBIIfV13IX8dQ2ZK1VAwzuv80xCHm0x/2+ldDkDJmMLcEAPaf2mLYFSa+8iQacYQSnkYLAmjm
	eAFNK8VM7bOsBLTbo1DlpYkpBRYQJB9+Ue8SgKsQ2Ce1dgmlCUji9u7X2Zny8vsFgXvNZdfkWHs
	bRlidFe37XxufdDe+ni4VMTBQM2Y+tFjDOYrhAXhBU+Y3N9aCDaUa4XMm1NAuoITU9YIS2Nfc2B
	34IV6U2rv1Q6rBnkYbb1iIb1menrd2/pUYlpo8Tb/utEmaee6nwPU6hHYIYly4k+zgt/cr99JMs
	wh6Rwlc/wBvwo1qgF3Elzp768heV6kSAT0Z7WsstloRyrbi6mAJs68S1RpP9XOoYMIl2/l84iji
	tQhzgHW8UEb1UjvwOytX17PSGPGMSxBw9AB0UpJu2wX7g6OWdT35vzDHnKDNzdzkjWSJcFLihGP
	f/CroSPYMpcLRYzVczGBvH/lnuOjQKC3NG6Vp22pFjmYaD9YfzSQGn
X-Received: by 2002:a05:6808:6d8c:b0:4fb:6402:a8ca with SMTP id 5614622812f47-56b961927aamr4201294b6e.21.1794446925119;
        Wed, 11 Nov 2026 17:28:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:54 -0700
Subject: [PATCH v3 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-15-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

