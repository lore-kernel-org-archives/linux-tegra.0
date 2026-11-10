Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296679;
	b=C/C6+mYTmx4XGG+hEbJh4Mx92VI/xG6xUsn7VMIzHOybKHKz6CGKMX0YK6qleOdMcWbG
	 VpBDVWKwXdg9XZ8j6wcQn/N+NZ/398xtLuH5NtoJVX8W2L8IWoy/Lg9ezw76Ux9Xj/3D/
	 ZHPoFwxq7jguXmzvjJh324dyC/oAVn0bHt+G6lf/Zeexv42jqgC+Xlo4yPPG7e9MVwD9Q
	 SC0ZUMu8hVYq3xBXwGTgfqDTy3HQwM6/xQoKWZ+GTI1yXgWEkdRq75rdN4kOq6SmsSnmb
	 7OjahLu/Q+/QtPo+JhSPsmuTJm6ivnbPf4xrEOUml1WyXC5qZgopU1WuI4y/v3xIgfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
	b=v2G+uzQzdqWfrfN7Lr2sG2jvhiav5NttR0bb6OaTCivOVqgw7sI1MbYHpv8DHdifupi5
	 e9OSxAaI1OFrrLolV2c0PAKJ5kld/wYGz2VA9NDb6fWq8QKTaHwvyEOC2XvEAs7h8/OXC
	 u1kHWDH29OyAZJEemMRzI2MWXq0IqHqGYyEi0696mfvTABmgX0kFbF7sTqLHGzQeCj3g2
	 ChNRp6QNhcH+IvLDG955WtK4npL3kGRgl2nxj/0byJIixPsIDE976Ue0X27qFKQMKZe5B
	 7HVz0QqOXzzT2AYJrlA7LAWTGxaTcSpD+Qi7fzulIYFMe3s9QjwYcMbrAtByufj2zag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ENZD2/ft";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6760A3825
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 07:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C6760A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENZD2/ft
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-82380b0f55dso791536a34.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Nov 2026 23:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296677; x=1794901477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
        b=ENZD2/ft9SIAOm54oePCmpux15dfOVGIhPUuuGrSX9jDtt50WedR2UjhfneRCZDS8T
         uvFh1+wT3YODSOpwrkaXAxth1s/ps8QFOp9CjIXSh43L1cVTqQ0NYn9MWBU4WUoVG6pv
         t4cfp86H1AIafk5OiI1/NJ7o0Cm1ylZTErpWzms2NrVg7rikfV/5FR3A2sT/e7X6EimJ
         tQqfEF6LkvewNxpVgl+hfDJmlRTQRs6kiRS/U/3xTKuCDpuUUUVs8yh7xYYR9DkBtt2S
         E65XTmmt0DX+b8uCmuG/8EOFUIjnjkWW/l/sd6LbnLNevfl05pgzgLe+Fqd+yxHxw1Gf
         QJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296677; x=1794901477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
        b=CCuEU/678qXO6dHiM7hwEz9bag9AgYXBpCdkIQFlmZXtYsI1yAra+mkvoOvF45hgKX
         +jbuCZpHlysMY7JzuKHDrzWes9BxHCTOhN7f9KMqXo3yMyUyjg7542UNqwff0QB2KEYZ
         JfbNbTG9CfrrQQknWQNp1psyFTGcTAT7YiCt+yp0RL80Nxu/nXunco12biGxQ3xdRLjM
         FEwAA3+s+BEoUVOk37fJee97oOnaGwAwVz3fyMJM+Ca07NOnrCYKdDboXGjKFP9agQgU
         LpmrpbFWEF21JH6xfsebus0Oj+q1Sl2Uh8Lnv0mIv7edhVwJapG4cAZtN+YKY6kIr5hO
         SVeQ==
X-Forwarded-Encrypted: i=1; AL+hErGqf2/NkPrSnyB7dIWPIE961D9ftFCquLnHpt0fbbUS0MLJPP2BnzF8CsN5k9K1ZYQA7VgSrYb7IRzcVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nrgiXiCY5I+ah1hh/wuDaTob+MA59lrMkdkdfpP2p2E+g/4kL
	QEYNmYP28mU+tGJN32xnBwBbtgSSdQOTm3O8L2Ik79cPhd09wHtXJwAMcuQZmgMZ
X-Gm-Gg: AYBFou1rHVp6iva4a7vGjwWWzsAqQCKNhvJVOHkPxR80KHfM2aEXz1ZRAjHgtCIjsaM
	LnlHu+w0hmRjtKOoWAUQmWU++OHIu7CSsQv5TOKNrm72BhvJp8TgWjwH9n4vY5KO5tZNhTEE6JF
	pUSkrWfOrhAU6i0FQnjOlLBtV8hsbAT6F8fh7DIbxJq9alPj1UBo8qJ40gAmIUmmRl8s30PzyQI
	abGgRthpKDDn6QJ1Aw4iimIMxptabgeWlHxcBqF2NQyofF31A8K+kh0J5jXMmQ4MZHxqsUIamck
	s+N+BtNwweOwx9aMSri3CadK27k/lXreDmG8aismIoAt5Zrhqe9XqX9/sBxv4ZheJ0idhT36QSk
	RCFWufZARl67yuGL8bfTD3ctyR3Y0z+3tBDMTwikN+qXbJ9VRlyRhGuDiw7vFYI9TMQMIBd5Y0V
	bcDbV4SJKSg5C+80rSUCjub5d5u3vlEJrJUBWqNAnHSwrJHVosHxiFKZdM2ovvxeXDJENnCID/3
	uLrj8CrEdlP+vn0WRPlnjuiRJ4x/pKQsGRR+vPopMsUyfeyHW0C/tKBy6zs86AhLTA6rmQJCiuc
	IvUcaWqHiY2MmmP4arRBuISKIoJj77NaOLCPqQpT/XOQ7BmwKbcAn64xRYOU7OgHVFPkV+8EYWo
	uW383xOvTKabUcM/j1mcq30YGk5IELP7OrbiGD+iudGeCXt3A+4hHMrlDyZRLvVoVuSNEtD+9Yw
	tkdHE+9+8+He7hZLk+hu8bk+OqCjr0pDTKG0ZYpxR+2b5sr1e2Fck=
X-Received: by 2002:a05:6808:4441:b0:4f4:73a9:f838 with SMTP id 5614622812f47-5683c9bbba4mr1481876b6e.22.1794296677454;
        Mon, 09 Nov 2026 23:44:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:18 -0700
Subject: [PATCH v2 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-15-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.15.2

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
metadata cleanup to the final put, including registration-failure
unwinding.

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
 drivers/mtd/nand/raw/tegra_nand.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 1104d75b6cbe..5130bee46d60 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1064,11 +1064,16 @@ static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.setup_interface = tegra_nand_setup_interface,
 };
 
+static void tegra_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct tegra_nand_chip, chip));
+}
+
 static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *np_nand;
+	struct device_node *np_nand __free(device_node) = NULL;
 	int nsels, nchips = of_get_child_count(np);
 	struct tegra_nand_chip *nand;
 	struct mtd_info *mtd;
@@ -1096,7 +1101,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1107,7 +1112,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
@@ -1127,20 +1132,35 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_release(chip, tegra_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	ctrl->chip = chip;
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
+}
+
+static void tegra_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct tegra_nand_controller, controller));
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
@@ -1149,13 +1169,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, tegra_nand_release);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1235,13 +1257,14 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
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

