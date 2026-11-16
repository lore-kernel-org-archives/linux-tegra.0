Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810605;
	b=t6ue2IgUFRNpX4rAQ/Lsz/ZV5ovpmETGSyrJzlY+ppy1Rh9Bk6PO/grNOSDe3Gdjg5Ys
	 Tv8tztDKpjbBVZyhj3X3RkW8FcGBorTRO/k65gVXopO3yH8j8QAY4YDS1TxIMjWJJj4Hm
	 aFer38zDUjBQw+NvRrHAPwWoqLcId2pipUfJ6oC69qAJaP2j3p9wm9DtCoUldhm7JP6rN
	 0vrbq63+ELgs1I7AjRUhYlaMvEnOkwknBdZQcmfrIa8kFB0FwL0t0EL727wuHgkiMN65j
	 GtRKT0BrtTrvuRKvd3UiK7naywgwpw5UDR3W7DY67kUWm3QeOykr8y7BFy3WruTWppg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
	b=J/Z2P0I3Y5HFKCD85/7HannF3SpEJXWXcP41cgLTPUmIMbgkpDxbaKOFFt4u5SGx4lrG
	 3SkBu8aByh2L/Q/k5RsRA1+Kxz0i2bY8H0nBpBNPrgAIGAR4oBxcWzys68/fcYIgeEEA5
	 w7jUkdGTA8Ot3qwEHwAMbKi0y5xQRhppuZhGTRjqhXfiafRhQKRSEgsC12izBTmeIMUkp
	 W4AyggjiO8Dr7qvAmEv1QVQ22waU63QBv8FXE4jeixHiD+6nSKeXVuJpBacj9CN099RzP
	 KpSUqKbSM2eAO9gSM3m2o1YcmlXC8l3bL2wYEcArze+n4LvUCUpo2ScoZArtoLRcxIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOI6K6l0;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB3E60A2600
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 06:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB3E60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOI6K6l0
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-71aea92f666so415707eaf.2
        for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 22:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810604; x=1795415404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=ZOI6K6l01mq0+WesDdE6/DAdf/bYjDiougx5NrUwV5CbyN6ElZuXVo8l2tEtttyv94
         p4y6VZA1tpENI8a8NCdX+lqT4Q5AEJ/SLlQHiOp2pWjKN97ewZvxEpJ9lR9C2a3vn/4l
         ovyl6R1PjgZkMVEhBMfwrW0dI0B38fyIpswAuKiWNw7XHiFwZ+n51a2WnreFarBSP7ov
         x6UydQXmnPiGz4TM6SRTwdjyOU6G9nmanR+TWpJpJ3ODdq7DxuUy5a0tj1rbv5u/zpWP
         IFm7f3DIsREdQWlpCi5P0BSEEVCEw9cFsc4fVo44ItfsIqJbPeW8rlCI8veXw7zhPPZ2
         dTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810604; x=1795415404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=LNzKfLn873zF4eeU+It00h1VtMWHTX+UR3KxsR8YkmX8AneSEwVmHBC9RekM/fFTSo
         tt0EKqnSEEiB99TngoEnAULv9TQFJvFAU8pbNzk6ZTLyzYHMa0ybsBqrLt9ywTXIJHeA
         wFe9Es0Zb4ZVLV9Tz6hL1fp2465tC899y2btWnQLmZgDTseg3y/B20sjPOCR/MxOJ4h6
         3gyMmNo4bpL5zaa3xcmy4LtRNBChr1f8JD3NUZfzXvSWOx0xmcdQO93yeRO3v7fvZowi
         HtaULhFLIMstmCFLolaNP8JyQjCrWG1DbapfKjO7nGb/D27OAxkEUG1m/FFQgeuuNCn9
         WrcQ==
X-Forwarded-Encrypted: i=1; AL+hErHZDFaqtuvWJhSgYD3OkRVQRoE8ZiRAb6/WBVyUOUe0/NADbi/ODb+dYOaitaVadQfFnchdhuH+6pGm+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xiUxXRKJqwELm3y8DemEGy8SlCMgBduLibI1Mr9WabAb9a7i4
	a/J5OlKXaaV4j17qcD8/PHFdbeojm44N6kE3BtIAonavknBNZgyAMYAX
X-Gm-Gg: AYBFou0qg+Lzk5DOzNz2ogYQiHebDfmmQPPduFxyX70WYnVgnCNFfhv84HA/BKQzDhO
	rNxRgQB8jlXgDf4IMpyGW9HPoMk3V1XNUx8bR59kLWkk3EtCseSHCsMOGNJCHsuiuLQTyWs3uMc
	fksFn448W/0o2NZccZa3onCoMgHqugi2dGNrIcEgR0CH2DYMMyEGOZZ7uF/qfdskgzq4sCH35Lr
	ynBVXir/gcalcAdhfB4Wn0tMlxGxiTOj7+Nk0LG68SwCgqlO4kpf1DaN2TC7OvsPpi04k+Zqgx+
	9/8Icq1XPLJBIATjQRdKsDdyQj4nq+uK7hg4legW53DAuGpeAJfWg7oCdw0pUojj9k51gw9FgxZ
	bzdA9QJro9Z0D8WVuObfkj/GJi9ilnD8g695klfpt4B/jB1zgtqbb1oIfcKR36pHHnN92bB7tLF
	I2ZfCT/9T9WvPQ/9ECoD5muNdJlzl5wnJRA+A1IzF6lv79Zyl+dW3BZcczsLHOwIsh9auQUger5
	Q4IspoCJ79rl9Rmx8VFToegK3UyfeOhEZdHgqaEg6HU3TCCCYunagjHklNbHoLO72WR75pMdunN
	ZBYTkHascOpv9KwLcFwv42mjQe+T3iIWr8bX1wNYUAWtiMnuKxuqjINsCsSWd5hesFBrApOXpmM
	d9Ck3jL54tXhfnn/hfFf3n0nCDxJnXlduH2aEMXZSFOFpCh/JV6uC9Xb6f0XLqUErVql1g0rDrP
	6+4O1hhiPgNu5NIcnhhL2ebFKM7DCLKCBKqlB4u0CHLzKsjxp5yZs=
X-Received: by 2002:a05:6820:2224:b0:71a:f0fd:a804 with SMTP id 006d021491bc7-71af0fdb3ddmr1565613eaf.25.1794810603753;
        Sun, 15 Nov 2026 22:30:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:30 -0700
Subject: [PATCH v5 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-15-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.17-dev

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

